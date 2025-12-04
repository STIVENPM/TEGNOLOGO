CREATE DATABASE Restaurante;


USE Restaurante;

-- Tablas básicas
CREATE TABLE Mesero (
    id_mesero INT PRIMARY KEY NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(15) NOT NULL
);

CREATE TABLE Plato (
    id_plato INT PRIMARY KEY NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    precio DECIMAL(10,2) NOT NULL
);

CREATE TABLE Orden (
    id_orden INT PRIMARY KEY NOT NULL,
    id_mesero INT NOT NULL,
    fecha DATETIME NOT NULL,
    numero_orden VARCHAR(20) NOT NULL UNIQUE,
    FOREIGN KEY (id_mesero) REFERENCES Mesero(id_mesero)
);

CREATE TABLE DetalleOrden (
    id_detalle INT PRIMARY KEY NOT NULL,
    id_orden INT NOT NULL,
    id_plato INT NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    cantidad INT NOT NULL,
    FOREIGN KEY (id_orden) REFERENCES Orden(id_orden),
    FOREIGN KEY (id_plato) REFERENCES Plato(id_plato)
);

-- Datos de ejemplo
INSERT INTO Mesero VALUES
(1, 'Juan Pérez', '555-1234'),
(2, 'María García', '555-5678'),
(3, 'Carlos López', '555-9012');

INSERT INTO Plato VALUES
(1, 'Pasta Carbonara', 250.00),
(2, 'Ensalada César', 180.00),
(3, 'Filete Mignon', 350.00),
(4, 'Sopa del día', 120.00);

INSERT INTO Orden VALUES
(1, 1, '2024-06-07 12:30:00', 'ORD-001'),
(2, 2, '2024-06-07 13:15:00', 'ORD-002'),
(3, 1, '2024-06-07 14:45:00', 'ORD-003'),
(4, 3, '2024-06-07 15:30:00', 'ORD-004');

INSERT INTO DetalleOrden VALUES
(1, 1, 1, 250.00, 2),
(2, 1, 4, 120.00, 1),
(3, 2, 2, 180.00, 1),
(4, 3, 3, 350.00, 1),
(5, 4, 1, 250.00, 1),
(6, 4, 2, 180.00, 1);

-- Consulta 1 
SELECT 
    o.numero_orden AS '#orden', 
    m.nombre AS 'mesero',           
    o.fecha,                      
    p.nombre AS 'plato',            
    do.valor AS 'precio_unitario',  
    do.cantidad,                 
    (do.valor * do.cantidad) AS 'subtotal',  
    (SELECT SUM(d2.valor * d2.cantidad) 
    FROM DetalleOrden d2 
    WHERE d2.id_orden = o.id_orden) AS 'total_orden'              
FROM Orden o
INNER JOIN Mesero m ON o.id_mesero = m.id_mesero
INNER JOIN DetalleOrden do ON o.id_orden = do.id_orden
INNER JOIN Plato p ON do.id_plato = p.id_plato
ORDER BY o.fecha DESC, o.numero_orden;

-- 1. INNER JOIN: Pedidos completos con sus detalles
-- Muestra solo órdenes que tienen detalles asociados
SELECT o.numero_orden, m.nombre AS mesero, p.nombre AS plato, 
       do.cantidad, do.valor, (do.cantidad * do.valor) AS subtotal
FROM Orden o
INNER JOIN Mesero m ON o.id_mesero = m.id_mesero
INNER JOIN DetalleOrden do ON o.id_orden = do.id_orden
INNER JOIN Plato p ON do.id_plato = p.id_plato;

-- 2. LEFT JOIN: Todos los meseros, incluso los que no han tomado órdenes
SELECT m.nombre AS mesero, COUNT(o.id_orden) AS total_ordenes
FROM Mesero m
LEFT JOIN Orden o ON m.id_mesero = o.id_mesero
GROUP BY m.nombre;

-- 3. RIGHT JOIN: Todos los platos, incluso los que no se han pedido
SELECT p.nombre AS plato, COUNT(do.id_detalle) AS veces_pedido
FROM DetalleOrden do
RIGHT JOIN Plato p ON do.id_plato = p.id_plato
GROUP BY p.nombre;

-- 4. FULL OUTER JOIN: Todos los platos y todos los detalles (SQL Server)
-- Nota: MySQL no soporta FULL OUTER JOIN directamente
SELECT p.nombre AS plato, do.id_detalle, do.cantidad
FROM Plato p
FULL OUTER JOIN DetalleOrden do ON p.id_plato = do.id_plato;

-- 5. CROSS JOIN: Combinaciones posibles entre meseros y platos
-- Útil para generar todas las posibles combinaciones
SELECT m.nombre AS mesero, p.nombre AS plato
FROM Mesero m
CROSS JOIN Plato p;

-- Meseros que no han tomado ninguna orden
SELECT m.id_mesero, m.nombre AS mesero, m.telefono
FROM Mesero m
LEFT JOIN Orden o ON m.id_mesero = o.id_mesero
WHERE o.id_mesero IS NULL;

-- Platos que nunca han sido pedidos
SELECT p.id_plato, p.nombre AS plato, p.precio
FROM Plato p
LEFT JOIN DetalleOrden do ON p.id_plato = do.id_plato
WHERE do.id_plato IS NULL;

