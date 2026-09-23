/*
====================================
Análisis Exploratorio de Datos (EDA)
====================================
*/

-- Calculamos los Ingresos Totales (S/)
SELECT 
	FORMAT(SUM(Total), 'C', 'es-PE') AS [Ingresos Totales]
FROM Transacciones

-- Calculamos el Número Total de Ventas
SELECT
	COUNT(TransaccionID) AS [Ventas Totales]
FROM Transacciones

-- Calculamos el Monto Total Devuelto (S/)
SELECT
	FORMAT(SUM(MontoDevuelto), 'C', 'es-PE') AS [Total Devuelto]
FROM Devoluciones

-- Calculamos el Número Total de Devoluciones
SELECT
	COUNT(DevolucionID) AS [Devoluciones Totales]
FROM Devoluciones

-- Calculamos el Número Total de Unidades Devueltas
SELECT
	SUM(CantidadDevuelta) AS [Unidades Totales Devueltas]
FROM Devoluciones

-- Calculamos cuántos meses de ventas tenemos para analizar
SELECT
	FORMAT(MIN(Fecha), 'dd/MM/yyyy') AS [Fecha Primera Venta],
	FORMAT(MAX(Fecha), 'dd/MM/yyyy') AS [Fecha Última Venta],
	DATEDIFF(MONTH, MIN(Fecha), MAX(Fecha)) AS Meses
FROM Transacciones

-- Calculamos cuántos meses de devoluciones tenemos para analizar
SELECT
	FORMAT(MIN(Fecha), 'dd/MM/yyyy') AS [Fecha Primera Devolución],
	FORMAT(MAX(Fecha), 'dd/MM/yyyy') AS [Fecha Última Devolución],
	DATEDIFF(MONTH, MIN(Fecha), MAX(Fecha)) AS Meses
FROM Devoluciones

-- Hallamos el número total de clientes
SELECT 
	COUNT(ClienteID) AS [Clientes Totales]
FROM Clientes

-- Hallamos el total de clientes tipo persona
SELECT 
	COUNT(ClienteID) AS [Clientes Totales]
FROM Clientes
WHERE TipoCliente = 'Persona'

-- Hallamos el total de clientes tipo empresa
SELECT 
	COUNT(ClienteID) AS [Clientes Totales]
FROM Clientes
WHERE TipoCliente = 'Empresa'

-- Hallamos el número total de productos
SELECT
	COUNT(ProductoID) AS [Productos Totales]
FROM Productos

-- Calculamos el total de productos por categoría
SELECT
	c.CategoriaID AS [Categoría ID],
	c.NombreCategoria AS [Categoría],
	x.TotalProductos AS [Productos Totales]
FROM 
	(
	SELECT
		CategoriaID,
		SUM(TotalProductos) AS TotalProductos
	FROM 
		(
		SELECT
			p.SubcategoriaID,
			s.CategoriaID AS CategoriaID,
			COUNT(p.ProductoID) AS TotalProductos
		FROM Productos p
		LEFT JOIN Subcategorias s
		ON p.SubcategoriaID = s.SubcategoriaID
		GROUP BY p.SubcategoriaID, s.CategoriaID
		) t
	GROUP BY CategoriaID
	) x
LEFT JOIN Categorias c
ON x.CategoriaID = c.CategoriaID

-- Calculamos el total de ingresos por categoría
SELECT
	c.CategoriaID AS [Categoría ID],
	c.NombreCategoria AS [Categoría],
	FORMAT(y.Ingresos, 'C', 'es-PE') AS [Ingresos Totales]
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
ORDER BY y.Ingresos DESC

-- Calculamos los ingresos totales por método de pago
SELECT
	m.MetodoPagoID AS [Método ID], 
	m.NombreMetodo AS [Método de Pago],
	FORMAT(SUM(Total), 'C', 'es-PE') AS [Ingresos Totales]
FROM Transacciones t
LEFT JOIN MetodoPago m 
ON t.MetodoPagoID = m.MetodoPagoID
GROUP BY m.MetodoPagoID, m.NombreMetodo
ORDER BY [Ingresos Totales] DESC

-- Calculamos los ingresos totales por tienda
SELECT
	ti.NombreTienda AS [Nombre de Tienda],
	ti.Departamento AS [Departamento],
	FORMAT(SUM(Total), 'C', 'es-PE') AS [Ingresos Totales]
FROM Transacciones tr
LEFT JOIN Tiendas ti
ON tr.TiendaID = ti.TiendaID
GROUP BY ti.NombreTienda, ti.Departamento
ORDER BY [Ingresos Totales] DESC

-- Hallamos al cliente más joven y al más adulto
SELECT
	ClienteID,
	CONCAT(Nombres, ' ', Apellidos) AS [Nombre Completo],
	Email,
	DATEDIFF(YEAR, FechaNacimiento, GETDATE()) AS Edad
FROM Clientes
WHERE FechaNacimiento = (SELECT MAX(FechaNacimiento) FROM Clientes WHERE TipoCliente = 'Persona')
UNION ALL
SELECT
	ClienteID,
	CONCAT(Nombres, ' ', Apellidos) AS [Nombre Completo],
	Email,
	DATEDIFF(YEAR, FechaNacimiento, GETDATE()) AS Edad
FROM Clientes
WHERE TipoCliente = 'Persona' AND FechaNacimiento = (SELECT MIN(FechaNacimiento) FROM Clientes WHERE TipoCliente = 'Persona')

-- Calculamos el total de clientes por departamento
SELECT
	Departamento,
	COUNT(ClienteID) AS [Clientes Totales]
FROM Clientes
GROUP BY Departamento
ORDER BY COUNT(ClienteID) DESC

-- Hallamos al cliente (tipo persona o empresa) más antiguo y más nuevo
SELECT
	ClienteID,
	CONCAT(Nombres, ' ', Apellidos) AS [Nombre Completo],
	Email,
	DATEDIFF(YEAR, FechaNacimiento, GETDATE()) AS Edad
FROM Clientes
WHERE FechaRegistro = (SELECT MIN(FechaRegistro) FROM Clientes)
UNION ALL
SELECT
	ClienteID,
	CONCAT(Nombres, ' ', Apellidos) AS [Nombre Completo],
	Email,
	DATEDIFF(YEAR, FechaRegistro, GETDATE()) AS [Años]
FROM Clientes
WHERE FechaRegistro = (SELECT MAX(FechaRegistro) FROM Clientes)
GO