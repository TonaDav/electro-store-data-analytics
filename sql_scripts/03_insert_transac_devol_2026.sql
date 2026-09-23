-- ============================================================
-- ELECTRO STORE - TRANSACCIONES Y DEVOLUCIONES 2026
-- Script INCREMENTAL: ejecutar DESPUÉS de 02_insert_data.sql
-- No modifica ni borra los datos de 2024/2025 ya generados.
--
-- Genera 3,500 transacciones fechadas en 2026 (01-ene a 31-dic)
-- y ~175 devoluciones asociadas (~5%), reutilizando la misma
-- lógica de Pareto (60/40) y estacionalidad ya validada.
-- ============================================================

USE electroStoreDB;
GO

-- ============================================================
-- TRANSACCIONES 2026 (3,500 registros)
-- ============================================================
DECLARE @ClientesVIP TABLE (ClienteID INT);
INSERT INTO @ClientesVIP
SELECT TOP 80 ClienteID FROM Clientes ORDER BY ClienteID;

DECLARE @PesosMes TABLE (Mes INT, Peso INT);
INSERT INTO @PesosMes VALUES
(1, 8), (2, 7), (3, 10), (4, 8), (5, 8), (6, 9),
(7, 18), (8, 9), (9, 8), (10, 15), (11, 16), (12, 20);

DECLARE @i INT = 1;

WHILE @i <= 3500
BEGIN
    DECLARE @MesElegido INT, @FechaTx DATE, @ClienteSel INT, @ProductoSel INT;
    DECLARE @TiendaSel INT, @MetodoSel INT, @CantidadSel INT;
    DECLARE @PrecioSel DECIMAL(10,2), @DescuentoSel DECIMAL(10,2);
    DECLARE @SubtotalSel DECIMAL(10,2), @IGVSel DECIMAL(10,2), @TotalSel DECIMAL(10,2);
    DECLARE @CanalSel NVARCHAR(10);
    DECLARE @RandMetodo INT, @RandDescuento INT;

    DECLARE @PesoTotal INT = (SELECT SUM(Peso) FROM @PesosMes);
    DECLARE @RandPeso INT = 1 + (ABS(CHECKSUM(NEWID())) % @PesoTotal);
    DECLARE @Acumulado INT = 0;

    SELECT TOP 1 @MesElegido = Mes
    FROM (
        SELECT Mes, Peso,
               SUM(Peso) OVER (ORDER BY Mes ROWS UNBOUNDED PRECEDING) AS Acum
        FROM @PesosMes
    ) x
    WHERE @RandPeso <= Acum
    ORDER BY Acum ASC;

    -- Año fijo: 2026 (a diferencia del script original que alternaba 2024/2025)
    SET @FechaTx = DATEFROMPARTS(2026, @MesElegido, 1 + (ABS(CHECKSUM(NEWID())) % 28));

    IF ABS(CHECKSUM(NEWID())) % 100 < 60
        SELECT TOP 1 @ClienteSel = ClienteID FROM @ClientesVIP ORDER BY NEWID();
    ELSE
        SELECT TOP 1 @ClienteSel = ClienteID FROM Clientes
        WHERE ClienteID NOT IN (SELECT ClienteID FROM @ClientesVIP)
        ORDER BY NEWID();

    SELECT TOP 1 @ProductoSel = ProductoID, @PrecioSel = PrecioUnitario
    FROM Productos ORDER BY NEWID();

    SELECT TOP 1 @TiendaSel = TiendaID FROM Tiendas ORDER BY NEWID();
    SET @CanalSel = CASE WHEN @TiendaSel = 8 THEN 'Online' ELSE 'Tienda' END;

    SET @RandMetodo = ABS(CHECKSUM(NEWID())) % 100;
    SET @MetodoSel = CASE
        WHEN @RandMetodo < 30 THEN 4
        WHEN @RandMetodo < 52 THEN 1
        WHEN @RandMetodo < 70 THEN 3
        WHEN @RandMetodo < 85 THEN 2
        WHEN @RandMetodo < 95 THEN 5
        ELSE 6
    END;

    SET @CantidadSel = CASE
        WHEN ABS(CHECKSUM(NEWID())) % 100 < 75 THEN 1 + (ABS(CHECKSUM(NEWID())) % 2)
        WHEN ABS(CHECKSUM(NEWID())) % 100 < 95 THEN 3 + (ABS(CHECKSUM(NEWID())) % 3)
        ELSE 6 + (ABS(CHECKSUM(NEWID())) % 10)
    END;

    SET @RandDescuento = ABS(CHECKSUM(NEWID())) % 100;
    SET @SubtotalSel = @PrecioSel * @CantidadSel;
    SET @DescuentoSel = CASE
        WHEN @RandDescuento < 15 THEN ROUND(@SubtotalSel * (0.05 + (ABS(CHECKSUM(NEWID())) % 15) / 100.0), 2)
        ELSE 0
    END;

    SET @IGVSel = ROUND((@SubtotalSel - @DescuentoSel) * 0.18, 2);
    SET @TotalSel = @SubtotalSel - @DescuentoSel + @IGVSel;

    INSERT INTO Transacciones (Fecha, ClienteID, ProductoID, TiendaID, MetodoPagoID,
                                Cantidad, PrecioUnitario, Descuento, Subtotal, IGV, Total, CanalVenta)
    VALUES (@FechaTx, @ClienteSel, @ProductoSel, @TiendaSel, @MetodoSel,
            @CantidadSel, @PrecioSel, @DescuentoSel, @SubtotalSel, @IGVSel, @TotalSel, @CanalSel);

    SET @i += 1;
END;
GO

-- ============================================================
-- DEVOLUCIONES 2026 (175 registros, ~5% de las 3,500 nuevas)
-- Toma transacciones SIN devolución de TODA la tabla (protege
-- también las de 2024/2025 que ya podrían no tener devolución),
-- pero al ejecutarse ahora naturalmente prioriza las nuevas al
-- ser la mayoría de filas "disponibles" recientes.
-- ============================================================
DECLARE @Motivos TABLE (Motivo NVARCHAR(50));
INSERT INTO @Motivos VALUES
('Producto defectuoso'),
('No compatible con proyecto'),
('Llegó dañado'),
('Cambio de talla/modelo'),
('Error en el pedido'),
('Producto no cumple especificaciones'),
('Cliente se arrepintió');

DECLARE @j INT = 1;

WHILE @j <= 175
BEGIN
    DECLARE @TxSel INT, @FechaCompra DATE, @FechaDevol DATE;
    DECLARE @CantidadTx INT, @PrecioTx DECIMAL(10,2), @CantidadDevSel INT;
    DECLARE @MotivoSel NVARCHAR(50), @MontoDevSel DECIMAL(10,2);
    DECLARE @DiasDespues INT;

    -- Solo transacciones de 2026 sin devolución, para que esta
    -- tanda quede asociada al lote que acabamos de insertar
    SELECT TOP 1 @TxSel = TransaccionID, @FechaCompra = Fecha,
                 @CantidadTx = Cantidad, @PrecioTx = PrecioUnitario
    FROM Transacciones
    WHERE YEAR(Fecha) = 2026
      AND TransaccionID NOT IN (SELECT TransaccionID FROM Devoluciones)
    ORDER BY NEWID();

    SET @DiasDespues = 1 + (ABS(CHECKSUM(NEWID())) % 20);
    SET @FechaDevol = DATEADD(DAY, @DiasDespues, @FechaCompra);

    IF @FechaDevol > '2026-12-31' SET @FechaDevol = '2026-12-31';

    SET @CantidadDevSel = CASE
        WHEN @CantidadTx = 1 THEN 1
        WHEN ABS(CHECKSUM(NEWID())) % 100 < 70 THEN @CantidadTx
        ELSE 1 + (ABS(CHECKSUM(NEWID())) % (@CantidadTx - 1))
    END;

    SELECT TOP 1 @MotivoSel = Motivo FROM @Motivos ORDER BY NEWID();

    SET @MontoDevSel = ROUND(@PrecioTx * @CantidadDevSel * 1.18, 2);

    INSERT INTO Devoluciones (TransaccionID, Fecha, Motivo, CantidadDevuelta, MontoDevuelto)
    VALUES (@TxSel, @FechaDevol, @MotivoSel, @CantidadDevSel, @MontoDevSel);

    SET @j += 1;
END;
GO

PRINT 'Transacciones y devoluciones de 2026 insertadas exitosamente.';
GO
