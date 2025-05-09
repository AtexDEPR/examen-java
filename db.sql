-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS soluciones_eficientes;
USE soluciones_eficientes;

-- Crear tablas con sus respectivas relaciones

-- Tabla Cliente
CREATE TABLE Cliente (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Representante VARCHAR(100) NOT NULL,
    Correo VARCHAR(100) NOT NULL,
    Telefono VARCHAR(20) NOT NULL,
    Direccion VARCHAR(200) NOT NULL,
    Sector ENUM('Tecnologia', 'Salud', 'Educacion', 'Comercio', 'Manufactura') NOT NULL
);

-- Tabla Servicio
CREATE TABLE Servicio (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Descripcion TEXT,
    PrecioPorHora DECIMAL(10, 2) NOT NULL,
    Categoria ENUM('TI', 'Limpieza', 'Seguridad', 'Administracion') NOT NULL
);

-- Tabla Proyecto
CREATE TABLE Proyecto (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    ID_Cliente INT NOT NULL,
    Nombre VARCHAR(100) NOT NULL,
    FechaInicio DATE NOT NULL,
    FechaFin DATE,
    Estado ENUM('En curso', 'Completado', 'Cancelado') NOT NULL DEFAULT 'En curso',
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID)
);

-- Tabla Empleado
CREATE TABLE Empleado (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Cargo VARCHAR(100) NOT NULL,
    Salario DECIMAL(10, 2) NOT NULL,
    Especialidad ENUM('TI', 'Administracion', 'Limpieza', 'Seguridad') NOT NULL,
    ID_Proyecto INT,
    FOREIGN KEY (ID_Proyecto) REFERENCES Proyecto(ID)
);

-- Tabla Contrato
CREATE TABLE Contrato (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    ID_Cliente INT NOT NULL,
    ID_Servicio INT NOT NULL,
    FechaInicio DATE NOT NULL,
    FechaFin DATE,
    CostoTotal DECIMAL(12, 2),
    Estado ENUM('Activo', 'En espera', 'Finalizado') NOT NULL DEFAULT 'Activo',
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID),
    FOREIGN KEY (ID_Servicio) REFERENCES Servicio(ID)
);

-- Tabla Asignación (Relación muchos a muchos entre Empleado y Proyecto)
CREATE TABLE Asignacion (
    ID_Empleado INT NOT NULL,
    ID_Proyecto INT NOT NULL,
    HorasTrabajadas DECIMAL(8, 2) DEFAULT 0,
    FechaAsignacion DATE NOT NULL,
    PRIMARY KEY (ID_Empleado, ID_Proyecto),
    FOREIGN KEY (ID_Empleado) REFERENCES Empleado(ID),
    FOREIGN KEY (ID_Proyecto) REFERENCES Proyecto(ID)
);

-- Insertar datos 

-- Clientes
INSERT INTO Cliente (Nombre, Representante, Correo, Telefono, Direccion, Sector) VALUES
('TecnoGlobal', 'Laura Martínez', 'lmartinez@tecnoglobal.com', '3101234567', 'Calle 85 #45-28, Bogotá', 'Tecnologia'),
('Clínica Vida', 'Carlos Ruiz', 'cruiz@clinicavida.com', '3157654321', 'Carrera 23 #70-15, Medellín', 'Salud'),
('Educando Futuro', 'Patricia Gómez', 'pgomez@educandofuturo.edu.co', '3209876543', 'Avenida 5 #12-45, Cali', 'Educacion'),
('SuperMercados ABC', 'Andrés López', 'alopez@superabc.com', '3112345678', 'Calle 45 #23-10, Barranquilla', 'Comercio'),
('Industrias MetalCol', 'Javier Torres', 'jtorres@metalcol.com', '3145678901', 'Km 5 Vía Oriental, Bucaramanga', 'Manufactura');

-- Servicios
INSERT INTO Servicio (Nombre, Descripcion, PrecioPorHora, Categoria) VALUES
('Desarrollo de Software', 'Creación de aplicaciones a medida para empresas', 120000.00, 'TI'),
('Soporte Técnico', 'Asistencia y mantenimiento de sistemas informáticos', 80000.00, 'TI'),
('Limpieza Industrial', 'Servicios de limpieza profunda para plantas y fábricas', 30000.00, 'Limpieza'),
('Limpieza de Oficinas', 'Servicios diarios de limpieza para espacios corporativos', 25000.00, 'Limpieza'),
('Vigilancia Física', 'Personal de seguridad para instalaciones', 35000.00, 'Seguridad'),
('Vigilancia Electrónica', 'Monitoreo de cámaras y sistemas de seguridad', 40000.00, 'Seguridad'),
('Gestión de Nómina', 'Administración completa de pagos y prestaciones', 70000.00, 'Administracion'),
('Reclutamiento', 'Selección y contratación de personal', 65000.00, 'Administracion');

-- Proyectos
INSERT INTO Proyecto (ID_Cliente, Nombre, FechaInicio, FechaFin, Estado) VALUES
(1, 'Sistema de Gestión TecnoGlobal', '2023-01-15', '2023-10-30', 'En curso'),
(2, 'Actualización Seguridad Clínica Vida', '2023-02-10', '2023-07-20', 'Completado'),
(3, 'Plataforma E-learning Educando Futuro', '2023-03-05', NULL, 'En curso'),
(4, 'Automatización Inventarios SuperMercados ABC', '2023-01-20', '2023-06-15', 'Completado'),
(5, 'Sistema de Control de Producción MetalCol', '2023-04-10', NULL, 'En curso');

-- Empleados
INSERT INTO Empleado (Nombre, Cargo, Salario, Especialidad, ID_Proyecto) VALUES
('Juan Pérez', 'Analista de Sistemas', 3500000.00, 'TI', 1),
('María Rodríguez', 'Desarrolladora Senior', 4200000.00, 'TI', 1),
('Pedro Sánchez', 'Desarrollador Junior', 2800000.00, 'TI', 3),
('Marta Gómez', 'Supervisora de Limpieza', 2200000.00, 'Limpieza', 2),
('Luis Ramírez', 'Técnico de Limpieza', 1800000.00, 'Limpieza', 4),
('Ana Torres', 'Guardia de Seguridad', 1950000.00, 'Seguridad', 2),
('Jorge Díaz', 'Técnico en Sistemas de Seguridad', 2500000.00, 'Seguridad', 5),
('Carolina Vargas', 'Analista de Recursos Humanos', 2800000.00, 'Administracion', 3),
('Roberto Fernández', 'Coordinador de Nómina', 3100000.00, 'Administracion', 4);

-- Contratos
INSERT INTO Contrato (ID_Cliente, ID_Servicio, FechaInicio, FechaFin, CostoTotal, Estado) VALUES
(1, 1, '2023-01-15', '2023-12-15', 28800000.00, 'Activo'),
(1, 2, '2023-01-20', '2023-12-20', 9600000.00, 'Activo'),
(2, 3, '2023-02-10', '2023-08-10', 5400000.00, 'Finalizado'),
(2, 5, '2023-02-15', '2023-08-15', 6300000.00, 'Finalizado'),
(3, 1, '2023-03-05', '2024-03-05', 28800000.00, 'Activo'),
(3, 8, '2023-03-10', '2024-03-10', 15600000.00, 'Activo'),
(4, 4, '2023-01-20', '2023-07-20', 4500000.00, 'Finalizado'),
(4, 7, '2023-01-25', '2023-07-25', 12600000.00, 'Finalizado'),
(5, 2, '2023-04-10', '2024-04-10', 19200000.00, 'Activo'),
(5, 6, '2023-04-15', '2024-04-15', 9600000.00, 'Activo');

-- Asignaciones
INSERT INTO Asignacion (ID_Empleado, ID_Proyecto, HorasTrabajadas, FechaAsignacion) VALUES
(1, 1, 320.5, '2023-01-15'),
(2, 1, 310.0, '2023-01-15'),
(3, 3, 280.5, '2023-03-05'),
(4, 2, 180.0, '2023-02-10'),
(5, 4, 160.5, '2023-01-20'),
(6, 2, 190.0, '2023-02-15'),
(7, 5, 210.5, '2023-04-10'),
(8, 3, 250.0, '2023-03-10'),
(9, 4, 230.5, '2023-01-25'),
(1, 5, 150.0, '2023-04-15'),
(2, 3, 180.5, '2023-03-20');
