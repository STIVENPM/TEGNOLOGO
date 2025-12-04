CREATE DATABASE FERIA_SP;
USE FERIA_SP;


--FERIA
CREATE TABLE feria(
    id_feria INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL
);

--tema 
CREATE TABLE tema(
    id_tema INT PRIMARY KEY,
    tema VARCHAR(100) NOT NULL
);

--PABELLON 
CREATE TABLE pabellon(
    id_pabellon INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    tematica VARCHAR(100) NOT NULL,
    capacidad INT NOT NULL,
    id_feria INT FOREIGN KEY REFERENCES feria(id_feria),
    id_tema INT FOREIGN KEY REFERENCES tema(id_tema)
);

-- empresas
CREATE TABLE empresas (
    id_empresa INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

--stands
CREATE TABLE stands (
    id_stand INT PRIMARY KEY,
    numero INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    id_empresa INT  FOREIGN KEY REFERENCES empresas(id_empresa),
    id_pabellon INT FOREIGN KEY REFERENCES pabellon(id_pabellon)  
);

--productos
CREATE TABLE productos (
    id_producto INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT NULL,
    id_stand INT FOREIGN KEY REFERENCES stands(id_stand)
);

--persona
CREATE TABLE persona(
    id_persona INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

--responsables
CREATE TABLE responsables (
    id_responsable INT PRIMARY KEY,
    id_producto INT FOREIGN KEY REFERENCES productos(id_producto),
    id_persona INT FOREIGN KEY REFERENCES persona(id_persona)
);

--ponente
CREATE TABLE ponente(
    id_ponente INT PRIMARY KEY,
    id_persona INT FOREIGN KEY REFERENCES persona(id_persona)
);

-- primero tipo_entrada
CREATE TABLE tipo_entrada(
    id_tipo_entrada INT PRIMARY KEY,
    tipo_entrada VARCHAR(100)
);

-- ahora visitante
CREATE TABLE visitante(
    id_visitante INT PRIMARY KEY,
    id_persona INT FOREIGN KEY REFERENCES persona(id_persona),
    id_tipo_entrada INT FOREIGN KEY REFERENCES tipo_entrada(id_tipo_entrada)
);

--charla
CREATE TABLE charla(
    id_charla INT PRIMARY KEY,
    nombre VARCHAR(100)
);

--demostracion
CREATE TABLE demostracion(
    id_demostracion INT PRIMARY KEY,
    nombre VARCHAR(100)
);

--registro
CREATE TABLE registro(
    id_registro INT PRIMARY KEY,
    id_charla INT FOREIGN KEY REFERENCES charla(id_charla),
    id_demostracion INT FOREIGN KEY REFERENCES demostracion(id_demostracion),
    id_empresa INT FOREIGN KEY REFERENCES empresas(id_empresa),
    id_feria INT FOREIGN KEY REFERENCES feria(id_feria),
    id_ponente INT FOREIGN KEY REFERENCES ponente(id_ponente),
    id_visitante INT FOREIGN KEY REFERENCES visitante(id_visitante)
   
);



INSERT INTO feria (id_feria, nombre, fecha_inicio, fecha_fin) VALUES
(1, 'Feria 1', '2024-03-1', '2025-01-01'),
(2, 'Feria 2', '2024-04-2', '2025-02-02'),
(3, 'Feria 3', '2024-05-3', '2025-03-03'),
(4, 'Feria 4', '2024-06-4', '2025-04-04'),
(5, 'Feria 5', '2024-07-5', '2025-05-05');

INSERT INTO tema (id_tema, tema) VALUES
(1, 'tema 1'),
(2, 'tema 2'),
(3, 'tema 3'),
(4, 'tema 4'),
(5, 'tema 5');

INSERT INTO pabellon (id_pabellon, nombre, tematica, capacidad, id_feria, id_tema) VALUES
(1, 'Pabellon 1', 'tematica 1', 100, 1, 1),
(2, 'Pabellon 2', 'tematica 2', 100, 2, 2),
(3, 'Pabellon 3', 'tematica 3', 100, 3, 3),
(4, 'Pabellon 4', 'tematica 4', 100, 4, 4),
(5, 'Pabellon 5', 'tematica 5', 100, 5, 5);

INSERT INTO empresas (id_empresa, nombre) VALUES
(1, 'empresa 1'),
(2, 'empresa 2'),
(3, 'empresa 3'),
(4, 'empresa 4'),
(5, 'empresa 5');

INSERT INTO stands (id_stand, numero, nombre, id_empresa, id_pabellon) VALUES
(1, 1, 'Stand 1 ', 1, 1),
(2, 2, 'Stand 2', 2, 2),
(3, 3, 'Stand 3', 3, 3),
(4, 4, 'Stand 4', 4, 4),
(5, 5, 'Stand 5', 5, 5);

INSERT INTO productos (id_producto, nombre, descripcion, id_stand) VALUES
(1, 'Producto 1', 'Descripcion 1', 1),
(2, 'Producto 2', 'Descripcion 2', 2),
(3, 'Producto 3', 'Descripcion 3', 3),
(4, 'Producto 4', 'Descripcion 4', 4),
(5, 'Producto 5', 'Descripcion 5', 5);

INSERT INTO persona (id_persona, nombre) VALUES
(1, 'Persona 1'),
(2, 'Persona 2'),
(3, 'Persona 3'),
(4, 'Persona 4'),
(5, 'Persona 5');

INSERT INTO responsables (id_responsable, id_producto, id_persona) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5);

INSERT INTO ponente (id_ponente, id_persona) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

INSERT INTO tipo_entrada (id_tipo_entrada, tipo_entrada) VALUES
(1, 'tipo 1'),
(2, 'tipo 2'),
(3, 'tipo 3'),
(4, 'tipo 4'),
(5, 'tipo 5');

INSERT INTO visitante (id_visitante, id_persona, id_tipo_entrada) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5);

INSERT INTO charla (id_charla, nombre) VALUES
(1, 'Charla 1'),
(2, 'Charla 2'),
(3, 'Charla 3'),
(4, 'Charla 4'),
(5, 'Charla 5');

INSERT INTO demostracion (id_demostracion, nombre) VALUES
(1, 'Demostracion 1'),
(2, 'Demostracion 2'),
(3, 'Demostracion 3'),
(4, 'Demostracion 4'),
(5, 'Demostracion 5');

INSERT INTO registro (id_registro, id_charla, id_demostracion, id_empresa, id_feria, id_ponente, id_visitante ) VALUES
(1, 1, 1, 1, 1, 1, 1 ),
(2, 2, 2, 2, 2, 2, 2 ),
(3, 3, 3, 3, 3, 3, 3 ),
(4, 4, 4, 4, 4, 4, 4 ),
(5, 5, 5, 5, 5, 5, 5 );

SELECT id_visitante AS persona,
       nombre AS entrada
FROM visitante v
JOIN persona p ON v.id_persona = p.id_persona


--producto con nombre 
SELECT p.nombre AS producto,
       s.nombre AS nombre
FROM productos p
JOIN stands s ON p.id_stand = s.id_stand











