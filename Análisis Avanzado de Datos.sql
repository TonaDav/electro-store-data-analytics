/*
==========================
Análisis Avanzado de Datos
==========================
*/

-- Hallamos la evolución de ingresos mensuales (Enero 2024 - Diciembre 2026)
SELECT
	FORMAT(EOMONTH(Fecha), 'dd/MM/yyyy') AS Mes,
	FORMAT(SUM(Total), 'C', 'es-PE') AS [Ingresos Mensuales]
FROM Transacciones
GROUP BY EOMONTH(Fecha)
ORDER BY EOMONTH(Fecha)

-- Hallamos la evolución de unidades vendidas mensuales (Enero 2024- Diciembre 2026)
SELECT
	FORMAT(EOMONTH(Fecha), 'dd/MM/yyyy') AS Mes,
	SUM(Cantidad) AS [Unidades Vendidas]
FROM Transacciones
GROUP BY EOMONTH(Fecha)
ORDER BY EOMONTH(Fecha)

-- Calculamos los ingresos anuales y el total acumulado de ingresos
SELECT
	t.Año,
	FORMAT(t.IngresosAnuales, 'C', 'es-PE') AS [Ingresos Anuales],
	FORMAT(SUM(t.IngresosAnuales) OVER(ORDER BY t.Año), 'C', 'es-PE') AS [Ingresos Acumulados]
FROM
	(
	SELECT
		YEAR(Fecha) AS Año,
		SUM(Total) AS IngresosAnuales
	FROM Transacciones
	GROUP BY YEAR(Fecha)
	) t

-- Hallamos las categorías de productos que contribuyen más ingresos
WITH ingresos_por_categoria AS (
SELECT
	c.CategoriaID AS [Categoría ID],
	c.NombreCategoria AS [Categoría],
	y.Ingresos AS Ingresos
FROM
	(
	SELECT
		s.CategoriaID,
		SUM(x.Ingresos) AS Ingresos
	FROM
		(
		SELECT
			p.ProductoID,
			p.SubcategoriaID,
			SUM(Total) AS Ingresos
		FROM Transacciones t
		LEFT JOIN Productos p
		ON t.ProductoID = p.ProductoID
		GROUP BY p.ProductoID, p.SubcategoriaID
		) x
	LEFT JOIN Subcategorias s
	ON x.SubcategoriaID = s.SubcategoriaID
	GROUP BY s.CategoriaID
	) y
LEFT JOIN Categorias c
ON y.CategoriaID = c.CategoriaID
)
SELECT
	Categoría,
	FORMAT(Ingresos, 'C', 'es-PE') AS [Ingresos por Categoría],
	FORMAT(SUM(Ingresos) OVER(), 'C', 'es-PE') AS [Ingresos Totales],
	FORMAT((Ingresos / SUM(Ingresos) OVER()), 'P') AS Porcentaje
FROM ingresos_por_categoria
ORDER BY Ingresos DESC;
GO

-- Segmentamos los productos según su costo y hallamos cuántos productos hay en cada segmento
WITH segmento_productos_por_costo AS (
SELECT
	ProductoID,
	NombreProducto,
	CostoUnitario,
	CASE
		WHEN CostoUnitario < 50 THEN 'Bajo Costo'
		WHEN CostoUnitario BETWEEN 50 AND 100 THEN 'Costo Medio'
		WHEN CostoUnitario > 100 THEN 'Alto Costo'
	END AS NivelCosto
FROM Productos
)
SELECT
	COUNT(ProductoID) AS [Productos Totales],
	NivelCosto AS [Nivel de Costo]
FROM segmento_productos_por_costo
GROUP BY NivelCosto;
GO

-- Segmentamos a los clientes según su comportamiento:
-- Dorado: Aquellos cuyas compras superan los S/ 7500
-- Plata: Aquellos cuyas compras están entre S/ 3000 y S/ 7500
-- Bronce: Aquellos cuyas compras están por debajo de S/ 3000 
-- Contamos cuántpos hay en cada segmento
WITH segmento_clientes_comportamiento_compra AS (
SELECT
	c.ClienteID,
	SUM(t.Total) AS Total,
	CASE
		WHEN SUM(t.Total) < 3000 THEN 'Bronce'
		WHEN SUM(t.Total) BETWEEN 3000 AND 7500 THEN 'Plata'
		WHEN SUM(t.Total) > 7500 THEN 'Dorado'
	END AS Nivel
FROM Transacciones t
LEFT JOIN Clientes c
ON t.ClienteID = c.ClienteID
GROUP BY c.ClienteID
)
SELECT
	Nivel,
	COUNT(ClienteID) AS [Total de Clientes]
FROM segmento_clientes_comportamiento_compra
GROUP BY Nivel;
GO

-- Calculamos la tasa de devolución por categoría
SELECT
	c.CategoriaID,
	c.NombreCategoria,
	COUNT(d.DevolucionID) AS [Devoluciones Totales],
	COUNT(t.TransaccionID) AS [Ventas Totales],
	ROUND(COUNT(d.DevolucionID) * 100.0 / COUNT(t.TransaccionID), 2) AS [Tasa Devolución]
FROM Transacciones t 
LEFT JOIN Productos p
ON t.ProductoID = p.ProductoID
LEFT JOIN Subcategorias s
ON p.SubcategoriaID = s.SubcategoriaID
LEFT JOIN Categorias c
ON s.CategoriaID = c.CategoriaID
LEFT JOIN Devoluciones d
ON d.TransaccionID = t.TransaccionID
GROUP BY c.CategoriaID, c.NombreCategoria
ORDER BY [Tasa Devolución] DESC;
GO

-- Generamos el Reporte Final de Clientes
CREATE VIEW reporte_clientes AS
WITH consulta_base AS (
SELECT
	t.TransaccionID AS TransaccionID,
	t.ProductoID AS ProductoID,
	t.Cantidad AS Cantidad,
	t.Total AS Total,
	t.Fecha AS Fecha,
	c.ClienteID AS ClienteID,
	c.Nombres AS Nombres,
	c.Apellidos AS Apellidos,
	c.TipoCliente AS TipoCliente,
	c.SegmentoCliente AS SegmentoCliente
FROM Transacciones t
LEFT JOIN Clientes c
ON t.ClienteID = c.ClienteID
),
agregacion_clientes AS (
SELECT
	ClienteID,
	Nombres,
	Apellidos,
	TipoCliente,
	SegmentoCliente,
	SUM(Total) AS IngresosGenerados,
	SUM(Cantidad) AS CantidadComprada,
	MAX(Fecha) AS FechaUltimaCompra,
	COUNT(TransaccionID) AS PedidosTotales,
	AVG(Total) AS ValorPromedioPedidos
FROM consulta_base
GROUP BY ClienteID, Nombres, Apellidos, TipoCliente, SegmentoCliente
)
SELECT
	ClienteID,
	Nombres,
	Apellidos,
	FORMAT(IngresosGenerados, 'C', 'es-PE') [Ingresos Totales Generados],
	CantidadComprada [Unidades Totales Compradas],
	FORMAT(FechaUltimaCompra, 'dd/MM/yyyy') [Fecha Última Compra],
	PedidosTotales [Pedidos Totales],
	FORMAT(ValorPromedioPedidos, 'C', 'es-PE') [Valor Promedio de Pedidos],
	CASE
		WHEN IngresosGenerados < 3000 THEN 'Bronce'
		WHEN IngresosGenerados BETWEEN 3000 AND 7500 THEN 'Plata'
		WHEN IngresosGenerados > 7500 THEN 'Dorado'
	END AS Nivel,
	TipoCliente [Tipo de Cliente],
	SegmentoCliente [Segmento de Cliente]
FROM agregacion_clientes

-- Generamos el Reporte Final de Productos
CREATE VIEW reporte_productos AS
WITH consulta_base AS (
SELECT
	t.TransaccionID AS TransaccionID,
	t.ProductoID AS ProductoID,
	t.Total AS Total,
	t.Cantidad AS Cantidad,
	t.Fecha,
	p.NombreProducto AS NombreProducto,
	p.CostoUnitario AS CostoUnitario,
	p.PrecioUnitario AS PrecioUnitario,
	p.SubcategoriaID AS SubcategoriaID,
	s.NombreSubcategoria AS Subcategoria,
	s.CategoriaID AS CategoriaID,
	c.NombreCategoria AS Categoria
FROM Transacciones t
LEFT JOIN Productos p
ON t.ProductoID = p.ProductoID
LEFT JOIN Subcategorias s
ON s.SubcategoriaID = p.SubcategoriaID
LEFT JOIN Categorias c
ON s.CategoriaID = c.CategoriaID
),
agregacion_productos AS (
SELECT
	ProductoID,
	NombreProducto,
	CostoUnitario,
	PrecioUnitario,
	FORMAT(MAX(Fecha), 'dd/MM/yyyy') AS FechaUltimoPedido, 
	SUM(Total) AS IngresosGenerados,
	SUM(Cantidad) AS UnidadesVendidas,
	COUNT(TransaccionID) AS PedidosTotales,
	SUM(Total) / SUM(Cantidad) AS ValorPromedioPedido,
	Subcategoria,
	Categoria
FROM consulta_base
GROUP BY ProductoID, NombreProducto, CostoUnitario, PrecioUnitario, Subcategoria, Categoria
)
SELECT
	ProductoID AS [Producto ID],
	NombreProducto AS Nombre,
	FORMAT(CostoUnitario, 'C', 'es-PE') AS [Costo Unitario],
	FORMAT(PrecioUnitario, 'C', 'es-PE') AS [Precio Unitario],
	FechaUltimoPedido AS [Último Pedido],
	FORMAT(IngresosGenerados, 'C', 'es-PE') AS [Ingresos Generados],
	UnidadesVendidas AS [Unidades Vendidas],
	PedidosTotales AS [Pedidos Totales],
	FORMAT(ValorPromedioPedido, 'C', 'es-PE') AS [Valor Promedio por Pedido],
	CASE
		WHEN CostoUnitario < 50 THEN 'Bajo'
		WHEN CostoUnitario BETWEEN 50 AND 100 THEN 'Medio'
		WHEN CostoUnitario > 100 THEN 'Alto'
	END AS [Nivel de Costo],
	CASE
		WHEN IngresosGenerados > 30000 THEN 'Alto'
		WHEN IngresosGenerados >= 7500 THEN 'Medio'
		ELSE 'Bajo'
	END AS [Nivel deDesempeño],
	Subcategoria AS Subcategoría,
	Categoria AS Categoría
FROM agregacion_productos
GO

-- Generamos el Reporte Final de Tiendas
CREATE VIEW reporte_tiendas AS
SELECT
	ti.TiendaID AS [Tienda ID],
	ti.NombreTienda AS [Nombre de Tienda],
	ti.TipoTienda AS [Tipo de Tienda],
	ti.Departamento AS [Departamento],
	FORMAT(SUM(Total), 'C', 'es-PE') AS [Ingresos Totales],
	FORMAT(SUM(Cantidad), 'N0') AS [Unidades Vendidas]
FROM Transacciones tr
LEFT JOIN Tiendas ti
ON tr.TiendaID = ti.TiendaID
GROUP BY ti.TiendaID, ti.NombreTienda, ti.TipoTienda, ti.Departamento