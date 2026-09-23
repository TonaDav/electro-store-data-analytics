-- ============================================================
-- ELECTRO STORE - CARGA DE DATOS
-- Ejecutar DESPUES de 01_create_tables.sql, en este orden
-- ============================================================

-- ============================================================
-- 1. CATEGORIAS (7 registros)
-- ============================================================
INSERT INTO Categorias (NombreCategoria) VALUES
('Módulos y Sensores'),
('Componentes Electrónicos'),
('Placas de Desarrollo'),
('Fuentes y Energía'),
('Computación Embebida / SBC'),
('Motores y Movimiento'),
('Robótica y Kits');
GO

-- ============================================================
-- 2. SUBCATEGORIAS (30 registros)
-- ============================================================
INSERT INTO Subcategorias (NombreSubcategoria, CategoriaID) VALUES
('Sensores', (SELECT CategoriaID FROM Categorias WHERE NombreCategoria = 'Módulos y Sensores')),
('Actuadores', (SELECT CategoriaID FROM Categorias WHERE NombreCategoria = 'Módulos y Sensores')),
('Comunicación', (SELECT CategoriaID FROM Categorias WHERE NombreCategoria = 'Módulos y Sensores')),
('Interfaz de Usuario', (SELECT CategoriaID FROM Categorias WHERE NombreCategoria = 'Módulos y Sensores')),
('Potencia y Control', (SELECT CategoriaID FROM Categorias WHERE NombreCategoria = 'Módulos y Sensores')),
('Resistencias', (SELECT CategoriaID FROM Categorias WHERE NombreCategoria = 'Componentes Electrónicos')),
('Capacitores', (SELECT CategoriaID FROM Categorias WHERE NombreCategoria = 'Componentes Electrónicos')),
('Semiconductores', (SELECT CategoriaID FROM Categorias WHERE NombreCategoria = 'Componentes Electrónicos')),
('Circuitos Integrados', (SELECT CategoriaID FROM Categorias WHERE NombreCategoria = 'Componentes Electrónicos')),
('Prototipado', (SELECT CategoriaID FROM Categorias WHERE NombreCategoria = 'Componentes Electrónicos')),
('Arduino', (SELECT CategoriaID FROM Categorias WHERE NombreCategoria = 'Placas de Desarrollo')),
('ESP32', (SELECT CategoriaID FROM Categorias WHERE NombreCategoria = 'Placas de Desarrollo')),
('micro:bit', (SELECT CategoriaID FROM Categorias WHERE NombreCategoria = 'Placas de Desarrollo')),
('STM32 / FPGA', (SELECT CategoriaID FROM Categorias WHERE NombreCategoria = 'Placas de Desarrollo')),
('Programación y Depuración', (SELECT CategoriaID FROM Categorias WHERE NombreCategoria = 'Placas de Desarrollo')),
('Baterías', (SELECT CategoriaID FROM Categorias WHERE NombreCategoria = 'Fuentes y Energía')),
('Fuentes AC-DC', (SELECT CategoriaID FROM Categorias WHERE NombreCategoria = 'Fuentes y Energía')),
('Cargadores', (SELECT CategoriaID FROM Categorias WHERE NombreCategoria = 'Fuentes y Energía')),
('Generación de Energía', (SELECT CategoriaID FROM Categorias WHERE NombreCategoria = 'Fuentes y Energía')),
('Iluminación', (SELECT CategoriaID FROM Categorias WHERE NombreCategoria = 'Fuentes y Energía')),
('Raspberry Pi', (SELECT CategoriaID FROM Categorias WHERE NombreCategoria = 'Computación Embebida / SBC')),
('Jetson', (SELECT CategoriaID FROM Categorias WHERE NombreCategoria = 'Computación Embebida / SBC')),
('Motores DC', (SELECT CategoriaID FROM Categorias WHERE NombreCategoria = 'Motores y Movimiento')),
('Motores Paso a Paso', (SELECT CategoriaID FROM Categorias WHERE NombreCategoria = 'Motores y Movimiento')),
('Servomotores', (SELECT CategoriaID FROM Categorias WHERE NombreCategoria = 'Motores y Movimiento')),
('Brushless', (SELECT CategoriaID FROM Categorias WHERE NombreCategoria = 'Motores y Movimiento')),
('Accesorios de Movimiento', (SELECT CategoriaID FROM Categorias WHERE NombreCategoria = 'Motores y Movimiento')),
('Chasis', (SELECT CategoriaID FROM Categorias WHERE NombreCategoria = 'Robótica y Kits')),
('Drones', (SELECT CategoriaID FROM Categorias WHERE NombreCategoria = 'Robótica y Kits')),
('Kits Educativos', (SELECT CategoriaID FROM Categorias WHERE NombreCategoria = 'Robótica y Kits'));
GO

-- ============================================================
-- 3. PRODUCTOS (90 registros)
-- ============================================================
INSERT INTO Productos (NombreProducto, SubcategoriaID, PrecioUnitario, CostoUnitario) VALUES
('Sensor Ultrasónico HC-SR04', (SELECT SubcategoriaID FROM Subcategorias WHERE NombreSubcategoria = 'Sensores'), 12, 5),
('Sensor de Temperatura y Humedad DHT22', (SELECT SubcategoriaID FROM Subcategorias WHERE NombreSubcategoria = 'Sensores'), 25, 11),
('Sensor de Movimiento PIR HC-SR501', (SELECT SubcategoriaID FROM Subcategorias WHERE NombreSubcategoria = 'Sensores'), 15, 6),
('Sensor de Gas MQ-2', (SELECT SubcategoriaID FROM Subcategorias WHERE NombreSubcategoria = 'Sensores'), 18, 8),
('Módulo GPS NEO-6M', (SELECT SubcategoriaID FROM Subcategorias WHERE NombreSubcategoria = 'Sensores'), 45, 20),
('Sensor de Luz LDR con Módulo', (SELECT SubcategoriaID FROM Subcategorias WHERE NombreSubcategoria = 'Sensores'), 8, 3),
('Sensor de Corriente ACS712', (SELECT SubcategoriaID FROM Subcategorias WHERE NombreSubcategoria = 'Sensores'), 22, 9),
('Sensor de Presión BMP280', (SELECT SubcategoriaID FROM Subcategorias WHERE NombreSubcategoria = 'Sensores'), 20, 8),
('Módulo IMU MPU6050', (SELECT SubcategoriaID FROM Subcategorias WHERE NombreSubcategoria = 'Sensores'), 28, 12),
('Sensor RFID RC522', (SELECT SubcategoriaID FROM Subcategorias WHERE NombreSubcategoria = 'Sensores'), 24, 10),
('Sensor de Detección mmWave C4001', (SELECT SubcategoriaID FROM Subcategorias WHERE NombreSubcategoria = 'Sensores'), 84, 40),
('Módulo Cámara ESP32-S3 con IA', (SELECT SubcategoriaID FROM Subcategorias WHERE NombreSubcategoria = 'Sensores'), 135, 65),
('Display LCD 16x2 con I2C', (SELECT SubcategoriaID FROM Subcategorias WHERE NombreSubcategoria = 'Actuadores'), 18, 7),
('Módulo Relé 4 Canales 5V', (SELECT SubcategoriaID FROM Subcategorias WHERE NombreSubcategoria = 'Actuadores'), 15, 6),
('Buzzer Activo 5V', (SELECT SubcategoriaID FROM Subcategorias WHERE NombreSubcategoria = 'Actuadores'), 5, 2),
('Módulo Bluetooth HC-05', (SELECT SubcategoriaID FROM Subcategorias WHERE NombreSubcategoria = 'Comunicación'), 20, 9),
('Módulo WiFi ESP8266', (SELECT SubcategoriaID FROM Subcategorias WHERE NombreSubcategoria = 'Comunicación'), 16, 7),
('Módulo LoRa SX1278', (SELECT SubcategoriaID FROM Subcategorias WHERE NombreSubcategoria = 'Comunicación'), 38, 17),
('Joystick Analógico KY-023', (SELECT SubcategoriaID FROM Subcategorias WHERE NombreSubcategoria = 'Interfaz de Usuario'), 9, 3),
('Driver de Motor L298N', (SELECT SubcategoriaID FROM Subcategorias WHERE NombreSubcategoria = 'Potencia y Control'), 14, 6),
('Kit de Resistencias 1/4W (600 unid)', (SELECT SubcategoriaID FROM Subcategorias WHERE NombreSubcategoria = 'Resistencias'), 25, 11),
('Kit de Capacitores Cerámicos', (SELECT SubcategoriaID FROM Subcategorias WHERE NombreSubcategoria = 'Capacitores'), 20, 9),
('Kit de Capacitores Electrolíticos', (SELECT SubcategoriaID FROM Subcategorias WHERE NombreSubcategoria = 'Capacitores'), 22, 10),
('Circuito Integrado LM358', (SELECT SubcategoriaID FROM Subcategorias WHERE NombreSubcategoria = 'Circuitos Integrados'), 3, 1),
('Circuito Integrado NE555', (SELECT SubcategoriaID FROM Subcategorias WHERE NombreSubcategoria = 'Circuitos Integrados'), 3, 1),
('Microcontrolador ATmega328P', (SELECT SubcategoriaID FROM Subcategorias WHERE NombreSubcategoria = 'Semiconductores'), 18, 8),
('Microcontrolador PIC16F877A', (SELECT SubcategoriaID FROM Subcategorias WHERE NombreSubcategoria = 'Semiconductores'), 22, 10),
('Kit de LEDs 5mm Colores Surtidos', (SELECT SubcategoriaID FROM Subcategorias WHERE NombreSubcategoria = 'Semiconductores'), 10, 4),
('Diodo Rectificador 1N4007 (pack 100)', (SELECT SubcategoriaID FROM Subcategorias WHERE NombreSubcategoria = 'Semiconductores'), 8, 3),
('Diodo Zener 5.1V (pack 20)', (SELECT SubcategoriaID FROM Subcategorias WHERE NombreSubcategoria = 'Semiconductores'), 6, 2),
('Transistor 2N2222 (pack 10)', (SELECT SubcategoriaID FROM Subcategorias WHERE NombreSubcategoria = 'Semiconductores'), 7, 3),
('Transistor MOSFET IRF540', (SELECT SubcategoriaID FROM Subcategorias WHERE NombreSubcategoria = 'Semiconductores'), 6, 2),
('Protoboard 830 puntos', (SELECT SubcategoriaID FROM Subcategorias WHERE NombreSubcategoria = 'Prototipado'), 12, 5),
('Placa PCB Perforada 5x7cm', (SELECT SubcategoriaID FROM Subcategorias WHERE NombreSubcategoria = 'Prototipado'), 4, 1.5),
('Optoacoplador PC817', (SELECT SubcategoriaID FROM Subcategorias WHERE NombreSubcategoria = 'Semiconductores'), 3, 1),
('Potenciómetro 10K', (SELECT SubcategoriaID FROM Subcategorias WHERE NombreSubcategoria = 'Resistencias'), 3, 1),
('Arduino Uno R3 Original', (SELECT SubcategoriaID FROM Subcategorias WHERE NombreSubcategoria = 'Arduino'), 95, 50),
('Arduino Uno Compatible', (SELECT SubcategoriaID FROM Subcategorias WHERE NombreSubcategoria = 'Arduino'), 38, 16),
('Arduino Nano Compatible', (SELECT SubcategoriaID FROM Subcategorias WHERE NombreSubcategoria = 'Arduino'), 28, 12),
('Arduino Mega 2560 Compatible', (SELECT SubcategoriaID FROM Subcategorias WHERE NombreSubcategoria = 'Arduino'), 65, 30),
('Kit Iniciación Arduino Uno', (SELECT SubcategoriaID FROM Subcategorias WHERE NombreSubcategoria = 'Arduino'), 120, 55),
('Shield Ethernet para Arduino', (SELECT SubcategoriaID FROM Subcategorias WHERE NombreSubcategoria = 'Arduino'), 45, 20),
('ESP32 Dev Board WROOM-32', (SELECT SubcategoriaID FROM Subcategorias WHERE NombreSubcategoria = 'ESP32'), 35, 15),
('ESP32-CAM con Cámara', (SELECT SubcategoriaID FROM Subcategorias WHERE NombreSubcategoria = 'ESP32'), 42, 18),
('Placa micro:bit V2', (SELECT SubcategoriaID FROM Subcategorias WHERE NombreSubcategoria = 'micro:bit'), 78, 38),
('Kit Expansión micro:bit', (SELECT SubcategoriaID FROM Subcategorias WHERE NombreSubcategoria = 'micro:bit'), 32, 14),
('Placa STM32 Blue Pill', (SELECT SubcategoriaID FROM Subcategorias WHERE NombreSubcategoria = 'STM32 / FPGA'), 25, 11),
('Placa FPGA Tang Nano 9K', (SELECT SubcategoriaID FROM Subcategorias WHERE NombreSubcategoria = 'STM32 / FPGA'), 145, 70),
('Programador USBasp AVR', (SELECT SubcategoriaID FROM Subcategorias WHERE NombreSubcategoria = 'Programación y Depuración'), 20, 8),
('Conversor USB a TTL CP2102', (SELECT SubcategoriaID FROM Subcategorias WHERE NombreSubcategoria = 'Programación y Depuración'), 12, 5),
('Batería Li-ion 18650 3.7V', (SELECT SubcategoriaID FROM Subcategorias WHERE NombreSubcategoria = 'Baterías'), 18, 8),
('Batería LiPo 2200mAh', (SELECT SubcategoriaID FROM Subcategorias WHERE NombreSubcategoria = 'Baterías'), 45, 20),
('Pack Pilas AA Recargables (4u)', (SELECT SubcategoriaID FROM Subcategorias WHERE NombreSubcategoria = 'Baterías'), 22, 10),
('Fuente de Alimentación 12V 5A', (SELECT SubcategoriaID FROM Subcategorias WHERE NombreSubcategoria = 'Fuentes AC-DC'), 55, 25),
('Cargador para Batería 18650', (SELECT SubcategoriaID FROM Subcategorias WHERE NombreSubcategoria = 'Cargadores'), 25, 11),
('Panel Solar 6V 1W', (SELECT SubcategoriaID FROM Subcategorias WHERE NombreSubcategoria = 'Generación de Energía'), 20, 8),
('Mini Aerogenerador Educativo', (SELECT SubcategoriaID FROM Subcategorias WHERE NombreSubcategoria = 'Generación de Energía'), 65, 30),
('Tira LED WS2812B (1m)', (SELECT SubcategoriaID FROM Subcategorias WHERE NombreSubcategoria = 'Iluminación'), 35, 15),
('Módulo Convertidor Buck LM2596', (SELECT SubcategoriaID FROM Subcategorias WHERE NombreSubcategoria = 'Fuentes AC-DC'), 8, 3),
('Portapilas 4xAA con Switch', (SELECT SubcategoriaID FROM Subcategorias WHERE NombreSubcategoria = 'Baterías'), 5, 2),
('Adaptador de Voltaje Universal', (SELECT SubcategoriaID FROM Subcategorias WHERE NombreSubcategoria = 'Fuentes AC-DC'), 28, 12),
('Módulo Cargador TP4056', (SELECT SubcategoriaID FROM Subcategorias WHERE NombreSubcategoria = 'Cargadores'), 6, 2),
('Raspberry Pi 4 Model B 4GB', (SELECT SubcategoriaID FROM Subcategorias WHERE NombreSubcategoria = 'Raspberry Pi'), 380, 190),
('Raspberry Pi Zero 2 W', (SELECT SubcategoriaID FROM Subcategorias WHERE NombreSubcategoria = 'Raspberry Pi'), 120, 55),
('Kit Raspberry Pi 4 Completo', (SELECT SubcategoriaID FROM Subcategorias WHERE NombreSubcategoria = 'Raspberry Pi'), 520, 260),
('Case para Raspberry Pi 4', (SELECT SubcategoriaID FROM Subcategorias WHERE NombreSubcategoria = 'Raspberry Pi'), 25, 10),
('Fuente Oficial Raspberry Pi 4', (SELECT SubcategoriaID FROM Subcategorias WHERE NombreSubcategoria = 'Raspberry Pi'), 35, 15),
('Cámara Raspberry Pi V2', (SELECT SubcategoriaID FROM Subcategorias WHERE NombreSubcategoria = 'Raspberry Pi'), 65, 28),
('Micro SD 32GB para Raspberry Pi', (SELECT SubcategoriaID FROM Subcategorias WHERE NombreSubcategoria = 'Raspberry Pi'), 30, 13),
('HAT Sense para Raspberry Pi', (SELECT SubcategoriaID FROM Subcategorias WHERE NombreSubcategoria = 'Raspberry Pi'), 85, 40),
('Jetson Nano Developer Kit', (SELECT SubcategoriaID FROM Subcategorias WHERE NombreSubcategoria = 'Jetson'), 650, 340),
('Kit de Desarrollo IA RDK X5', (SELECT SubcategoriaID FROM Subcategorias WHERE NombreSubcategoria = 'Jetson'), 1150, 620),
('Motor DC 6V con Reductor', (SELECT SubcategoriaID FROM Subcategorias WHERE NombreSubcategoria = 'Motores DC'), 12, 5),
('Micromotor de Vibración', (SELECT SubcategoriaID FROM Subcategorias WHERE NombreSubcategoria = 'Motores DC'), 4, 1.5),
('Motor Paso a Paso NEMA17', (SELECT SubcategoriaID FROM Subcategorias WHERE NombreSubcategoria = 'Motores Paso a Paso'), 45, 20),
('Driver para Motor Paso a Paso A4988', (SELECT SubcategoriaID FROM Subcategorias WHERE NombreSubcategoria = 'Motores Paso a Paso'), 14, 6),
('Servomotor SG90', (SELECT SubcategoriaID FROM Subcategorias WHERE NombreSubcategoria = 'Servomotores'), 12, 5),
('Servomotor MG996R Metálico', (SELECT SubcategoriaID FROM Subcategorias WHERE NombreSubcategoria = 'Servomotores'), 35, 15),
('Motor Brushless 2212', (SELECT SubcategoriaID FROM Subcategorias WHERE NombreSubcategoria = 'Brushless'), 55, 25),
('Motor DC con Encoder', (SELECT SubcategoriaID FROM Subcategorias WHERE NombreSubcategoria = 'Motores DC'), 28, 12),
('Llantas de Goma para Robot (par)', (SELECT SubcategoriaID FROM Subcategorias WHERE NombreSubcategoria = 'Accesorios de Movimiento'), 15, 6),
('Hélice para Dron (par)', (SELECT SubcategoriaID FROM Subcategorias WHERE NombreSubcategoria = 'Accesorios de Movimiento'), 10, 4),
('Chasis de Acrílico 2WD para Robot', (SELECT SubcategoriaID FROM Subcategorias WHERE NombreSubcategoria = 'Chasis'), 35, 15),
('Chasis de Aluminio 4WD para Robot', (SELECT SubcategoriaID FROM Subcategorias WHERE NombreSubcategoria = 'Chasis'), 68, 30),
('Kit Robot Seguidor de Línea', (SELECT SubcategoriaID FROM Subcategorias WHERE NombreSubcategoria = 'Kits Educativos'), 95, 42),
('Kit Robot Educativo STEM', (SELECT SubcategoriaID FROM Subcategorias WHERE NombreSubcategoria = 'Kits Educativos'), 185, 85),
('Dron Mini con Cámara', (SELECT SubcategoriaID FROM Subcategorias WHERE NombreSubcategoria = 'Drones'), 220, 110),
('Repuesto Hélices para Dron (set)', (SELECT SubcategoriaID FROM Subcategorias WHERE NombreSubcategoria = 'Drones'), 15, 6),
('Kit Brazo Robótico Educativo', (SELECT SubcategoriaID FROM Subcategorias WHERE NombreSubcategoria = 'Kits Educativos'), 145, 65),
('Chasis Tanque Orugas para Robot', (SELECT SubcategoriaID FROM Subcategorias WHERE NombreSubcategoria = 'Chasis'), 55, 24);
GO

-- ============================================================
-- 4. TIENDAS (8 registros)
-- ============================================================
INSERT INTO Tiendas (NombreTienda, Departamento, Provincia, Distrito, Latitud, Longitud, TipoTienda) VALUES
('Electro Store Surco', 'Lima', 'Lima', 'Santiago de Surco', -12.135200, -76.999400, 'Física'),
('Electro Store Miraflores', 'Lima', 'Lima', 'Miraflores', -12.121100, -77.029500, 'Física'),
('Electro Store San Martín de Porres', 'Lima', 'Lima', 'San Martín de Porres', -12.008900, -77.086400, 'Física'),
('Electro Store Arequipa', 'Arequipa', 'Arequipa', 'Cercado', -16.398900, -71.535000, 'Física'),
('Electro Store Trujillo', 'La Libertad', 'Trujillo', 'Trujillo', -8.111600, -79.029000, 'Física'),
('Electro Store Cusco', 'Cusco', 'Cusco', 'Cusco', -13.532000, -71.967500, 'Física'),
('Electro Store Piura', 'Piura', 'Piura', 'Piura', -5.194500, -80.632800, 'Física'),
('Electro Store Online', NULL, NULL, NULL, NULL, NULL, 'Online');
GO

-- ============================================================
-- 5. METODOPAGO (6 registros)
-- ============================================================
INSERT INTO MetodoPago (NombreMetodo) VALUES
('Efectivo'),
('Tarjeta de Crédito'),
('Tarjeta de Débito'),
('Yape'),
('Plin'),
('Transferencia Bancaria');
GO
-- ============================================================
-- 6. CLIENTES (400 registros)
-- ============================================================
INSERT INTO Clientes (Nombres, Apellidos, Email, Telefono, FechaNacimiento, Genero, Departamento, Provincia, Distrito, TipoCliente, SegmentoCliente, FechaRegistro) VALUES
('Carlos', 'García Torres', 'carlos.garcia1@correo.com', '987541203', '1992-03-14', 'Masculino', 'Lima', 'Lima', 'Santiago de Surco', 'Persona', 'Retail', '2024-07-12'),
('María', 'Rodríguez Flores', 'maria.rodriguez2@correo.com', '956412087', '1988-11-02', 'Femenino', 'Lima', 'Lima', 'Miraflores', 'Persona', 'Retail', '2024-09-03'),
('José', 'Fernández Vásquez', 'jose.fernandez3@correo.com', '923150478', '1995-06-21', 'Masculino', 'Lima', 'Lima', 'San Martín de Porres', 'Persona', 'Retail', '2025-01-18'),
('Ana', 'López Castillo', 'ana.lopez4@correo.com', '978402315', '1990-01-09', 'Femenino', 'Callao', 'Callao', 'Callao', 'Persona', 'Retail', '2024-08-25'),
('Luis', 'Martínez Rojas', 'luis.martinez5@correo.com', '945780213', '1985-09-30', 'Masculino', 'Arequipa', 'Arequipa', 'Cercado', 'Persona', 'Mayorista', '2024-05-14'),
('Rosa', 'Sánchez Mendoza', 'rosa.sanchez6@correo.com', '912345680', '1993-04-17', 'Femenino', 'Lima', 'Lima', 'San Juan de Lurigancho', 'Persona', 'Retail', '2025-02-27'),
('Miguel', 'Pérez Vargas', 'miguel.perez7@correo.com', '967213540', '1979-12-05', 'Masculino', 'La Libertad', 'Trujillo', 'Trujillo', 'Persona', 'Retail', '2024-06-30'),
('Carmen', 'Ramírez Quispe', 'carmen.ramirez8@correo.com', '934578120', '1998-07-23', 'Femenino', 'Lima', 'Lima', 'Los Olivos', 'Persona', 'Retail', '2025-03-11'),
('Jorge', 'Torres Huamán', 'jorge.torres9@correo.com', '989123456', '1991-02-14', 'Masculino', 'Cusco', 'Cusco', 'Cusco', 'Persona', 'Retail', '2024-10-05'),
('Lucía', 'Flores Chávez', 'lucia.flores10@correo.com', '956789021', '1996-08-08', 'Femenino', 'Lima', 'Lima', 'Comas', 'Persona', 'Retail', '2025-04-19'),
('Fernando', 'Rivera Salazar', 'fernando.rivera11@correo.com', '923456789', '1983-05-27', 'Masculino', 'Piura', 'Piura', 'Piura', 'Persona', 'Retail', '2024-07-22'),
('Gabriela', 'Gómez Paredes', 'gabriela.gomez12@correo.com', '978912345', '1994-10-11', 'Femenino', 'Lima', 'Lima', 'San Isidro', 'Persona', 'Retail', '2025-01-08'),
('Diego', 'Díaz Reyes', 'diego.diaz13@correo.com', '945123678', '1989-03-03', 'Masculino', 'Lambayeque', 'Chiclayo', 'Chiclayo', 'Persona', 'Retail', '2024-09-16'),
('Fiorella', 'Vásquez Morales', 'fiorella.vasquez14@correo.com', '912678345', '1997-06-19', 'Femenino', 'Lima', 'Lima', 'Ate', 'Persona', 'Retail', '2025-05-02'),
('Andrés', 'Castillo Ortiz', 'andres.castillo15@correo.com', '967890123', '1986-01-25', 'Masculino', 'Junín', 'Huancayo', 'Huancayo', 'Persona', 'Retail', '2024-06-08'),
('Paola', 'Rojas Gutiérrez', 'paola.rojas16@correo.com', '934890167', '1999-09-14', 'Femenino', 'Lima', 'Lima', 'Miraflores', 'Persona', 'Retail', '2025-02-14'),
('Ricardo', 'Mendoza Aguilar', 'ricardo.mendoza17@correo.com', '989345678', '1981-04-02', 'Masculino', 'Ica', 'Ica', 'Ica', 'Persona', 'Retail', '2024-08-01'),
('Katherine', 'Vargas Campos', 'katherine.vargas18@correo.com', '956234789', '1993-11-28', 'Femenino', 'Lima', 'Lima', 'Santiago de Surco', 'Persona', 'Retail', '2025-03-25'),
('Alberto', 'Quispe Cárdenas', 'alberto.quispe19@correo.com', '923678901', '1978-07-16', 'Masculino', 'Puno', 'Puno', 'Puno', 'Persona', 'Retail', '2024-05-30'),
('Milagros', 'Huamán Carrasco', 'milagros.huaman20@correo.com', '978345612', '1995-02-09', 'Femenino', 'Lima', 'Lima', 'San Martín de Porres', 'Persona', 'Retail', '2025-04-07'),
('Renato', 'Chávez Cruz', 'renato.chavez21@correo.com', '945890234', '1990-10-22', 'Masculino', 'Loreto', 'Maynas', 'Iquitos', 'Persona', 'Retail', '2024-11-19'),
('Valeria', 'Salazar Delgado', 'valeria.salazar22@correo.com', '912567834', '1992-12-30', 'Femenino', 'Lima', 'Lima', 'Los Olivos', 'Persona', 'Retail', '2025-01-30'),
('Sebastián', 'Paredes Espinoza', 'sebastian.paredes23@correo.com', '967234567', '1987-08-13', 'Masculino', 'Áncash', 'Huaraz', 'Huaraz', 'Persona', 'Retail', '2024-07-04'),
('Daniela', 'Reyes Guerrero', 'daniela.reyes24@correo.com', '934123890', '1998-03-05', 'Femenino', 'Callao', 'Callao', 'Bellavista', 'Persona', 'Retail', '2025-02-22'),
('Eduardo', 'Morales Herrera', 'eduardo.morales25@correo.com', '989567234', '1984-06-27', 'Masculino', 'Arequipa', 'Arequipa', 'Cayma', 'Persona', 'Retail', '2024-09-28'),
('Karen', 'Ortiz Ibáñez', 'karen.ortiz26@correo.com', '956789345', '1996-01-18', 'Femenino', 'Lima', 'Lima', 'San Juan de Lurigancho', 'Persona', 'Retail', '2025-05-15'),
('Rafael', 'Gutiérrez Jiménez', 'rafael.gutierrez27@correo.com', '923890456', '1980-09-09', 'Masculino', 'La Libertad', 'Trujillo', 'La Esperanza', 'Persona', 'Retail', '2024-06-13'),
('Diana', 'Aguilar León', 'diana.aguilar28@correo.com', '978234901', '1994-04-24', 'Femenino', 'Lima', 'Lima', 'San Isidro', 'Persona', 'Retail', '2025-03-08'),
('Manuel', 'Campos Medina', 'manuel.campos29@correo.com', '945678012', '1976-11-11', 'Masculino', 'Piura', 'Piura', 'Piura', 'Persona', 'Mayorista', '2024-10-21'),
('Claudia', 'Cárdenas Navarro', 'claudia.cardenas30@correo.com', '912890678', '1997-07-06', 'Femenino', 'Lima', 'Lima', 'Comas', 'Persona', 'Retail', '2025-01-04'),
('Pedro', 'Carrasco Ochoa', 'pedro.carrasco31@correo.com', '967345890', '1989-02-28', 'Masculino', 'Cusco', 'Cusco', 'Cusco', 'Persona', 'Retail', '2024-08-17'),
('Patricia', 'Cruz Palacios', 'patricia.cruz32@correo.com', '934567123', '1991-05-19', 'Femenino', 'Lima', 'Lima', 'Ate', 'Persona', 'Retail', '2025-04-26'),
('Julio', 'Delgado Quiroz', 'julio.delgado33@correo.com', '989678345', '1982-12-08', 'Masculino', 'Lambayeque', 'Chiclayo', 'Chiclayo', 'Persona', 'Retail', '2024-07-09'),
('Silvia', 'Espinoza Ramos', 'silvia.espinoza34@correo.com', '956890234', '1999-10-02', 'Femenino', 'Lima', 'Lima', 'Miraflores', 'Persona', 'Retail', '2025-02-11'),
('Víctor', 'Guerrero Rivas', 'victor.guerrero35@correo.com', '923456012', '1975-03-25', 'Masculino', 'Junín', 'Huancayo', 'Huancayo', 'Persona', 'Retail', '2024-05-23'),
('Mónica', 'Herrera Romero', 'monica.herrera36@correo.com', '978567345', '1993-08-14', 'Femenino', 'Lima', 'Lima', 'Santiago de Surco', 'Persona', 'Retail', '2025-03-19'),
('Raúl', 'Ibáñez Silva', 'raul.ibanez37@correo.com', '945789012', '1987-01-30', 'Masculino', 'Ica', 'Ica', 'Ica', 'Persona', 'Retail', '2024-09-06'),
('Jazmín', 'Jiménez Soto', 'jazmin.jimenez38@correo.com', '912345670', '1996-06-11', 'Femenino', 'Lima', 'Lima', 'San Martín de Porres', 'Persona', 'Retail', '2025-04-30'),
('Óscar', 'León Tello', 'oscar.leon39@correo.com', '967901234', '1979-04-07', 'Masculino', 'Puno', 'Puno', 'Puno', 'Persona', 'Retail', '2024-06-25'),
('Estefanía', 'Medina Ugarte', 'estefania.medina40@correo.com', '934012567', '1998-09-23', 'Femenino', 'Lima', 'Lima', 'Los Olivos', 'Persona', 'Retail', '2025-01-21'),
('Iván', 'Navarro Valdivia', 'ivan.navarro41@correo.com', '989234501', '1985-11-16', 'Masculino', 'Loreto', 'Maynas', 'Iquitos', 'Persona', 'Retail', '2024-08-09'),
('Alejandra', 'Ochoa Yupanqui', 'alejandra.ochoa42@correo.com', '956123489', '1992-02-05', 'Femenino', 'Callao', 'Callao', 'Callao', 'Persona', 'Retail', '2025-02-06'),
('Marco', 'Palacios Zegarra', 'marco.palacios43@correo.com', '923678120', '1983-07-29', 'Masculino', 'Arequipa', 'Arequipa', 'Cercado', 'Persona', 'Retail', '2024-10-14'),
('Andrea', 'Quiroz Cabrera', 'andrea.quiroz44@correo.com', '978890345', '1995-12-12', 'Femenino', 'Lima', 'Lima', 'San Isidro', 'Persona', 'Retail', '2025-05-08'),
('Antonio', 'Ramos Coronado', 'antonio.ramos45@correo.com', '945234678', '1977-05-01', 'Masculino', 'Áncash', 'Huaraz', 'Huaraz', 'Persona', 'Retail', '2024-07-27'),
('Cecilia', 'Rivas Dávila', 'cecilia.rivas46@correo.com', '912456789', '1990-08-20', 'Femenino', 'Lima', 'Lima', 'San Juan de Lurigancho', 'Persona', 'Retail', '2025-03-02'),
('Franco', 'Romero Escobar', 'franco.romero47@correo.com', '967567890', '1994-03-09', 'Masculino', 'La Libertad', 'Trujillo', 'Trujillo', 'Persona', 'Retail', '2024-09-11'),
('Elena', 'Silva Farfán', 'elena.silva48@correo.com', '934789012', '1988-10-27', 'Femenino', 'Lima', 'Lima', 'Comas', 'Persona', 'Retail', '2025-01-15'),
('Gonzalo', 'Soto García', 'gonzalo.soto49@correo.com', '989890123', '1981-06-15', 'Masculino', 'Piura', 'Piura', 'Piura', 'Persona', 'Retail', '2024-06-19'),
('Fabiola', 'Tello Rodríguez', 'fabiola.tello50@correo.com', '956901234', '1997-01-04', 'Femenino', 'Lima', 'Lima', 'Miraflores', 'Persona', 'Retail', '2025-04-13'),
('José Luis', 'Fernández & Asociados SAC', 'contacto.jlfernandez51@correo.com', '923012345', '1975-04-18', 'Masculino', 'Lima', 'Lima', 'San Isidro', 'Empresa', 'Mayorista', '2024-05-04'),
('Carla', 'Distribuidora Torres EIRL', 'carla.torres52@correo.com', '978123456', '1980-09-06', 'Femenino', 'Lima', 'Lima', 'Ate', 'Empresa', 'Mayorista', '2024-06-15'),
('Ramiro', 'Componentes del Norte SAC', 'ramiro.componentes53@correo.com', '945234567', '1979-02-11', 'Masculino', 'La Libertad', 'Trujillo', 'Trujillo', 'Empresa', 'Mayorista', '2024-07-01'),
('Verónica', 'TecnoImport Perú SAC', 'veronica.tecnoimport54@correo.com', '912345789', '1983-11-23', 'Femenino', 'Lima', 'Lima', 'Santiago de Surco', 'Empresa', 'Mayorista', '2024-08-19'),
('Hugo', 'Robótica Educativa SAC', 'hugo.robotica55@correo.com', '967456012', '1976-07-30', 'Masculino', 'Arequipa', 'Arequipa', 'Cercado', 'Empresa', 'Mayorista', '2024-09-22'),
('Rocío', 'Makers Store Perú SAC', 'rocio.makers56@correo.com', '934567890', '1985-03-14', 'Femenino', 'Lima', 'Lima', 'Miraflores', 'Empresa', 'Retail', '2024-10-30'),
('Jaime', 'Electro Componentes Cusco SAC', 'jaime.componentescusco57@correo.com', '989678123', '1978-12-27', 'Masculino', 'Cusco', 'Cusco', 'Cusco', 'Empresa', 'Mayorista', '2024-11-11'),
('Lourdes', 'Automatización Industrial SAC', 'lourdes.automatizacion58@correo.com', '956789234', '1982-05-08', 'Femenino', 'Lima', 'Lima', 'San Martín de Porres', 'Empresa', 'Mayorista', '2024-12-05'),
('Wilson', 'Grupo Electrónico Piura SAC', 'wilson.gepiura59@correo.com', '923890567', '1974-01-19', 'Masculino', 'Piura', 'Piura', 'Piura', 'Empresa', 'Retail', '2025-01-10'),
('Teresa', 'STEM Perú Educativa SAC', 'teresa.stemperu60@correo.com', '978901678', '1986-08-02', 'Femenino', 'Lima', 'Lima', 'Los Olivos', 'Empresa', 'Retail', '2025-01-27'),
('Bruno', 'Innova Robótica SAC', 'bruno.innovarobotica61@correo.com', '945012789', '1981-10-16', 'Masculino', 'Lima', 'Lima', 'San Isidro', 'Empresa', 'Mayorista', '2025-02-08'),
('Ingrid', 'Componentes Chiclayo SAC', 'ingrid.componenteschiclayo62@correo.com', '912123890', '1984-04-29', 'Femenino', 'Lambayeque', 'Chiclayo', 'Chiclayo', 'Empresa', 'Mayorista', '2025-02-20'),
('Cristian', 'Electro Solutions Perú SAC', 'cristian.electrosolutions63@correo.com', '967234012', '1977-06-05', 'Masculino', 'Lima', 'Lima', 'Ate', 'Empresa', 'Mayorista', '2025-03-05'),
('Gianella', 'Kits Educativos Junín SAC', 'gianella.kitsjunin64@correo.com', '934345123', '1989-09-17', 'Femenino', 'Junín', 'Huancayo', 'Huancayo', 'Empresa', 'Retail', '2025-03-21'),
('Enrique', 'Automatiza Perú SAC', 'enrique.automatizaperu65@correo.com', '989456234', '1975-11-30', 'Masculino', 'Lima', 'Lima', 'Comas', 'Empresa', 'Mayorista', '2025-04-02'),
('Karina', 'Drones y Robótica SAC', 'karina.dronesrobotica66@correo.com', '956567345', '1987-02-22', 'Femenino', 'Lima', 'Lima', 'Miraflores', 'Empresa', 'Retail', '2025-04-18'),
('Rodrigo', 'Distribuidora Arequipa SAC', 'rodrigo.distribarequipa67@correo.com', '923678456', '1980-07-14', 'Masculino', 'Arequipa', 'Arequipa', 'Cayma', 'Empresa', 'Mayorista', '2025-05-01'),
('Liliana', 'Electro Ica SAC', 'liliana.electroica68@correo.com', '978789567', '1983-12-09', 'Femenino', 'Ica', 'Ica', 'Ica', 'Empresa', 'Retail', '2024-06-22'),
('Martín', 'IoT Perú Soluciones SAC', 'martin.iotperu69@correo.com', '945890678', '1976-05-25', 'Masculino', 'Lima', 'Lima', 'San Juan de Lurigancho', 'Empresa', 'Mayorista', '2024-07-16'),
('Sandra', 'Componentes Callao SAC', 'sandra.componentescallao70@correo.com', '912901789', '1985-08-31', 'Femenino', 'Callao', 'Callao', 'Callao', 'Empresa', 'Mayorista', '2024-08-08'),
('Gustavo', 'Micro Electrónica SAC', 'gustavo.microelectronica71@correo.com', '967012890', '1978-03-12', 'Masculino', 'Lima', 'Lima', 'San Isidro', 'Empresa', 'Retail', '2024-09-01'),
('Natalia', 'Robotics Perú SAC', 'natalia.roboticsperu72@correo.com', '934123901', '1990-10-04', 'Femenino', 'Lima', 'Lima', 'Los Olivos', 'Empresa', 'Retail', '2024-10-10'),
('Alonso', 'Placas y Sensores SAC', 'alonso.placassensores73@correo.com', '989234012', '1979-01-27', 'Masculino', 'La Libertad', 'Trujillo', 'La Esperanza', 'Empresa', 'Mayorista', '2024-11-05'),
('Pamela', 'Componentes Cusco Andino SAC', 'pamela.componentescusco74@correo.com', '956345123', '1988-06-20', 'Femenino', 'Cusco', 'Cusco', 'Cusco', 'Empresa', 'Retail', '2024-12-12'),
('Alfredo', 'GrupoTech Perú SAC', 'alfredo.grupotech75@correo.com', '923456234', '1974-09-08', 'Masculino', 'Lima', 'Lima', 'Ate', 'Empresa', 'Mayorista', '2025-01-06'),
('Roxana', 'Suministros Electrónicos SAC', 'roxana.suministros76@correo.com', '978567012', '1986-04-15', 'Femenino', 'Lima', 'Lima', 'Santiago de Surco', 'Empresa', 'Mayorista', '2025-02-01'),
('Nicolás', 'Componentes Puno SAC', 'nicolas.componentespuno77@correo.com', '945678123', '1981-11-21', 'Masculino', 'Puno', 'Puno', 'Puno', 'Empresa', 'Retail', '2025-02-19'),
('Vanessa', 'Fabrica Digital Perú SAC', 'vanessa.fabricadigital78@correo.com', '912789234', '1984-02-03', 'Femenino', 'Lima', 'Lima', 'Comas', 'Empresa', 'Retail', '2025-03-14'),
('Adrián', 'Norte Robótica SAC', 'adrian.norterobotica79@correo.com', '967890345', '1977-07-28', 'Masculino', 'Piura', 'Piura', 'Piura', 'Empresa', 'Mayorista', '2025-03-30'),
('Ximena', 'Grupo Educativo Lima SAC', 'ximena.grupoeducativo80@correo.com', '934901456', '1989-12-11', 'Femenino', 'Lima', 'Lima', 'Miraflores', 'Empresa', 'Retail', '2025-04-15'),
('Emilio', 'Componentes Amazonía SAC', 'emilio.componentesamazonia81@correo.com', '989012567', '1975-05-17', 'Masculino', 'Loreto', 'Maynas', 'Iquitos', 'Empresa', 'Retail', '2025-05-06'),
('Mariana', 'Distribuidora Áncash SAC', 'mariana.distribuidoraancash82@correo.com', '956123678', '1987-10-30', 'Femenino', 'Áncash', 'Huaraz', 'Huaraz', 'Empresa', 'Retail', '2024-06-05'),
('Javier', 'Robótica del Sur SAC', 'javier.roboticasur83@correo.com', '923234789', '1980-01-08', 'Masculino', 'Arequipa', 'Arequipa', 'Cercado', 'Empresa', 'Mayorista', '2024-07-19'),
('Yolanda', 'Kits STEM Perú SAC', 'yolanda.kitsstem84@correo.com', '978345890', '1983-08-24', 'Femenino', 'Lima', 'Lima', 'San Martín de Porres', 'Empresa', 'Mayorista', '2024-08-27'),
('Alexander', 'Componentes Lima Este SAC', 'alexander.componenteslimaeste85@correo.com', '945456901', '1976-03-19', 'Masculino', 'Lima', 'Lima', 'Ate', 'Empresa', 'Mayorista', '2024-09-24'),
('Ursula', 'Digital Makers SAC', 'ursula.digitalmakers86@correo.com', '912567012', '1990-06-06', 'Femenino', 'Lima', 'Lima', 'San Isidro', 'Empresa', 'Retail', '2024-10-17'),
('Daniel', 'Automatización Norte SAC', 'daniel.automatizacionnorte87@correo.com', '967678123', '1978-11-14', 'Masculino', 'Lambayeque', 'Chiclayo', 'Chiclayo', 'Empresa', 'Mayorista', '2024-11-21'),
('Jessica', 'Componentes Junín SAC', 'jessica.componentesjunin88@correo.com', '934789234', '1985-04-02', 'Femenino', 'Junín', 'Huancayo', 'Huancayo', 'Empresa', 'Retail', '2024-12-19'),
('Bruno', 'GrupoIoT Callao SAC', 'bruno.grupoiotcallao89@correo.com', '989890345', '1981-09-27', 'Masculino', 'Callao', 'Callao', 'Bellavista', 'Empresa', 'Mayorista', '2025-01-13'),
('Karina', 'Electro Sur SAC', 'karina.electrosur90@correo.com', '956901456', '1984-12-15', 'Femenino', 'Ica', 'Ica', 'Ica', 'Empresa', 'Retail', '2025-02-02'),
('Renzo', 'Componentes Andinos SAC', 'renzo.componentesandinos91@correo.com', '923012567', '1979-06-09', 'Masculino', 'Cusco', 'Cusco', 'Cusco', 'Empresa', 'Mayorista', '2025-02-24'),
('Diana', 'Grupo Robótico Lima SAC', 'diana.gruporoboticolima92@correo.com', '978123678', '1988-02-28', 'Femenino', 'Lima', 'Lima', 'Los Olivos', 'Empresa', 'Retail', '2025-03-16'),
('Iván', 'Distribuidora Puno SAC', 'ivan.distribuidorapuno93@correo.com', '945234789', '1975-10-01', 'Masculino', 'Puno', 'Puno', 'Puno', 'Empresa', 'Mayorista', '2025-04-01'),
('Fabiola', 'Componentes Trujillo SAC', 'fabiola.componentestrujillo94@correo.com', '912345890', '1986-07-13', 'Femenino', 'La Libertad', 'Trujillo', 'Trujillo', 'Empresa', 'Retail', '2025-04-22'),
('Marco', 'Grupo Electrónico Sur SAC', 'marco.grupoelectronicosur95@correo.com', '967456901', '1977-01-05', 'Masculino', 'Arequipa', 'Arequipa', 'Cayma', 'Empresa', 'Mayorista', '2025-05-10'),
('Estefanía', 'Componentes Lima Norte SAC', 'estefania.componenteslimanorte96@correo.com', '934567012', '1982-05-20', 'Femenino', 'Lima', 'Lima', 'Comas', 'Empresa', 'Mayorista', '2024-06-27'),
('Alonso', 'Vega Bravo', 'alonso.vega97@correo.com', '989567123', '1994-09-11', 'Masculino', 'Lima', 'Lima', 'San Martín de Porres', 'Persona', 'Retail', '2025-01-11'),
('Gianella', 'Alva Cerna', 'gianella.alva98@correo.com', '956678234', '1997-03-27', 'Femenino', 'Lima', 'Lima', 'Miraflores', 'Persona', 'Retail', '2025-02-15'),
('Nicolás', 'Ponce Zapata', 'nicolas.ponce99@correo.com', '923789345', '1986-12-19', 'Masculino', 'Arequipa', 'Arequipa', 'Cercado', 'Persona', 'Retail', '2024-07-08'),
('Ingrid', 'Solano Meza', 'ingrid.solano100@correo.com', '978890456', '1991-06-04', 'Femenino', 'Lima', 'Lima', 'San Isidro', 'Persona', 'Retail', '2024-11-30');
INSERT INTO Clientes (Nombres, Apellidos, Email, Telefono, FechaNacimiento, Genero, Departamento, Provincia, Distrito, TipoCliente, SegmentoCliente, FechaRegistro) VALUES
('Ramiro', 'Cabanillas Ruiz', 'ramiro.cabanillas101@correo.com', '945901567', '1983-08-16', 'Masculino', 'La Libertad', 'Trujillo', 'Trujillo', 'Persona', 'Retail', '2024-08-14'),
('Yolanda', 'Bazán Cotrina', 'yolanda.bazan102@correo.com', '912012678', '1996-02-01', 'Femenino', 'Lima', 'Lima', 'Ate', 'Persona', 'Retail', '2025-03-27'),
('Emilio', 'Zúñiga Peña', 'emilio.zuniga103@correo.com', '967123789', '1979-10-23', 'Masculino', 'Piura', 'Piura', 'Piura', 'Persona', 'Retail', '2024-06-02'),
('Vanessa', 'Cieza Bardales', 'vanessa.cieza104@correo.com', '934234890', '1993-01-30', 'Femenino', 'Lima', 'Lima', 'Los Olivos', 'Persona', 'Retail', '2025-04-09'),
('Adrián', 'Herrera Suárez', 'adrian.herrera105@correo.com', '989345901', '1987-07-07', 'Masculino', 'Cusco', 'Cusco', 'Cusco', 'Persona', 'Retail', '2024-09-19'),
('Ximena', 'Mego Fasabi', 'ximena.mego106@correo.com', '956456012', '1998-05-14', 'Femenino', 'Lima', 'Lima', 'Comas', 'Persona', 'Retail', '2025-01-24'),
('Gustavo', 'Villar Otero', 'gustavo.villar107@correo.com', '923567123', '1975-12-02', 'Masculino', 'Lambayeque', 'Chiclayo', 'Chiclayo', 'Persona', 'Retail', '2024-05-19'),
('Natalia', 'Farro Sifuentes', 'natalia.farro108@correo.com', '978678234', '1992-09-25', 'Femenino', 'Lima', 'Lima', 'San Juan de Lurigancho', 'Persona', 'Retail', '2025-02-28'),
('Javier', 'Quiñones Alarcón', 'javier.quinones109@correo.com', '945789345', '1984-04-08', 'Masculino', 'Junín', 'Huancayo', 'Huancayo', 'Persona', 'Retail', '2024-10-27'),
('Roxana', 'Effio Bautista', 'roxana.effio110@correo.com', '912890456', '1990-11-13', 'Femenino', 'Lima', 'Lima', 'Miraflores', 'Persona', 'Retail', '2025-03-13'),
('Alfredo', 'Rengifo Pinedo', 'alfredo.rengifo111@correo.com', '967901567', '1978-02-20', 'Masculino', 'Loreto', 'Maynas', 'Iquitos', 'Persona', 'Retail', '2024-06-16'),
('Pamela', 'Julca Terán', 'pamela.julca112@correo.com', '934012678', '1995-08-05', 'Femenino', 'Lima', 'Lima', 'Santiago de Surco', 'Persona', 'Retail', '2025-04-24'),
('Enrique', 'Núñez Escalante', 'enrique.nunez113@correo.com', '989123789', '1981-01-17', 'Masculino', 'Áncash', 'Huaraz', 'Huaraz', 'Persona', 'Retail', '2024-07-30'),
('Karina', 'Benites Loayza', 'karina.benites114@correo.com', '956234890', '1997-10-29', 'Femenino', 'Lima', 'Lima', 'San Martín de Porres', 'Persona', 'Retail', '2025-01-05'),
('Cristian', 'Aliaga Barrantes', 'cristian.aliaga115@correo.com', '923345901', '1986-06-12', 'Masculino', 'Callao', 'Callao', 'Callao', 'Persona', 'Retail', '2024-08-22'),
('Liliana', 'Zavaleta Prado', 'liliana.zavaleta116@correo.com', '978456012', '1994-03-24', 'Femenino', 'Lima', 'Lima', 'Ate', 'Persona', 'Retail', '2025-02-09'),
('Rodrigo', 'Cabezas Yovera', 'rodrigo.cabezas117@correo.com', '945567123', '1979-09-01', 'Masculino', 'Arequipa', 'Arequipa', 'Cayma', 'Persona', 'Retail', '2024-11-14'),
('Mariana', 'Cotrina Villanueva', 'mariana.cotrina118@correo.com', '912678234', '1991-12-16', 'Femenino', 'Lima', 'Lima', 'Los Olivos', 'Persona', 'Retail', '2025-03-30'),
('Martín', 'Falcón Guevara', 'martin.falcon119@correo.com', '967789345', '1983-05-09', 'Masculino', 'Ica', 'Ica', 'Ica', 'Persona', 'Retail', '2024-09-25'),
('Sandra', 'Yovera Palma', 'sandra.yovera120@correo.com', '934890456', '1996-07-22', 'Femenino', 'Lima', 'Lima', 'San Isidro', 'Persona', 'Retail', '2025-04-01'),
('Hugo', 'Rentería Guillén', 'hugo.renteria121@correo.com', '989901567', '1977-11-04', 'Masculino', 'Piura', 'Piura', 'Piura', 'Persona', 'Retail', '2024-06-11'),
('Teresa', 'Balbín Rosales', 'teresa.balbin122@correo.com', '956012678', '1993-02-27', 'Femenino', 'Lima', 'Lima', 'Comas', 'Persona', 'Retail', '2025-01-19'),
('Bruno', 'Millán Correa', 'bruno.millan123@correo.com', '923123789', '1988-08-10', 'Masculino', 'Lima', 'Lima', 'Santiago de Surco', 'Persona', 'Retail', '2024-10-03'),
('Andrea', 'Portugal Chumpitaz', 'andrea.portugal124@correo.com', '978234890', '1999-04-19', 'Femenino', 'Cusco', 'Cusco', 'Cusco', 'Persona', 'Retail', '2025-02-13'),
('Franco', 'Vela Zapata', 'franco.vela125@correo.com', '945345901', '1985-10-31', 'Masculino', 'La Libertad', 'Trujillo', 'La Esperanza', 'Persona', 'Retail', '2024-07-26'),
('Diana', 'Requena Solórzano', 'diana.requena126@correo.com', '912456012', '1992-01-14', 'Femenino', 'Lima', 'Lima', 'San Juan de Lurigancho', 'Persona', 'Retail', '2025-03-05'),
('Iván', 'Del Águila Vela', 'ivan.delaguila127@correo.com', '967567123', '1980-06-26', 'Masculino', 'Loreto', 'Maynas', 'Iquitos', 'Persona', 'Retail', '2024-08-30'),
('Karen', 'Manrique Osorio', 'karen.manrique128@correo.com', '934678234', '1997-09-08', 'Femenino', 'Lima', 'Lima', 'Miraflores', 'Persona', 'Retail', '2025-04-11'),
('Alonso', 'Kong Watanabe', 'alonso.kong129@correo.com', '989789345', '1984-03-21', 'Masculino', 'Lima', 'Lima', 'Ate', 'Persona', 'Retail', '2024-06-24'),
('Katherine', 'Chumbe Segura', 'katherine.chumbe130@correo.com', '956890456', '1995-11-02', 'Femenino', 'Junín', 'Huancayo', 'Huancayo', 'Persona', 'Retail', '2025-01-31'),
('Gonzalo', 'Bermúdez Pardo', 'gonzalo.bermudez131@correo.com', '923901567', '1978-05-15', 'Masculino', 'Lima', 'Lima', 'Los Olivos', 'Persona', 'Retail', '2024-09-14'),
('Milagros', 'Aponte Zela', 'milagros.aponte132@correo.com', '978012678', '1990-12-27', 'Femenino', 'Lima', 'Lima', 'San Martín de Porres', 'Persona', 'Retail', '2025-02-19'),
('Raúl', 'Espejo Achata', 'raul.espejo133@correo.com', '945123890', '1976-07-10', 'Masculino', 'Puno', 'Puno', 'Puno', 'Persona', 'Retail', '2024-10-09'),
('Jazmín', 'Coaguila Neira', 'jazmin.coaguila134@correo.com', '912234901', '1998-04-23', 'Femenino', 'Arequipa', 'Arequipa', 'Cercado', 'Persona', 'Retail', '2025-03-22'),
('Diego', 'Wong Alvarado', 'diego.wong135@correo.com', '967345012', '1987-01-06', 'Masculino', 'Lima', 'Lima', 'San Isidro', 'Persona', 'Retail', '2024-07-15'),
('Elena', 'Quintanilla Robles', 'elena.quintanilla136@correo.com', '934456123', '1994-08-19', 'Femenino', 'Lima', 'Lima', 'Comas', 'Persona', 'Retail', '2025-04-28'),
('Fernando', 'Málaga Coello', 'fernando.malaga137@correo.com', '989567234', '1982-02-01', 'Masculino', 'Lambayeque', 'Chiclayo', 'Chiclayo', 'Persona', 'Retail', '2024-08-12'),
('Ana Lucía', 'Portilla Guzmán', 'analucia.portilla138@correo.com', '956678345', '1996-06-13', 'Femenino', 'Lima', 'Lima', 'Santiago de Surco', 'Persona', 'Retail', '2025-01-27'),
('Antonio', 'Cachay Marín', 'antonio.cachay139@correo.com', '923789456', '1979-11-26', 'Masculino', 'Lima', 'Lima', 'Ate', 'Persona', 'Retail', '2024-09-30'),
('Fabiola', 'Sotelo Angulo', 'fabiola.sotelo140@correo.com', '978890567', '1993-03-08', 'Femenino', 'Ica', 'Ica', 'Ica', 'Persona', 'Retail', '2025-02-25'),
('Marco', 'Zambrano Torpoco', 'marco.zambrano141@correo.com', '945901678', '1985-09-20', 'Masculino', 'Lima', 'Lima', 'San Juan de Lurigancho', 'Persona', 'Retail', '2024-06-07'),
('Cecilia', 'Villegas Panduro', 'cecilia.villegas142@correo.com', '912012789', '1991-05-02', 'Femenino', 'Lima', 'Lima', 'Los Olivos', 'Persona', 'Retail', '2025-03-17'),
('Manuel', 'Grández Vilca', 'manuel.grandez143@correo.com', '967123890', '1977-10-15', 'Masculino', 'Áncash', 'Huaraz', 'Huaraz', 'Persona', 'Retail', '2024-11-02'),
('Rocío', 'Sifuentes Gálvez', 'rocio.sifuentes144@correo.com', '934234901', '1999-01-28', 'Femenino', 'Lima', 'Lima', 'Miraflores', 'Persona', 'Retail', '2025-04-05'),
('Julio', 'Tamayo Alegría', 'julio.tamayo145@correo.com', '989345012', '1984-07-11', 'Masculino', 'Callao', 'Callao', 'Bellavista', 'Persona', 'Retail', '2024-08-04'),
('Karla', 'Reátegui Dávila', 'karla.reategui146@correo.com', '956456123', '1996-12-24', 'Femenino', 'Lima', 'Lima', 'San Martín de Porres', 'Persona', 'Retail', '2025-02-01'),
('Renato', 'Choque Mamani', 'renato.choque147@correo.com', '923567234', '1980-04-06', 'Masculino', 'Puno', 'Puno', 'Puno', 'Persona', 'Retail', '2024-06-29'),
('Silvia', 'Bustamante Iparraguirre', 'silvia.bustamante148@correo.com', '978678345', '1992-09-18', 'Femenino', 'Lima', 'Lima', 'Comas', 'Persona', 'Retail', '2025-03-08'),
('Rafael', 'Loyola Chinchay', 'rafael.loyola149@correo.com', '945789456', '1975-02-28', 'Masculino', 'Cusco', 'Cusco', 'Cusco', 'Persona', 'Retail', '2024-10-16'),
('Karen', 'Salvatierra Otiniano', 'karen.salvatierra150@correo.com', '912890567', '1997-08-11', 'Femenino', 'La Libertad', 'Trujillo', 'Trujillo', 'Persona', 'Retail', '2025-01-14'),
('Wilson', 'Paz Cárcamo', 'wilson.paz151@correo.com', '967234012', '1983-03-15', 'Masculino', 'Lima', 'Lima', 'Ate', 'Persona', 'Retail', '2024-07-02'),
('Lourdes', 'Ísmodes Barreto', 'lourdes.ismodes152@correo.com', '934345123', '1995-11-27', 'Femenino', 'Lima', 'Lima', 'San Isidro', 'Persona', 'Retail', '2025-02-16'),
('Jaime', 'Cornejo Yactayo', 'jaime.cornejo153@correo.com', '989456234', '1978-06-09', 'Masculino', 'Arequipa', 'Arequipa', 'Cercado', 'Persona', 'Retail', '2024-09-08'),
('Verónica', 'Damián Sarmiento', 'veronica.damian154@correo.com', '956567345', '1991-01-22', 'Femenino', 'Lima', 'Lima', 'Santiago de Surco', 'Persona', 'Retail', '2025-03-24'),
('Ramiro', 'Chumpitazi Guillermo', 'ramiro.chumpitazi155@correo.com', '923678456', '1986-08-04', 'Masculino', 'La Libertad', 'Trujillo', 'Trujillo', 'Persona', 'Retail', '2024-06-18'),
('Karla', 'Ojeda Fernández', 'karla.ojeda156@correo.com', '978789567', '1998-04-17', 'Femenino', 'Lima', 'Lima', 'Miraflores', 'Persona', 'Retail', '2025-01-09'),
('Wálter', 'Bocanegra Terrones', 'walter.bocanegra157@correo.com', '945890678', '1980-10-30', 'Masculino', 'Lima', 'Lima', 'Los Olivos', 'Persona', 'Retail', '2024-11-25'),
('Fiorella', 'Alarcón Villalobos', 'fiorella.alarcon158@correo.com', '912901789', '1994-02-11', 'Femenino', 'Lima', 'Lima', 'San Martín de Porres', 'Persona', 'Retail', '2025-04-08'),
('Percy', 'Yactayo Cruzado', 'percy.yactayo159@correo.com', '967012890', '1976-07-23', 'Masculino', 'Cusco', 'Cusco', 'Cusco', 'Persona', 'Retail', '2024-08-16'),
('Zoila', 'Guillermo Barboza', 'zoila.guillermo160@correo.com', '934123901', '1997-12-06', 'Femenino', 'Lima', 'Lima', 'Comas', 'Persona', 'Retail', '2025-02-21'),
('Segundo', 'Terrones Vílchez', 'segundo.terrones161@correo.com', '989234012', '1979-05-19', 'Masculino', 'Piura', 'Piura', 'Piura', 'Persona', 'Retail', '2024-07-11'),
('Doris', 'Villalobos Espino', 'doris.villalobos162@correo.com', '956345123', '1992-09-01', 'Femenino', 'Lima', 'Lima', 'San Juan de Lurigancho', 'Persona', 'Retail', '2025-03-27'),
('Amado', 'Cruzado Farfán', 'amado.cruzado163@correo.com', '923456234', '1983-11-14', 'Masculino', 'Lambayeque', 'Chiclayo', 'Chiclayo', 'Persona', 'Retail', '2024-10-01'),
('Betty', 'Barboza Angeles', 'betty.barboza164@correo.com', '978567345', '1996-03-28', 'Femenino', 'Lima', 'Lima', 'Ate', 'Persona', 'Retail', '2025-01-16'),
('Máximo', 'Vílchez Rosado', 'maximo.vilchez165@correo.com', '945678456', '1977-08-10', 'Masculino', 'Junín', 'Huancayo', 'Huancayo', 'Persona', 'Retail', '2024-09-13'),
('Carla', 'Espino Buendía', 'carla.espino166@correo.com', '912789567', '1990-06-23', 'Femenino', 'Lima', 'Lima', 'San Isidro', 'Persona', 'Retail', '2025-04-19'),
('Elmer', 'Angeles Robladillo', 'elmer.angeles167@correo.com', '967890678', '1985-01-05', 'Masculino', 'Lima', 'Lima', 'Miraflores', 'Persona', 'Mayorista', '2024-06-26'),
('Nélida', 'Rosado Chero', 'nelida.rosado168@correo.com', '934901789', '1998-10-17', 'Femenino', 'Callao', 'Callao', 'Callao', 'Persona', 'Retail', '2025-02-08'),
('Wálter', 'Buendía Namuche', 'walter.buendia169@correo.com', '989012890', '1981-04-29', 'Masculino', 'Lima', 'Lima', 'Santiago de Surco', 'Persona', 'Retail', '2024-08-27'),
('Gladys', 'Chero Zeballos', 'gladys.chero170@correo.com', '956123901', '1993-07-12', 'Femenino', 'Lima', 'Lima', 'Los Olivos', 'Persona', 'Retail', '2025-03-11'),
('Edwin', 'Namuche Talledo', 'edwin.namuche171@correo.com', '923234012', '1975-12-24', 'Masculino', 'Ica', 'Ica', 'Ica', 'Persona', 'Retail', '2024-10-20'),
('Norma', 'Zeballos Cárdenas', 'norma.zeballos172@correo.com', '978345123', '1994-05-06', 'Femenino', 'Lima', 'Lima', 'Comas', 'Persona', 'Retail', '2025-01-23'),
('Gerardo', 'Talledo Purizaga', 'gerardo.talledo173@correo.com', '945456234', '1987-02-18', 'Masculino', 'Puno', 'Puno', 'Puno', 'Persona', 'Retail', '2024-07-05'),
('Yesenia', 'Purizaga Neyra', 'yesenia.purizaga174@correo.com', '912567345', '1999-09-30', 'Femenino', 'Lima', 'Lima', 'San Martín de Porres', 'Persona', 'Retail', '2025-04-26'),
('Aníbal', 'Neyra Coveñas', 'anibal.neyra175@correo.com', '967678456', '1978-06-13', 'Masculino', 'Loreto', 'Maynas', 'Iquitos', 'Persona', 'Retail', '2024-09-02'),
('Flor', 'Coveñas Alzamora', 'flor.covenas176@correo.com', '934789567', '1991-11-25', 'Femenino', 'Lima', 'Lima', 'San Juan de Lurigancho', 'Persona', 'Retail', '2025-02-14'),
('Ronald', 'Alzamora Peralta', 'ronald.alzamora177@correo.com', '989890678', '1984-03-09', 'Masculino', 'Arequipa', 'Arequipa', 'Cayma', 'Persona', 'Retail', '2024-06-21'),
('Betsabé', 'Peralta Loarte', 'betsabe.peralta178@correo.com', '956901789', '1996-08-21', 'Femenino', 'Lima', 'Lima', 'Ate', 'Persona', 'Retail', '2025-03-19'),
('Wagner', 'Loarte Chumbile', 'wagner.loarte179@correo.com', '923012890', '1979-01-03', 'Masculino', 'Áncash', 'Huaraz', 'Huaraz', 'Persona', 'Retail', '2024-11-08'),
('Gaby', 'Chumbile Rentería', 'gaby.chumbile180@correo.com', '978123901', '1993-04-16', 'Femenino', 'Lima', 'Lima', 'Miraflores', 'Persona', 'Retail', '2025-01-30'),
('Freddy', 'Cárcamo Núñez', 'freddy.carcamo181@correo.com', '945234012', '1986-10-28', 'Masculino', 'La Libertad', 'Trujillo', 'La Esperanza', 'Persona', 'Retail', '2024-08-05'),
('Judith', 'Núñez Osores', 'judith.nunez182@correo.com', '912345123', '1998-02-10', 'Femenino', 'Lima', 'Lima', 'Los Olivos', 'Persona', 'Retail', '2025-04-13'),
('Alcides', 'Osores Guanilo', 'alcides.osores183@correo.com', '967456234', '1976-07-22', 'Masculino', 'Lima', 'Lima', 'San Isidro', 'Persona', 'Retail', '2024-07-28'),
('Marlene', 'Guanilo Solano', 'marlene.guanilo184@correo.com', '934567345', '1990-12-05', 'Femenino', 'Lima', 'Lima', 'Comas', 'Persona', 'Retail', '2025-02-27'),
('Ezequiel', 'Solano Bautista', 'ezequiel.solano185@correo.com', '989678456', '1982-05-17', 'Masculino', 'Lambayeque', 'Chiclayo', 'Chiclayo', 'Persona', 'Retail', '2024-10-11'),
('Herminia', 'Bautista Chuquipiondo', 'herminia.bautista186@correo.com', '956789567', '1995-09-29', 'Femenino', 'Lima', 'Lima', 'Santiago de Surco', 'Persona', 'Retail', '2025-01-04'),
('Marino', 'Chuquipiondo Isla', 'marino.chuquipiondo187@correo.com', '923890678', '1977-03-11', 'Masculino', 'Junín', 'Huancayo', 'Huancayo', 'Persona', 'Retail', '2024-06-14'),
('Aracely', 'Isla Melgarejo', 'aracely.isla188@correo.com', '978901789', '1992-08-24', 'Femenino', 'Lima', 'Lima', 'San Martín de Porres', 'Persona', 'Retail', '2025-03-21'),
('Ítalo', 'Melgarejo Prieto', 'italo.melgarejo189@correo.com', '945012890', '1985-01-06', 'Masculino', 'Lima', 'Lima', 'Ate', 'Persona', 'Retail', '2024-09-17'),
('Yovana', 'Prieto Alania', 'yovana.prieto190@correo.com', '912123901', '1997-06-18', 'Femenino', 'Cusco', 'Cusco', 'Cusco', 'Persona', 'Retail', '2025-04-30'),
('Ubaldo', 'Alania Yactayo', 'ubaldo.alania191@correo.com', '967234012', '1980-11-30', 'Masculino', 'Lima', 'Lima', 'San Juan de Lurigancho', 'Persona', 'Retail', '2024-08-09'),
('Nancy', 'Yactayo Cabello', 'nancy.yactayo192@correo.com', '934345123', '1994-04-12', 'Femenino', 'Lima', 'Lima', 'Miraflores', 'Persona', 'Retail', '2025-02-05'),
('Elías', 'Cabello Quinteros', 'elias.cabello193@correo.com', '989456234', '1976-09-25', 'Masculino', 'Piura', 'Piura', 'Piura', 'Persona', 'Retail', '2024-11-16'),
('Marisol', 'Quinteros Aparicio', 'marisol.quinteros194@correo.com', '956567345', '1998-02-07', 'Femenino', 'Lima', 'Lima', 'Los Olivos', 'Persona', 'Retail', '2025-01-21'),
('Belisario', 'Aparicio Machaca', 'belisario.aparicio195@correo.com', '923678456', '1979-07-19', 'Masculino', 'Puno', 'Puno', 'Puno', 'Persona', 'Retail', '2024-07-24'),
('Dora', 'Machaca Ccama', 'dora.machaca196@correo.com', '978789567', '1991-12-01', 'Femenino', 'Lima', 'Lima', 'San Isidro', 'Persona', 'Retail', '2025-03-15'),
('Néstor', 'Ccama Layme', 'nestor.ccama197@correo.com', '945890678', '1983-05-13', 'Masculino', 'Arequipa', 'Arequipa', 'Cercado', 'Persona', 'Retail', '2024-06-08'),
('Petronila', 'Layme Apaza', 'petronila.layme198@correo.com', '912901789', '1996-10-26', 'Femenino', 'Lima', 'Lima', 'Comas', 'Persona', 'Retail', '2025-04-22'),
('Filomeno', 'Apaza Ticona', 'filomeno.apaza199@correo.com', '967012890', '1977-03-08', 'Masculino', 'Loreto', 'Maynas', 'Iquitos', 'Persona', 'Retail', '2024-10-05'),
('Esperanza', 'Ticona Callo', 'esperanza.ticona200@correo.com', '934123901', '1990-08-20', 'Femenino', 'Lima', 'Lima', 'Ate', 'Persona', 'Retail', '2025-01-29'),
('Wilfredo', 'Callo Mamani', 'wilfredo.callo201@correo.com', '989234012', '1984-01-02', 'Masculino', 'Lima', 'Lima', 'Santiago de Surco', 'Persona', 'Retail', '2024-09-06'),
('Yasmín', 'Mamani Larico', 'yasmin.mamani202@correo.com', '956345123', '1997-06-14', 'Femenino', 'La Libertad', 'Trujillo', 'Trujillo', 'Persona', 'Retail', '2025-02-24'),
('Herbert', 'Larico Quenaya', 'herbert.larico203@correo.com', '923456234', '1978-11-27', 'Masculino', 'Lima', 'Lima', 'San Martín de Porres', 'Persona', 'Retail', '2024-08-18'),
('Anita', 'Quenaya Illatopa', 'anita.quenaya204@correo.com', '978567345', '1993-04-09', 'Femenino', 'Lima', 'Lima', 'Miraflores', 'Persona', 'Retail', '2025-03-30'),
('Erick', 'Illatopa Segama', 'erick.illatopa205@correo.com', '945678456', '1981-09-21', 'Masculino', 'Ica', 'Ica', 'Ica', 'Persona', 'Retail', '2024-07-13'),
('Zulema', 'Segama Vela', 'zulema.segama206@correo.com', '912789567', '1995-02-03', 'Femenino', 'Lima', 'Lima', 'Los Olivos', 'Persona', 'Retail', '2025-04-16'),
('Teodoro', 'Vela Chanamé', 'teodoro.vela207@correo.com', '967890678', '1976-07-16', 'Masculino', 'Lambayeque', 'Chiclayo', 'Chiclayo', 'Persona', 'Retail', '2024-06-30'),
('Consuelo', 'Chanamé Farro', 'consuelo.chaname208@correo.com', '934901789', '1989-12-28', 'Femenino', 'Lima', 'Lima', 'San Juan de Lurigancho', 'Persona', 'Retail', '2025-02-11'),
('Genaro', 'Farro Timoteo', 'genaro.farro209@correo.com', '989012890', '1980-05-10', 'Masculino', 'Cusco', 'Cusco', 'Cusco', 'Persona', 'Retail', '2024-10-24'),
('Isabel', 'Timoteo Vertiz', 'isabel.timoteo210@correo.com', '956123901', '1992-10-22', 'Femenino', 'Lima', 'Lima', 'Comas', 'Persona', 'Retail', '2025-01-07'),
('Melquíades', 'Vertiz Chuquilín', 'melquiades.vertiz211@correo.com', '923234012', '1977-03-04', 'Masculino', 'Junín', 'Huancayo', 'Huancayo', 'Persona', 'Retail', '2024-09-27'),
('Nélida', 'Chuquilín Zorrilla', 'nelida.chuquilin212@correo.com', '978345123', '1994-08-17', 'Femenino', 'Lima', 'Lima', 'Ate', 'Persona', 'Retail', '2025-04-04'),
('Isaías', 'Zorrilla Miranda', 'isaias.zorrilla213@correo.com', '945456234', '1983-01-29', 'Masculino', 'Lima', 'Lima', 'San Isidro', 'Persona', 'Retail', '2024-06-13'),
('Gregoria', 'Miranda Casana', 'gregoria.miranda214@correo.com', '912567345', '1997-06-11', 'Femenino', 'Lima', 'Lima', 'Santiago de Surco', 'Persona', 'Retail', '2025-03-01'),
('Reynaldo', 'Casana Tantalean', 'reynaldo.casana215@correo.com', '967678456', '1979-11-23', 'Masculino', 'Piura', 'Piura', 'Piura', 'Persona', 'Retail', '2024-08-21'),
('Marleny', 'Tantalean Deza', 'marleny.tantalean216@correo.com', '934789567', '1990-04-06', 'Femenino', 'Lima', 'Lima', 'Los Olivos', 'Persona', 'Retail', '2025-02-18'),
('Serapio', 'Deza Odar', 'serapio.deza217@correo.com', '989890678', '1976-09-18', 'Masculino', 'Callao', 'Callao', 'Callao', 'Persona', 'Retail', '2024-11-11'),
('Feliciana', 'Odar Puse', 'feliciana.odar218@correo.com', '956901789', '1998-02-01', 'Femenino', 'Lima', 'Lima', 'Miraflores', 'Persona', 'Retail', '2025-01-25'),
('Ceferino', 'Puse Idrogo', 'ceferino.puse219@correo.com', '923012890', '1981-07-14', 'Masculino', 'Áncash', 'Huaraz', 'Huaraz', 'Persona', 'Retail', '2024-07-19'),
('Elisa', 'Idrogo Farroñan', 'elisa.idrogo220@correo.com', '978123901', '1993-12-26', 'Femenino', 'Lima', 'Lima', 'San Martín de Porres', 'Persona', 'Retail', '2025-03-08'),
('Anastacio', 'Farroñan Custodio', 'anastacio.farronan221@correo.com', '945234012', '1978-05-08', 'Masculino', 'Arequipa', 'Arequipa', 'Cayma', 'Persona', 'Retail', '2024-06-26'),
('Georgina', 'Custodio Manrique', 'georgina.custodio222@correo.com', '912345123', '1995-10-20', 'Femenino', 'Lima', 'Lima', 'Comas', 'Persona', 'Retail', '2025-04-13'),
('Balbino', 'Manrique Sifuentes', 'balbino.manrique223@correo.com', '967456234', '1984-03-02', 'Masculino', 'La Libertad', 'Trujillo', 'La Esperanza', 'Persona', 'Retail', '2024-09-09'),
('Delia', 'Sifuentes Alegre', 'delia.sifuentes224@correo.com', '934567345', '1997-08-15', 'Femenino', 'Lima', 'Lima', 'Ate', 'Persona', 'Retail', '2025-02-01'),
('Rubén', 'Alegre Zapata', 'ruben.alegre225@correo.com', '989678456', '1980-01-27', 'Masculino', 'Puno', 'Puno', 'Puno', 'Persona', 'Retail', '2024-10-14'),
('Wendy', 'Zapata Hidalgo', 'wendy.zapata226@correo.com', '956789567', '1992-06-09', 'Femenino', 'Lima', 'Lima', 'San Isidro', 'Persona', 'Retail', '2025-01-17'),
('Efraín', 'Hidalgo Ynga', 'efrain.hidalgo227@correo.com', '923890678', '1977-11-21', 'Masculino', 'Lambayeque', 'Chiclayo', 'Chiclayo', 'Persona', 'Retail', '2024-08-01'),
('Petra', 'Ynga Chuquival', 'petra.ynga228@correo.com', '978901789', '1996-04-03', 'Femenino', 'Lima', 'Lima', 'San Juan de Lurigancho', 'Persona', 'Retail', '2025-03-25'),
('Doroteo', 'Chuquival Barbarán', 'doroteo.chuquival229@correo.com', '945012890', '1979-09-15', 'Masculino', 'Loreto', 'Maynas', 'Iquitos', 'Persona', 'Retail', '2024-07-07'),
('Hilda', 'Barbarán Mesía', 'hilda.barbaran230@correo.com', '912123901', '1991-02-27', 'Femenino', 'Lima', 'Lima', 'Miraflores', 'Persona', 'Retail', '2025-04-19'),
('Marcelino', 'Mesía Trelles', 'marcelino.mesia231@correo.com', '967234012', '1983-07-10', 'Masculino', 'Ica', 'Ica', 'Ica', 'Persona', 'Retail', '2024-06-04'),
('Nora', 'Trelles Guerra', 'nora.trelles232@correo.com', '934345123', '1994-12-22', 'Femenino', 'Lima', 'Lima', 'Los Olivos', 'Persona', 'Retail', '2025-02-12'),
('Faustino', 'Guerra Palacios', 'faustino.guerra233@correo.com', '989456234', '1976-05-04', 'Masculino', 'Cusco', 'Cusco', 'Cusco', 'Persona', 'Retail', '2024-11-20'),
('Rosalía', 'Palacios Alfaro', 'rosalia.palacios234@correo.com', '956567345', '1998-10-16', 'Femenino', 'Lima', 'Lima', 'Comas', 'Persona', 'Retail', '2025-01-02'),
('Abelardo', 'Alfaro Salcedo', 'abelardo.alfaro235@correo.com', '923678456', '1981-03-28', 'Masculino', 'Junín', 'Huancayo', 'Huancayo', 'Persona', 'Retail', '2024-09-23'),
('Modesta', 'Salcedo Bocanegra', 'modesta.salcedo236@correo.com', '978789567', '1993-08-09', 'Femenino', 'Lima', 'Lima', 'Ate', 'Persona', 'Retail', '2025-03-14'),
('Leoncio', 'Bocanegra Trigoso', 'leoncio.bocanegra237@correo.com', '945890678', '1977-01-21', 'Masculino', 'Lima', 'Lima', 'San Isidro', 'Persona', 'Retail', '2024-08-13'),
('Filomena', 'Trigoso Ríos', 'filomena.trigoso238@correo.com', '912901789', '1995-06-03', 'Femenino', 'Lima', 'Lima', 'Santiago de Surco', 'Persona', 'Retail', '2025-04-27'),
('Aparicio', 'Ríos Panaifo', 'aparicio.rios239@correo.com', '967012890', '1980-11-15', 'Masculino', 'Piura', 'Piura', 'Piura', 'Persona', 'Retail', '2024-06-19'),
('Eusebia', 'Panaifo Tapullima', 'eusebia.panaifo240@correo.com', '934123901', '1992-04-27', 'Femenino', 'Lima', 'Lima', 'San Martín de Porres', 'Persona', 'Retail', '2025-02-06'),
('Casimiro', 'Tapullima Sangama', 'casimiro.tapullima241@correo.com', '989234012', '1978-09-09', 'Masculino', 'Callao', 'Callao', 'Bellavista', 'Persona', 'Retail', '2024-10-31'),
('Alejandrina', 'Sangama Ushiñahua', 'alejandrina.sangama242@correo.com', '956345123', '1996-02-21', 'Femenino', 'Lima', 'Lima', 'Miraflores', 'Persona', 'Retail', '2025-01-13'),
('Julián', 'Ushiñahua Amasifuen', 'julian.ushinahua243@correo.com', '923456234', '1983-07-03', 'Masculino', 'Áncash', 'Huaraz', 'Huaraz', 'Persona', 'Retail', '2024-07-01'),
('Reyna', 'Amasifuen Vásquez', 'reyna.amasifuen244@correo.com', '978567345', '1997-12-15', 'Femenino', 'Lima', 'Lima', 'Los Olivos', 'Persona', 'Retail', '2025-03-19'),
('Toribio', 'Vásquez Angulo', 'toribio.vasquez245@correo.com', '945678456', '1979-05-27', 'Masculino', 'Arequipa', 'Arequipa', 'Cercado', 'Persona', 'Retail', '2024-09-12'),
('Marina', 'Angulo Facundo', 'marina.angulo246@correo.com', '912789567', '1994-10-09', 'Femenino', 'Lima', 'Lima', 'Comas', 'Persona', 'Retail', '2025-04-02'),
('Fortunato', 'Facundo Ventura', 'fortunato.facundo247@correo.com', '967890678', '1976-03-22', 'Masculino', 'La Libertad', 'Trujillo', 'Trujillo', 'Persona', 'Retail', '2024-06-15'),
('Sabina', 'Ventura Colonia', 'sabina.ventura248@correo.com', '934901789', '1991-08-04', 'Femenino', 'Lima', 'Lima', 'San Juan de Lurigancho', 'Persona', 'Retail', '2025-02-23'),
('Feliciano', 'Colonia Escobedo', 'feliciano.colonia249@correo.com', '989012890', '1984-01-16', 'Masculino', 'Puno', 'Puno', 'Puno', 'Persona', 'Retail', '2024-08-28'),
('Justina', 'Escobedo Malca', 'justina.escobedo250@correo.com', '956123901', '1998-06-28', 'Femenino', 'Lima', 'Lima', 'Ate', 'Persona', 'Retail', '2025-01-10'),
('Ceferino', 'Malca Vigo', 'ceferino.malca251@correo.com', '923234012', '1977-11-10', 'Masculino', 'Lambayeque', 'Chiclayo', 'Chiclayo', 'Persona', 'Retail', '2024-10-06'),
('Lucinda', 'Vigo Chunga', 'lucinda.vigo252@correo.com', '978345123', '1993-04-22', 'Femenino', 'Lima', 'Lima', 'San Isidro', 'Persona', 'Retail', '2025-03-04'),
('Melecio', 'Chunga Silupu', 'melecio.chunga253@correo.com', '945456234', '1980-09-04', 'Masculino', 'Cusco', 'Cusco', 'Cusco', 'Persona', 'Retail', '2024-07-17'),
('Julia', 'Silupu Cornejo', 'julia.silupu254@correo.com', '912567345', '1995-02-16', 'Femenino', 'Lima', 'Lima', 'Santiago de Surco', 'Persona', 'Retail', '2025-04-21'),
('Segundo', 'Cornejo Damián', 'segundo.cornejo255@correo.com', '967678456', '1978-07-29', 'Masculino', 'Loreto', 'Maynas', 'Iquitos', 'Persona', 'Retail', '2024-06-09'),
('Manuela', 'Damián Chumpitazi', 'manuela.damian256@correo.com', '934789567', '1990-12-11', 'Femenino', 'Lima', 'Lima', 'Miraflores', 'Persona', 'Retail', '2025-03-27'),
('Cirilo', 'Chumpitazi Ojeda', 'cirilo.chumpitazi257@correo.com', '989890678', '1983-05-23', 'Masculino', 'Lima', 'Lima', 'Los Olivos', 'Persona', 'Retail', '2024-11-04'),
('Delfina', 'Ojeda Bocanegra', 'delfina.ojeda258@correo.com', '956901789', '1996-10-05', 'Femenino', 'Ica', 'Ica', 'Ica', 'Persona', 'Retail', '2025-01-18'),
('Marcial', 'Bocanegra Villalobos', 'marcial.bocanegra259@correo.com', '923012890', '1977-03-17', 'Masculino', 'Lima', 'Lima', 'Comas', 'Persona', 'Retail', '2024-09-21'),
('Casilda', 'Villalobos Yactayo', 'casilda.villalobos260@correo.com', '978123901', '1994-08-29', 'Femenino', 'Junín', 'Huancayo', 'Huancayo', 'Persona', 'Retail', '2025-02-04'),
('Emiliano', 'Yactayo Rosado', 'emiliano.yactayo261@correo.com', '945234012', '1981-01-11', 'Masculino', 'Lima', 'Lima', 'San Martín de Porres', 'Persona', 'Retail', '2024-08-06'),
('Aurelia', 'Rosado Angeles', 'aurelia.rosado262@correo.com', '912345123', '1997-06-23', 'Femenino', 'Lima', 'Lima', 'Ate', 'Persona', 'Retail', '2025-04-14'),
('Baltazar', 'Angeles Vílchez', 'baltazar.angeles263@correo.com', '967456234', '1979-11-05', 'Masculino', 'Piura', 'Piura', 'Piura', 'Persona', 'Retail', '2024-06-22'),
('Genoveva', 'Vílchez Barboza', 'genoveva.vilchez264@correo.com', '934567345', '1992-04-17', 'Femenino', 'Lima', 'Lima', 'San Isidro', 'Persona', 'Retail', '2025-03-09'),
('Domitilo', 'Barboza Cruzado', 'domitilo.barboza265@correo.com', '989678456', '1976-09-29', 'Masculino', 'Callao', 'Callao', 'Callao', 'Persona', 'Retail', '2024-10-27'),
('Facunda', 'Cruzado Terrones', 'facunda.cruzado266@correo.com', '956789567', '1998-02-10', 'Femenino', 'Lima', 'Lima', 'Santiago de Surco', 'Persona', 'Retail', '2025-01-06'),
('Hilario', 'Terrones Guillermo', 'hilario.terrones267@correo.com', '923890678', '1980-07-22', 'Masculino', 'Arequipa', 'Arequipa', 'Cayma', 'Persona', 'Retail', '2024-07-30'),
('Herminia', 'Guillermo Chumpitaz', 'herminia.guillermo268@correo.com', '978901789', '1993-12-04', 'Femenino', 'Lima', 'Lima', 'Miraflores', 'Persona', 'Retail', '2025-02-17'),
('Custodio', 'Chumpitaz Ísmodes', 'custodio.chumpitaz269@correo.com', '945012890', '1978-05-16', 'Masculino', 'La Libertad', 'Trujillo', 'La Esperanza', 'Persona', 'Retail', '2024-11-13'),
('Bertha', 'Ísmodes Cárcamo', 'bertha.ismodes270@correo.com', '912123901', '1995-10-28', 'Femenino', 'Lima', 'Lima', 'Comas', 'Persona', 'Retail', '2025-03-02'),
('Serafín', 'Cárcamo Damián', 'serafin.carcamo271@correo.com', '967234012', '1982-03-10', 'Masculino', 'Áncash', 'Huaraz', 'Huaraz', 'Persona', 'Retail', '2024-06-27'),
('Marcelina', 'Damián Ronceros', 'marcelina.damian272@correo.com', '934345123', '1996-08-22', 'Femenino', 'Lima', 'Lima', 'Los Olivos', 'Persona', 'Retail', '2025-04-09'),
('Sixto', 'Ronceros Layme', 'sixto.ronceros273@correo.com', '989456234', '1977-01-04', 'Masculino', 'Lima', 'Lima', 'San Juan de Lurigancho', 'Persona', 'Retail', '2024-09-15'),
('Eufemia', 'Layme Espejo', 'eufemia.layme274@correo.com', '956567345', '1994-06-16', 'Femenino', 'Puno', 'Puno', 'Puno', 'Persona', 'Retail', '2025-01-28'),
('Damián', 'Espejo Coaguila', 'damian.espejo275@correo.com', '923678456', '1983-11-28', 'Masculino', 'Lima', 'Lima', 'Ate', 'Persona', 'Retail', '2024-08-10'),
('Rufina', 'Coaguila Wong', 'rufina.coaguila276@correo.com', '978789567', '1997-04-10', 'Femenino', 'Lima', 'Lima', 'San Isidro', 'Persona', 'Retail', '2025-03-23'),
('Prudencio', 'Wong Quintanilla', 'prudencio.wong277@correo.com', '945890678', '1979-09-22', 'Masculino', 'Lambayeque', 'Chiclayo', 'Chiclayo', 'Persona', 'Retail', '2024-07-06'),
('Constantina', 'Quintanilla Málaga', 'constantina.quintanilla278@correo.com', '912901789', '1991-02-03', 'Femenino', 'Lima', 'Lima', 'Santiago de Surco', 'Persona', 'Retail', '2025-04-25'),
('Gumercindo', 'Málaga Cachay', 'gumercindo.malaga279@correo.com', '967012890', '1976-07-15', 'Masculino', 'Cusco', 'Cusco', 'Cusco', 'Persona', 'Retail', '2024-06-03'),
('Cruz', 'Cachay Sotelo', 'cruz.cachay280@correo.com', '934123901', '1998-12-27', 'Femenino', 'Lima', 'Lima', 'Miraflores', 'Persona', 'Retail', '2025-02-15'),
('Feliciano', 'Sotelo Zambrano', 'feliciano.sotelo281@correo.com', '989234012', '1981-05-09', 'Masculino', 'Loreto', 'Maynas', 'Iquitos', 'Persona', 'Retail', '2024-10-19'),
('Regina', 'Zambrano Villegas', 'regina.zambrano282@correo.com', '956345123', '1993-10-21', 'Femenino', 'Lima', 'Lima', 'Comas', 'Persona', 'Retail', '2025-01-01'),
('Encarnación', 'Villegas Grández', 'encarnacion.villegas283@correo.com', '923456234', '1977-03-03', 'Masculino', 'Ica', 'Ica', 'Ica', 'Persona', 'Retail', '2024-09-04'),
('Petronila', 'Grández Sifuentes', 'petronila.grandez284@correo.com', '978567345', '1995-08-15', 'Femenino', 'Lima', 'Lima', 'Los Olivos', 'Persona', 'Retail', '2025-03-20'),
('Anselmo', 'Sifuentes Tamayo', 'anselmo.sifuentes285@correo.com', '945678456', '1980-01-27', 'Masculino', 'Lima', 'Lima', 'San Martín de Porres', 'Persona', 'Retail', '2024-06-24'),
('Ramona', 'Tamayo Reátegui', 'ramona.tamayo286@correo.com', '912789567', '1994-06-09', 'Femenino', 'Junín', 'Huancayo', 'Huancayo', 'Persona', 'Retail', '2025-04-06'),
('Restituto', 'Reátegui Choque', 'restituto.reategui287@correo.com', '967890678', '1978-11-21', 'Masculino', 'Lima', 'Lima', 'Ate', 'Persona', 'Retail', '2024-08-15'),
('Sinforosa', 'Choque Bustamante', 'sinforosa.choque288@correo.com', '934901789', '1996-04-03', 'Femenino', 'Lima', 'Lima', 'San Isidro', 'Persona', 'Retail', '2025-02-28'),
('Melitón', 'Bustamante Loyola', 'meliton.bustamante289@correo.com', '989012890', '1979-09-15', 'Masculino', 'Piura', 'Piura', 'Piura', 'Persona', 'Retail', '2024-11-01'),
('Estefana', 'Loyola Salvatierra', 'estefana.loyola290@correo.com', '956123901', '1997-02-27', 'Femenino', 'Lima', 'Lima', 'Santiago de Surco', 'Persona', 'Retail', '2025-01-15'),
('Isaac', 'Salvatierra Paz', 'isaac.salvatierra291@correo.com', '923234012', '1982-07-10', 'Masculino', 'Callao', 'Callao', 'Callao', 'Persona', 'Retail', '2024-07-23'),
('Micaela', 'Paz Ísmodes', 'micaela.paz292@correo.com', '978345123', '1994-12-22', 'Femenino', 'Lima', 'Lima', 'Miraflores', 'Persona', 'Retail', '2025-03-12'),
('Leandro', 'Ísmodes Cornejo', 'leandro.ismodes293@correo.com', '945456234', '1977-05-04', 'Masculino', 'Arequipa', 'Arequipa', 'Cercado', 'Persona', 'Retail', '2024-10-08'),
('Emperatriz', 'Cornejo Damián', 'emperatriz.cornejo294@correo.com', '912567345', '1995-10-16', 'Femenino', 'Lima', 'Lima', 'Comas', 'Persona', 'Retail', '2025-02-09'),
('Facundo', 'Damián Chumpitazi', 'facundo.damian295@correo.com', '967678456', '1980-03-28', 'Masculino', 'La Libertad', 'Trujillo', 'Trujillo', 'Persona', 'Retail', '2024-06-17'),
('Otilia', 'Chumpitazi Ojeda', 'otilia.chumpitazi296@correo.com', '934789567', '1993-08-10', 'Femenino', 'Lima', 'Lima', 'Los Olivos', 'Persona', 'Retail', '2025-04-03'),
('Belisario', 'Ojeda Bocanegra', 'belisario.ojeda297@correo.com', '989890678', '1976-01-22', 'Masculino', 'Lima', 'Lima', 'San Juan de Lurigancho', 'Persona', 'Retail', '2024-09-29'),
('Presentación', 'Bocanegra Villalobos', 'presentacion.bocanegra298@correo.com', '956901789', '1998-06-04', 'Femenino', 'Áncash', 'Huaraz', 'Huaraz', 'Persona', 'Retail', '2025-01-12'),
('Teófilo', 'Villalobos Yactayo', 'teofilo.villalobos299@correo.com', '923012890', '1981-11-16', 'Masculino', 'Lima', 'Lima', 'Ate', 'Persona', 'Retail', '2024-08-24'),
('Asunción', 'Yactayo Rosado', 'asuncion.yactayo300@correo.com', '978123901', '1996-04-28', 'Femenino', 'Lima', 'Lima', 'San Isidro', 'Persona', 'Retail', '2025-03-16');
INSERT INTO Clientes (Nombres, Apellidos, Email, Telefono, FechaNacimiento, Genero, Departamento, Provincia, Distrito, TipoCliente, SegmentoCliente, FechaRegistro) VALUES
('Anacleto', 'Rosado Angeles', 'anacleto.rosado301@correo.com', '945234012', '1979-01-09', 'Masculino', 'Lima', 'Lima', 'Comas', 'Persona', 'Retail', '2024-06-01'),
('Bernarda', 'Angeles Vílchez', 'bernarda.angeles302@correo.com', '912345123', '1993-06-21', 'Femenino', 'Lima', 'Lima', 'Miraflores', 'Persona', 'Retail', '2025-02-19'),
('Crisóstomo', 'Vílchez Barboza', 'crisostomo.vilchez303@correo.com', '967456234', '1977-11-03', 'Masculino', 'Cusco', 'Cusco', 'Cusco', 'Persona', 'Retail', '2024-10-13'),
('Dominga', 'Barboza Cruzado', 'dominga.barboza304@correo.com', '934567345', '1995-04-15', 'Femenino', 'Lima', 'Lima', 'Santiago de Surco', 'Persona', 'Retail', '2025-01-26'),
('Eleuterio', 'Cruzado Terrones', 'eleuterio.cruzado305@correo.com', '989678456', '1980-09-27', 'Masculino', 'Lambayeque', 'Chiclayo', 'Chiclayo', 'Persona', 'Retail', '2024-07-09'),
('Florinda', 'Terrones Guillermo', 'florinda.terrones306@correo.com', '956789567', '1997-02-08', 'Femenino', 'Lima', 'Lima', 'Ate', 'Persona', 'Retail', '2025-04-01'),
('Guillermo', 'Guillermo Chumpitaz', 'guillermo.guillermo307@correo.com', '923890678', '1983-07-20', 'Masculino', 'Lima', 'Lima', 'San Martín de Porres', 'Persona', 'Retail', '2024-08-19'),
('Higinia', 'Chumpitaz Ísmodes', 'higinia.chumpitaz308@correo.com', '978901789', '1990-12-02', 'Femenino', 'Junín', 'Huancayo', 'Huancayo', 'Persona', 'Retail', '2025-03-06'),
('Indalecio', 'Ísmodes Cárcamo', 'indalecio.ismodes309@correo.com', '945012890', '1976-05-14', 'Masculino', 'Lima', 'Lima', 'Los Olivos', 'Persona', 'Retail', '2024-11-24'),
('Josefina', 'Cárcamo Damián', 'josefina.carcamo310@correo.com', '912123901', '1998-10-26', 'Femenino', 'Lima', 'Lima', 'San Isidro', 'Persona', 'Retail', '2025-01-08'),
('Krisna', 'Damián Ronceros', 'krisna.damian311@correo.com', '967234012', '1981-03-08', 'Masculino', 'Piura', 'Piura', 'Piura', 'Persona', 'Retail', '2024-09-05'),
('Leonor', 'Ronceros Layme', 'leonor.ronceros312@correo.com', '934345123', '1994-08-20', 'Femenino', 'Lima', 'Lima', 'Comas', 'Persona', 'Retail', '2025-02-22'),
('Marcolino', 'Layme Espejo', 'marcolino.layme313@correo.com', '989456234', '1977-01-02', 'Masculino', 'Arequipa', 'Arequipa', 'Cayma', 'Persona', 'Retail', '2024-06-16'),
('Natividad', 'Espejo Coaguila', 'natividad.espejo314@correo.com', '956567345', '1995-06-14', 'Femenino', 'Lima', 'Lima', 'Miraflores', 'Persona', 'Retail', '2025-04-11'),
('Onofre', 'Coaguila Wong', 'onofre.coaguila315@correo.com', '923678456', '1979-11-26', 'Masculino', 'Puno', 'Puno', 'Puno', 'Persona', 'Retail', '2024-08-02'),
('Presentación', 'Wong Quintanilla', 'presentacion.wong316@correo.com', '978789567', '1992-04-08', 'Femenino', 'Lima', 'Lima', 'Santiago de Surco', 'Persona', 'Retail', '2025-03-25'),
('Quintiliano', 'Quintanilla Málaga', 'quintiliano.quintanilla317@correo.com', '945890678', '1976-09-20', 'Masculino', 'La Libertad', 'Trujillo', 'Trujillo', 'Persona', 'Retail', '2024-10-30'),
('Romualda', 'Málaga Cachay', 'romualda.malaga318@correo.com', '912901789', '1998-02-02', 'Femenino', 'Lima', 'Lima', 'Ate', 'Persona', 'Retail', '2025-01-14'),
('Saturnino', 'Cachay Sotelo', 'saturnino.cachay319@correo.com', '967012890', '1980-07-15', 'Masculino', 'Ica', 'Ica', 'Ica', 'Persona', 'Retail', '2024-06-08'),
('Teodolinda', 'Sotelo Zambrano', 'teodolinda.sotelo320@correo.com', '934123901', '1993-12-27', 'Femenino', 'Lima', 'Lima', 'San Juan de Lurigancho', 'Persona', 'Retail', '2025-02-13'),
('Urbano', 'Zambrano Villegas', 'urbano.zambrano321@correo.com', '989234012', '1977-05-09', 'Masculino', 'Callao', 'Callao', 'Bellavista', 'Persona', 'Retail', '2024-09-20'),
('Valentina', 'Villegas Grández', 'valentina.villegas322@correo.com', '956345123', '1996-10-21', 'Femenino', 'Lima', 'Lima', 'Los Olivos', 'Persona', 'Retail', '2025-04-24'),
('Wenceslao', 'Grández Sifuentes', 'wenceslao.grandez323@correo.com', '923456234', '1979-03-03', 'Masculino', 'Loreto', 'Maynas', 'Iquitos', 'Persona', 'Retail', '2024-07-27'),
('Xiomara', 'Sifuentes Tamayo', 'xiomara.sifuentes324@correo.com', '978567345', '1997-08-15', 'Femenino', 'Lima', 'Lima', 'San Isidro', 'Persona', 'Retail', '2025-03-03'),
('Ysidro', 'Tamayo Reátegui', 'ysidro.tamayo325@correo.com', '945678456', '1981-01-27', 'Masculino', 'Áncash', 'Huaraz', 'Huaraz', 'Persona', 'Retail', '2024-11-06'),
('Zoraida', 'Reátegui Choque', 'zoraida.reategui326@correo.com', '912789567', '1994-06-09', 'Femenino', 'Lima', 'Lima', 'Comas', 'Persona', 'Retail', '2025-01-20'),
('Abraham', 'Choque Bustamante', 'abraham.choque327@correo.com', '967890678', '1978-11-21', 'Masculino', 'Cusco', 'Cusco', 'Cusco', 'Persona', 'Retail', '2024-08-13'),
('Bibiana', 'Bustamante Loyola', 'bibiana.bustamante328@correo.com', '934901789', '1996-04-03', 'Femenino', 'Lima', 'Lima', 'Miraflores', 'Persona', 'Retail', '2025-02-26'),
('Cornelio', 'Loyola Salvatierra', 'cornelio.loyola329@correo.com', '989012890', '1980-09-15', 'Masculino', 'Lambayeque', 'Chiclayo', 'Chiclayo', 'Persona', 'Retail', '2024-10-02'),
('Dalila', 'Salvatierra Paz', 'dalila.salvatierra330@correo.com', '956123901', '1993-02-27', 'Femenino', 'Lima', 'Lima', 'Santiago de Surco', 'Persona', 'Retail', '2025-04-17'),
('Eugenio', 'Paz Ísmodes', 'eugenio.paz331@correo.com', '923234012', '1977-07-10', 'Masculino', 'Arequipa', 'Arequipa', 'Cercado', 'Persona', 'Retail', '2024-06-30'),
('Feliciana', 'Ísmodes Cornejo', 'feliciana.ismodes332@correo.com', '978345123', '1995-12-22', 'Femenino', 'Lima', 'Lima', 'Ate', 'Persona', 'Retail', '2025-01-03'),
('Gervasio', 'Cornejo Damián', 'gervasio.cornejo333@correo.com', '945456234', '1979-05-04', 'Masculino', 'Junín', 'Huancayo', 'Huancayo', 'Persona', 'Retail', '2024-09-11'),
('Hortensia', 'Damián Chumpitazi', 'hortensia.damian334@correo.com', '912567345', '1997-10-16', 'Femenino', 'Lima', 'Lima', 'San Martín de Porres', 'Persona', 'Retail', '2025-03-29'),
('Ireneo', 'Chumpitazi Ojeda', 'ireneo.chumpitazi335@correo.com', '967678456', '1981-03-28', 'Masculino', 'Lima', 'Lima', 'Los Olivos', 'Persona', 'Retail', '2024-07-16'),
('Juana', 'Ojeda Bocanegra', 'juana.ojeda336@correo.com', '934789567', '1994-08-10', 'Femenino', 'Piura', 'Piura', 'Piura', 'Persona', 'Retail', '2025-02-07'),
('Kléber', 'Bocanegra Villalobos', 'kleber.bocanegra337@correo.com', '989890678', '1978-01-22', 'Masculino', 'Lima', 'Lima', 'San Isidro', 'Persona', 'Retail', '2024-11-28'),
('Leonarda', 'Villalobos Yactayo', 'leonarda.villalobos338@correo.com', '956901789', '1996-06-04', 'Femenino', 'Lima', 'Lima', 'Comas', 'Persona', 'Retail', '2025-01-19'),
('Marcial', 'Yactayo Rosado', 'marcial.yactayo339@correo.com', '923012890', '1980-11-16', 'Masculino', 'Puno', 'Puno', 'Puno', 'Persona', 'Retail', '2024-08-31'),
('Nazaria', 'Rosado Angeles', 'nazaria.rosado340@correo.com', '978123901', '1993-04-28', 'Femenino', 'Lima', 'Lima', 'Miraflores', 'Persona', 'Retail', '2025-03-13'),
('Olegario', 'Angeles Vílchez', 'olegario.angeles341@correo.com', '945234012', '1977-09-10', 'Masculino', 'La Libertad', 'Trujillo', 'La Esperanza', 'Persona', 'Retail', '2024-06-25'),
('Prudencia', 'Vílchez Barboza', 'prudencia.vilchez342@correo.com', '912345123', '1995-02-22', 'Femenino', 'Lima', 'Lima', 'Santiago de Surco', 'Persona', 'Retail', '2025-04-06'),
('Quirino', 'Barboza Cruzado', 'quirino.barboza343@correo.com', '967456234', '1979-07-04', 'Masculino', 'Callao', 'Callao', 'Callao', 'Persona', 'Retail', '2024-10-17'),
('Rosaura', 'Cruzado Terrones', 'rosaura.cruzado344@correo.com', '934567345', '1997-12-16', 'Femenino', 'Lima', 'Lima', 'San Juan de Lurigancho', 'Persona', 'Retail', '2025-01-31'),
('Segismundo', 'Terrones Guillermo', 'segismundo.terrones345@correo.com', '989678456', '1981-05-28', 'Masculino', 'Ica', 'Ica', 'Ica', 'Persona', 'Retail', '2024-09-08'),
('Trinidad', 'Guillermo Chumpitaz', 'trinidad.guillermo346@correo.com', '956789567', '1994-10-10', 'Femenino', 'Lima', 'Lima', 'Los Olivos', 'Persona', 'Retail', '2025-02-20'),
('Ubaldino', 'Chumpitaz Ísmodes', 'ubaldino.chumpitaz347@correo.com', '923890678', '1978-03-22', 'Masculino', 'Loreto', 'Maynas', 'Iquitos', 'Persona', 'Retail', '2024-07-04'),
('Visitación', 'Ísmodes Cárcamo', 'visitacion.ismodes348@correo.com', '978901789', '1996-08-04', 'Femenino', 'Lima', 'Lima', 'Ate', 'Persona', 'Retail', '2025-04-29'),
('Wilfredo', 'Cárcamo Damián', 'wilfredo.carcamo349@correo.com', '945012890', '1980-01-16', 'Masculino', 'Áncash', 'Huaraz', 'Huaraz', 'Persona', 'Retail', '2024-06-12'),
('Ximena', 'Damián Ronceros', 'ximena.damian350@correo.com', '912123901', '1993-06-28', 'Femenino', 'Lima', 'Lima', 'San Martín de Porres', 'Persona', 'Retail', '2025-03-17'),
('Yolando', 'Ronceros Layme', 'yolando.ronceros351@correo.com', '967234012', '1977-11-10', 'Masculino', 'Arequipa', 'Arequipa', 'Cayma', 'Persona', 'Retail', '2024-08-27'),
('Zenaida', 'Layme Espejo', 'zenaida.layme352@correo.com', '934345123', '1995-04-22', 'Femenino', 'Lima', 'Lima', 'Miraflores', 'Persona', 'Retail', '2025-02-04'),
('Abelino', 'Espejo Coaguila', 'abelino.espejo353@correo.com', '989456234', '1979-09-04', 'Masculino', 'Cusco', 'Cusco', 'Cusco', 'Persona', 'Retail', '2024-10-21'),
('Balbina', 'Coaguila Wong', 'balbina.coaguila354@correo.com', '956567345', '1997-02-16', 'Femenino', 'Lima', 'Lima', 'Comas', 'Persona', 'Retail', '2025-01-05'),
('Cirilo', 'Wong Quintanilla', 'cirilo.wong355@correo.com', '923678456', '1981-07-28', 'Masculino', 'Lambayeque', 'Chiclayo', 'Chiclayo', 'Persona', 'Retail', '2024-09-16'),
('Dorotea', 'Quintanilla Málaga', 'dorotea.quintanilla356@correo.com', '978789567', '1994-12-10', 'Femenino', 'Lima', 'Lima', 'San Isidro', 'Persona', 'Retail', '2025-04-08'),
('Eleodoro', 'Málaga Cachay', 'eleodoro.malaga357@correo.com', '945890678', '1978-05-22', 'Masculino', 'Junín', 'Huancayo', 'Huancayo', 'Persona', 'Retail', '2024-06-06'),
('Fructuosa', 'Cachay Sotelo', 'fructuosa.cachay358@correo.com', '912901789', '1996-10-04', 'Femenino', 'Lima', 'Lima', 'Santiago de Surco', 'Persona', 'Retail', '2025-03-21'),
('Gaudencio', 'Sotelo Zambrano', 'gaudencio.sotelo359@correo.com', '967012890', '1980-03-16', 'Masculino', 'Lima', 'Lima', 'Ate', 'Persona', 'Retail', '2024-11-09'),
('Herlinda', 'Zambrano Villegas', 'herlinda.zambrano360@correo.com', '934123901', '1993-08-28', 'Femenino', 'Piura', 'Piura', 'Piura', 'Persona', 'Retail', '2025-01-23'),
('Ignacio', 'Villegas Grández', 'ignacio.villegas361@correo.com', '989234012', '1977-01-10', 'Masculino', 'Lima', 'Lima', 'Los Olivos', 'Persona', 'Retail', '2024-07-30'),
('Jacinta', 'Grández Sifuentes', 'jacinta.grandez362@correo.com', '956345123', '1995-06-22', 'Femenino', 'Lima', 'Lima', 'San Juan de Lurigancho', 'Persona', 'Retail', '2025-04-12'),
('Kilmer', 'Sifuentes Tamayo', 'kilmer.sifuentes363@correo.com', '923456234', '1979-11-04', 'Masculino', 'Puno', 'Puno', 'Puno', 'Persona', 'Retail', '2024-08-23'),
('Ludovina', 'Tamayo Reátegui', 'ludovina.tamayo364@correo.com', '978567345', '1997-04-16', 'Femenino', 'Lima', 'Lima', 'Miraflores', 'Persona', 'Retail', '2025-02-01'),
('Maurilio', 'Reátegui Choque', 'maurilio.reategui365@correo.com', '945678456', '1981-09-28', 'Masculino', 'La Libertad', 'Trujillo', 'Trujillo', 'Persona', 'Retail', '2024-10-15'),
('Nemesia', 'Choque Bustamante', 'nemesia.choque366@correo.com', '912789567', '1994-02-10', 'Femenino', 'Lima', 'Lima', 'Comas', 'Persona', 'Retail', '2025-03-30'),
('Odilón', 'Bustamante Loyola', 'odilon.bustamante367@correo.com', '967890678', '1978-07-22', 'Masculino', 'Callao', 'Callao', 'Bellavista', 'Persona', 'Retail', '2024-06-19'),
('Petronila', 'Loyola Salvatierra', 'petronila.loyola368@correo.com', '934901789', '1996-12-04', 'Femenino', 'Lima', 'Lima', 'Santiago de Surco', 'Persona', 'Retail', '2025-01-27'),
('Quintín', 'Salvatierra Paz', 'quintin.salvatierra369@correo.com', '989012890', '1980-05-16', 'Masculino', 'Ica', 'Ica', 'Ica', 'Persona', 'Retail', '2024-09-02'),
('Reymunda', 'Paz Ísmodes', 'reymunda.paz370@correo.com', '956123901', '1993-10-28', 'Femenino', 'Lima', 'Lima', 'Ate', 'Persona', 'Retail', '2025-04-18'),
('Segundo', 'Ísmodes Cornejo', 'segundo.ismodes371@correo.com', '923234012', '1977-03-10', 'Masculino', 'Arequipa', 'Arequipa', 'Cercado', 'Persona', 'Retail', '2024-07-13'),
('Teodora', 'Cornejo Damián', 'teodora.cornejo372@correo.com', '978345123', '1995-08-22', 'Femenino', 'Lima', 'Lima', 'San Isidro', 'Persona', 'Retail', '2025-02-25'),
('Ulises', 'Damián Chumpitazi', 'ulises.damian373@correo.com', '945456234', '1979-01-04', 'Masculino', 'Áncash', 'Huaraz', 'Huaraz', 'Persona', 'Retail', '2024-11-17'),
('Venancia', 'Chumpitazi Ojeda', 'venancia.chumpitazi374@correo.com', '912567345', '1997-06-16', 'Femenino', 'Lima', 'Lima', 'Los Olivos', 'Persona', 'Retail', '2025-01-09'),
('Wilmer', 'Ojeda Bocanegra', 'wilmer.ojeda375@correo.com', '967678456', '1981-11-28', 'Masculino', 'Lambayeque', 'Chiclayo', 'Chiclayo', 'Persona', 'Retail', '2024-08-05'),
('Ysabel', 'Bocanegra Villalobos', 'ysabel.bocanegra376@correo.com', '934789567', '1994-04-10', 'Femenino', 'Lima', 'Lima', 'San Martín de Porres', 'Persona', 'Retail', '2025-03-24'),
('Zacarías', 'Villalobos Yactayo', 'zacarias.villalobos377@correo.com', '989890678', '1978-09-22', 'Masculino', 'Cusco', 'Cusco', 'Cusco', 'Persona', 'Retail', '2024-06-28'),
('Adelina', 'Yactayo Rosado', 'adelina.yactayo378@correo.com', '956901789', '1996-02-04', 'Femenino', 'Lima', 'Lima', 'Miraflores', 'Persona', 'Retail', '2025-04-13'),
('Bonifacio', 'Rosado Angeles', 'bonifacio.rosado379@correo.com', '923012890', '1980-07-16', 'Masculino', 'Loreto', 'Maynas', 'Iquitos', 'Persona', 'Retail', '2024-10-24'),
('Celestina', 'Angeles Vílchez', 'celestina.angeles380@correo.com', '978123901', '1993-12-28', 'Femenino', 'Lima', 'Lima', 'Comas', 'Persona', 'Retail', '2025-01-16'),
('Delfín', 'Vílchez Barboza', 'delfin.vilchez381@correo.com', '945234012', '1977-05-10', 'Masculino', 'Lima', 'Lima', 'Santiago de Surco', 'Persona', 'Retail', '2024-09-19'),
('Eduviges', 'Barboza Cruzado', 'eduviges.barboza382@correo.com', '912345123', '1995-10-22', 'Femenino', 'Junín', 'Huancayo', 'Huancayo', 'Persona', 'Retail', '2025-02-08'),
('Florencio', 'Cruzado Terrones', 'florencio.cruzado383@correo.com', '967456234', '1979-03-04', 'Masculino', 'Lima', 'Lima', 'Ate', 'Persona', 'Retail', '2024-07-21'),
('Gumersinda', 'Terrones Guillermo', 'gumersinda.terrones384@correo.com', '934567345', '1997-08-16', 'Femenino', 'Piura', 'Piura', 'Piura', 'Persona', 'Retail', '2025-03-06'),
('Herminio', 'Guillermo Chumpitaz', 'herminio.guillermo385@correo.com', '989678456', '1981-01-28', 'Masculino', 'Lima', 'Lima', 'Los Olivos', 'Persona', 'Retail', '2024-11-30'),
('Isolina', 'Chumpitaz Ísmodes', 'isolina.chumpitaz386@correo.com', '956789567', '1994-06-10', 'Femenino', 'Lima', 'Lima', 'San Isidro', 'Persona', 'Retail', '2025-01-22'),
('Jerónimo', 'Ísmodes Cárcamo', 'jeronimo.ismodes387@correo.com', '923890678', '1978-11-22', 'Masculino', 'Puno', 'Puno', 'Puno', 'Persona', 'Retail', '2024-08-16'),
('Ketty', 'Cárcamo Damián', 'ketty.carcamo388@correo.com', '978901789', '1996-04-04', 'Femenino', 'Lima', 'Lima', 'San Juan de Lurigancho', 'Persona', 'Retail', '2025-04-04'),
('Lisandro', 'Damián Ronceros', 'lisandro.damian389@correo.com', '945012890', '1980-09-16', 'Masculino', 'La Libertad', 'Trujillo', 'La Esperanza', 'Persona', 'Retail', '2024-06-10'),
('Melania', 'Ronceros Layme', 'melania.ronceros390@correo.com', '912123901', '1993-02-28', 'Femenino', 'Lima', 'Lima', 'Miraflores', 'Persona', 'Retail', '2025-02-14'),
('Nicanor', 'Layme Espejo', 'nicanor.layme391@correo.com', '967234012', '1977-07-10', 'Masculino', 'Callao', 'Callao', 'Callao', 'Persona', 'Retail', '2024-10-04'),
('Olimpia', 'Espejo Coaguila', 'olimpia.espejo392@correo.com', '934345123', '1995-12-22', 'Femenino', 'Lima', 'Lima', 'Comas', 'Persona', 'Retail', '2025-03-28'),
('Porfirio', 'Coaguila Wong', 'porfirio.coaguila393@correo.com', '989456234', '1979-05-04', 'Masculino', 'Arequipa', 'Arequipa', 'Cayma', 'Persona', 'Retail', '2024-06-05'),
('Querubina', 'Wong Quintanilla', 'querubina.wong394@correo.com', '956567345', '1997-10-16', 'Femenino', 'Lima', 'Lima', 'Ate', 'Persona', 'Retail', '2025-01-11'),
('Rosalino', 'Quintanilla Málaga', 'rosalino.quintanilla395@correo.com', '923678456', '1981-03-28', 'Masculino', 'Ica', 'Ica', 'Ica', 'Persona', 'Retail', '2024-09-27'),
('Sabina', 'Málaga Cachay', 'sabina.malaga396@correo.com', '978789567', '1994-08-10', 'Femenino', 'Lima', 'Lima', 'Santiago de Surco', 'Persona', 'Retail', '2025-04-20'),
('Timoteo', 'Cachay Sotelo', 'timoteo.cachay397@correo.com', '945890678', '1978-01-22', 'Masculino', 'Áncash', 'Huaraz', 'Huaraz', 'Persona', 'Retail', '2024-07-14'),
('Ubalda', 'Sotelo Zambrano', 'ubalda.sotelo398@correo.com', '912901789', '1996-06-04', 'Femenino', 'Lima', 'Lima', 'San Martín de Porres', 'Persona', 'Retail', '2025-02-27'),
('Vidal', 'Zambrano Villegas', 'vidal.zambrano399@correo.com', '967012890', '1980-11-16', 'Masculino', 'Lambayeque', 'Chiclayo', 'Chiclayo', 'Persona', 'Retail', '2024-10-09'),
('Wilma', 'Villegas Grández', 'wilma.villegas400@correo.com', '934123901', '1993-04-28', 'Femenino', 'Lima', 'Lima', 'Los Olivos', 'Persona', 'Retail', '2025-03-11');

-- ============================================================
-- 7. CALENDARIO (rango 2024-01-01 a 2026-12-31)
-- ============================================================
DECLARE @FechaInicio DATE = '2024-01-01';
DECLARE @FechaFin DATE = '2026-12-31';

WHILE @FechaInicio <= @FechaFin
BEGIN
    INSERT INTO Calendario (Fecha) VALUES (@FechaInicio);
    SET @FechaInicio = DATEADD(DAY, 1, @FechaInicio);
END;
GO

-- ============================================================
-- 8. INVENTARIO (90 productos x 8 tiendas = 720 registros)
-- ============================================================
INSERT INTO Inventario (ProductoID, TiendaID, StockActual, StockMinimo, FechaActualizacion)
SELECT
    p.ProductoID,
    t.TiendaID,
    CASE
        WHEN p.PrecioUnitario >= 300 THEN 5 + (ABS(CHECKSUM(NEWID())) % 10)
        WHEN p.PrecioUnitario >= 100 THEN 15 + (ABS(CHECKSUM(NEWID())) % 20)
        WHEN p.PrecioUnitario >= 30  THEN 30 + (ABS(CHECKSUM(NEWID())) % 40)
        ELSE 60 + (ABS(CHECKSUM(NEWID())) % 80)
    END AS StockActual,
    CASE
        WHEN p.PrecioUnitario >= 300 THEN 2
        WHEN p.PrecioUnitario >= 100 THEN 5
        WHEN p.PrecioUnitario >= 30  THEN 10
        ELSE 15
    END AS StockMinimo,
    DATEADD(DAY, -(ABS(CHECKSUM(NEWID())) % 30), GETDATE()) AS FechaActualizacion
FROM Productos p
CROSS JOIN Tiendas t;
GO

-- ============================================================
-- 9. TRANSACCIONES (10,000 registros con Pareto + estacionalidad)
-- ============================================================
DECLARE @ClientesVIP TABLE (ClienteID INT);
INSERT INTO @ClientesVIP
SELECT TOP 80 ClienteID FROM Clientes ORDER BY ClienteID;

DECLARE @PesosMes TABLE (Mes INT, Peso INT);
INSERT INTO @PesosMes VALUES
(1, 8), (2, 7), (3, 10), (4, 8), (5, 8), (6, 9),
(7, 18), (8, 9), (9, 8), (10, 15), (11, 16), (12, 20);

DECLARE @i INT = 1;

WHILE @i <= 10000
BEGIN
    DECLARE @MesElegido INT, @FechaTx DATE, @ClienteSel INT, @ProductoSel INT;
    DECLARE @TiendaSel INT, @MetodoSel INT, @CantidadSel INT;
    DECLARE @PrecioSel DECIMAL(10,2), @DescuentoSel DECIMAL(10,2);
    DECLARE @SubtotalSel DECIMAL(10,2), @IGVSel DECIMAL(10,2), @TotalSel DECIMAL(10,2);
    DECLARE @CanalSel NVARCHAR(10);
    DECLARE @RandMetodo INT, @RandDescuento INT, @AnioSel INT;

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

    SET @AnioSel = CASE WHEN ABS(CHECKSUM(NEWID())) % 100 < 70 THEN 2025 ELSE 2024 END;
    SET @FechaTx = DATEFROMPARTS(@AnioSel, @MesElegido, 1 + (ABS(CHECKSUM(NEWID())) % 28));

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
-- 10. DEVOLUCIONES (500 registros, ~5% tasa de devolución)
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

WHILE @j <= 500
BEGIN
    DECLARE @TxSel INT, @FechaCompra DATE, @FechaDevol DATE;
    DECLARE @CantidadTx INT, @PrecioTx DECIMAL(10,2), @CantidadDevSel INT;
    DECLARE @MotivoSel NVARCHAR(50), @MontoDevSel DECIMAL(10,2);
    DECLARE @DiasDespues INT;

    SELECT TOP 1 @TxSel = TransaccionID, @FechaCompra = Fecha,
                 @CantidadTx = Cantidad, @PrecioTx = PrecioUnitario
    FROM Transacciones
    WHERE TransaccionID NOT IN (SELECT TransaccionID FROM Devoluciones)
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
