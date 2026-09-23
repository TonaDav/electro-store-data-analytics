-- ============================================================
-- ELECTRO STORE - CREACIÓN DE TABLAS
-- Orden respetando dependencias de Foreign Keys
-- ============================================================

-- ============================================================
-- 1. CATEGORIAS
-- ============================================================
CREATE TABLE Categorias (
    CategoriaID INT IDENTITY(1,1) PRIMARY KEY,
    NombreCategoria NVARCHAR(50) NOT NULL
);
GO

-- ============================================================
-- 2. SUBCATEGORIAS
-- ============================================================
CREATE TABLE Subcategorias (
    SubcategoriaID INT IDENTITY(1,1) PRIMARY KEY,
    NombreSubcategoria NVARCHAR(50) NOT NULL,
    CategoriaID INT NOT NULL,
    CONSTRAINT FK_Subcategorias_Categorias FOREIGN KEY (CategoriaID)
        REFERENCES Categorias(CategoriaID)
);
GO

-- ============================================================
-- 3. PRODUCTOS
-- ============================================================
CREATE TABLE Productos (
    ProductoID INT IDENTITY(1,1) PRIMARY KEY,
    NombreProducto NVARCHAR(150) NOT NULL,
    SubcategoriaID INT NOT NULL,
    PrecioUnitario DECIMAL(10,2) NOT NULL,
    CostoUnitario DECIMAL(10,2) NOT NULL,
    CONSTRAINT FK_Productos_Subcategorias FOREIGN KEY (SubcategoriaID)
        REFERENCES Subcategorias(SubcategoriaID),
    CONSTRAINT CK_Productos_Precios CHECK (PrecioUnitario > CostoUnitario)
);
GO

-- ============================================================
-- 4. TIENDAS
-- ============================================================
CREATE TABLE Tiendas (
    TiendaID INT IDENTITY(1,1) PRIMARY KEY,
    NombreTienda NVARCHAR(100) NOT NULL,
    Departamento NVARCHAR(50) NULL,
    Provincia NVARCHAR(50) NULL,
    Distrito NVARCHAR(50) NULL,
    Latitud DECIMAL(9,6) NULL,
    Longitud DECIMAL(9,6) NULL,
    TipoTienda NVARCHAR(20) NOT NULL,
    CONSTRAINT CK_Tiendas_Tipo CHECK (TipoTienda IN ('Física', 'Online'))
);
GO

-- ============================================================
-- 5. METODOPAGO
-- ============================================================
CREATE TABLE MetodoPago (
    MetodoPagoID INT IDENTITY(1,1) PRIMARY KEY,
    NombreMetodo NVARCHAR(30) NOT NULL
);
GO

-- ============================================================
-- 6. CLIENTES
-- ============================================================
CREATE TABLE Clientes (
    ClienteID INT IDENTITY(1,1) PRIMARY KEY,
    Nombres NVARCHAR(50) NOT NULL,
    Apellidos NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100) NOT NULL,
    Telefono NVARCHAR(15) NULL,
    FechaNacimiento DATE NOT NULL,
    Genero NVARCHAR(15) NOT NULL,
    Departamento NVARCHAR(50) NOT NULL,
    Provincia NVARCHAR(50) NOT NULL,
    Distrito NVARCHAR(50) NULL,
    TipoCliente NVARCHAR(10) NOT NULL,
    SegmentoCliente NVARCHAR(15) NOT NULL,
    FechaRegistro DATE NOT NULL,
    CONSTRAINT CK_Clientes_TipoCliente CHECK (TipoCliente IN ('Persona', 'Empresa')),
    CONSTRAINT CK_Clientes_Segmento CHECK (SegmentoCliente IN ('Retail', 'Mayorista')),
    CONSTRAINT CK_Clientes_Genero CHECK (Genero IN ('Masculino', 'Femenino'))
);
GO

-- ============================================================
-- 7. CALENDARIO
-- ============================================================
CREATE TABLE Calendario (
    Fecha DATE NOT NULL PRIMARY KEY
);
GO

-- ============================================================
-- 8. INVENTARIO
-- ============================================================
CREATE TABLE Inventario (
    InventarioID INT IDENTITY(1,1) PRIMARY KEY,
    ProductoID INT NOT NULL,
    TiendaID INT NOT NULL,
    StockActual INT NOT NULL,
    StockMinimo INT NOT NULL,
    FechaActualizacion DATE NOT NULL,
    CONSTRAINT FK_Inventario_Productos FOREIGN KEY (ProductoID)
        REFERENCES Productos(ProductoID),
    CONSTRAINT FK_Inventario_Tiendas FOREIGN KEY (TiendaID)
        REFERENCES Tiendas(TiendaID),
    CONSTRAINT CK_Inventario_Stock CHECK (StockActual >= 0 AND StockMinimo >= 0),
    CONSTRAINT UQ_Inventario_ProductoTienda UNIQUE (ProductoID, TiendaID)
);
GO

-- ============================================================
-- 9. TRANSACCIONES
-- ============================================================
CREATE TABLE Transacciones (
    TransaccionID INT IDENTITY(1,1) PRIMARY KEY,
    Fecha DATE NOT NULL,
    ClienteID INT NOT NULL,
    ProductoID INT NOT NULL,
    TiendaID INT NOT NULL,
    MetodoPagoID INT NOT NULL,
    Cantidad INT NOT NULL,
    PrecioUnitario DECIMAL(10,2) NOT NULL,
    Descuento DECIMAL(10,2) NOT NULL DEFAULT 0,
    Subtotal DECIMAL(10,2) NOT NULL,
    IGV DECIMAL(10,2) NOT NULL,
    Total DECIMAL(10,2) NOT NULL,
    CanalVenta NVARCHAR(10) NOT NULL,
    CONSTRAINT FK_Transacciones_Fecha FOREIGN KEY (Fecha)
        REFERENCES Calendario(Fecha),
    CONSTRAINT FK_Transacciones_Clientes FOREIGN KEY (ClienteID)
        REFERENCES Clientes(ClienteID),
    CONSTRAINT FK_Transacciones_Productos FOREIGN KEY (ProductoID)
        REFERENCES Productos(ProductoID),
    CONSTRAINT FK_Transacciones_Tiendas FOREIGN KEY (TiendaID)
        REFERENCES Tiendas(TiendaID),
    CONSTRAINT FK_Transacciones_MetodoPago FOREIGN KEY (MetodoPagoID)
        REFERENCES MetodoPago(MetodoPagoID),
    CONSTRAINT CK_Transacciones_Canal CHECK (CanalVenta IN ('Tienda', 'Online')),
    CONSTRAINT CK_Transacciones_Cantidad CHECK (Cantidad > 0)
);
GO

-- ============================================================
-- 10. DEVOLUCIONES
-- ============================================================
CREATE TABLE Devoluciones (
    DevolucionID INT IDENTITY(1,1) PRIMARY KEY,
    TransaccionID INT NOT NULL,
    Fecha DATE NOT NULL,
    Motivo NVARCHAR(50) NOT NULL,
    CantidadDevuelta INT NOT NULL,
    MontoDevuelto DECIMAL(10,2) NOT NULL,
    CONSTRAINT FK_Devoluciones_Transacciones FOREIGN KEY (TransaccionID)
        REFERENCES Transacciones(TransaccionID),
    CONSTRAINT FK_Devoluciones_Fecha FOREIGN KEY (Fecha)
        REFERENCES Calendario(Fecha),
    CONSTRAINT CK_Devoluciones_Cantidad CHECK (CantidadDevuelta > 0),
    CONSTRAINT CK_Devoluciones_Monto CHECK (MontoDevuelto >= 0)
);
GO
