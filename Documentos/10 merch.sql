-- Crear la base de datos
CREATE DATABASE AdopcionMascotasDB;
USE AdopcionMascotasDB;

-- 1. Tabla de adoptantes: almacena los datos de las personas que adoptan mascotas
CREATE TABLE ADOPTANTE (
    id_adop INT PRIMARY KEY ,
    nombre VARCHAR(100) NOT NULL,
    documento VARCHAR(20) NOT NULL
);

-- 2. Tabla de mascotas: contiene los datos de los animales disponibles o adoptados
CREATE TABLE MASCOTA (
    id_mascota INT PRIMARY KEY ,
    nombre VARCHAR(50) NOT NULL,
    especie VARCHAR(50) NOT NULL
);

-- 3. Tabla pivote para registrar qué adoptante adoptó qué mascota y cuándo
CREATE TABLE ADOPCION (
    id_adop INT,
    id_mascota INT,
    fecha_adopcion DATE,
    PRIMARY KEY (id_adop, id_mascota),
    FOREIGN KEY (id_adop) REFERENCES ADOPTANTE(id_adop),
    FOREIGN KEY (id_mascota) REFERENCES MASCOTA(id_mascota)
);

-- 4. Tabla de veterinarios: profesionales que atienden a las mascotas
CREATE TABLE VETERINARIO (
    id_vet INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    especialidad VARCHAR(100) NOT NULL
);

-- 5. Tabla de refugios: lugares donde se alojan las mascotas
CREATE TABLE REFUGIO (
    id_refugio INT PRIMARY KEY ,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(150) NOT NULL
);

-- 6. Tabla pivote que relaciona mascotas con veterinarios (control médico)
CREATE TABLE MASC_VETERINARIO (
    id_mascota INT,
    id_vet INT,
    fecha_revision DATE,
    PRIMARY KEY (id_mascota, id_vet),
    FOREIGN KEY (id_mascota) REFERENCES MASCOTA(id_mascota),
    FOREIGN KEY (id_vet) REFERENCES VETERINARIO(id_vet)
);

-- 7. Tabla de seguimiento: visitas posteriores a la adopción
CREATE TABLE SEGUIMIENTO (
    id_seguim INT PRIMARY KEY ,
    fecha_visita DATE NOT NULL,
    nota TEXT,
    id_mascota INT,
    FOREIGN KEY (id_mascota) REFERENCES MASCOTA(id_mascota)
);

-- =============================
-- INSERTS DE DATOS DE PRUEBA
-- =============================

-- Insertar adoptantes
INSERT INTO ADOPTANTE (nombre, documento) VALUES
('Laura Gómez', '123456789'),
('Carlos Ruiz', '987654321');

-- Insertar mascotas
INSERT INTO MASCOTA (nombre, especie) VALUES
('Firulais', 'Perro'),
('Mishi', 'Gato');

-- Registrar adopciones
INSERT INTO ADOPCION (id_adop, id_mascota, fecha_adopcion) VALUES
(1, 1, '2024-06-01'),
(2, 2, '2024-06-05');

-- Insertar veterinarios
INSERT INTO VETERINARIO (nombre, especialidad) VALUES
('Dra. Elena', 'Medicina felina'),
('Dr. Juan', 'Cirugía general');

-- Insertar refugios
INSERT INTO REFUGIO (nombre, direccion) VALUES
('Refugio Patitas', 'Calle 123, Ciudad'),
('Hogar Animal', 'Av. 45, Ciudad');

-- Asociar mascotas con veterinarios
INSERT INTO MASC_VETERINARIO (id_mascota, id_vet, fecha_revision) VALUES
(1, 2, '2024-05-10'),
(2, 1, '2024-05-15');

-- Registrar seguimientos
INSERT INTO SEGUIMIENTO (fecha_visita, nota, id_mascota) VALUES
('2024-06-10', 'La mascota está en buenas condiciones.', 1),
('2024-06-12', 'Se recomienda una nueva desparasitación.', 2);

-- 1. Contar cuántas mascotas hay registradas
SELECT COUNT(*) AS total_mascotas FROM MASCOTA;

-- 2. Fecha más reciente de visita veterinaria (seguimiento)
SELECT MAX(fecha_visita) AS ultima_visita FROM SEGUIMIENTO;

-- 3. Fecha más antigua de adopción registrada
SELECT MIN(fecha_adopcion) AS primera_adopcion FROM ADOPCION;

-- =============================
-- SUBCONSULTAS
-- =============================

-- Mascotas adoptadas por la persona con id 1
SELECT nombre FROM MASCOTA
WHERE id_mascota IN (
    SELECT id_mascota FROM ADOPCION
    WHERE id_adop = 1
);

-- Adoptantes de la mascota con id 2
SELECT nombre FROM ADOPTANTE
WHERE id_adop IN (
    SELECT id_adop FROM ADOPCION
    WHERE id_mascota = 2
);

-- =============================
-- JOINS DIFERENTES
-- =============================

-- Mascotas y sus seguimientos (LEFT JOIN por si no hay seguimiento aún)
SELECT m.nombre, s.fecha_visita
FROM MASCOTA m
LEFT JOIN SEGUIMIENTO s ON m.id_mascota = s.id_mascota;

-- Este RIGHT JOIN no tiene mucha lógica tal cual, pero se deja como ejemplo sintáctico:
SELECT r.nombre, m.nombre AS mascota
FROM REFUGIO r
RIGHT JOIN MASCOTA m ON r.id_refugio = 1;

-- =============================
-- MODIFICACIONES DE DATOS
-- =============================

-- Cambiar nombre del adoptante
UPDATE ADOPTANTE SET nombre = 'Laura G. Torres' 
WHERE id_adop = 1;

-- Corregir especie
UPDATE MASCOTA SET especie = 'Felino' 
WHERE id_mascota = 2;

-- =============================
-- ELIMINACIONES
-- =============================

-- Eliminar adopción
DELETE FROM ADOPCION WHERE id_adop = 1 AND id_mascota = 1;

-- Eliminar relación mascota-veterinario
DELETE FROM MASC_VETERINARIO WHERE id_mascota = 2 AND id_vet = 1;

-- =============================
-- ALTERACIONES DE TABLAS
-- =============================

-- Agregar columna edad a MASCOTA
ALTER TABLE MASCOTA ADD edad INT;

-- Eliminar columna nota de SEGUIMIENTO
ALTER TABLE SEGUIMIENTO DROP COLUMN nota;

-- =============================
-- TRUNCADOS Y ELIMINACIÓN DE TABLAS
-- =============================

-- Vaciar tablas (borra registros, no estructura)
TRUNCATE TABLE ADOPCION;
TRUNCATE TABLE MASC_VETERINARIO;

-- Eliminar completamente las tablas
DROP TABLE ADOPCION;
DROP TABLE MASC_VETERINARIO;















- Crear base de datos para eventos y festivales culturales
CREATE DATABASE EventosFestivalesDB;
USE EventosFestivalesDB;

-- 1. Tabla de asistentes: personas que asisten a eventos
CREATE TABLE ASISTENTE (
    id_asist INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    documento VARCHAR(20) NOT NULL
);

-- 2. Tabla de eventos: representa los conciertos, festivales u otras actividades culturales
CREATE TABLE EVENTO (
    id_evento INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    fecha DATE NOT NULL
);

-- 3. Tabla pivote: inscripción de asistentes a eventos
CREATE TABLE INSCRIPCION (
    id_asist INT,
    id_evento INT,
    PRIMARY KEY (id_asist, id_evento),
    FOREIGN KEY (id_asist) REFERENCES ASISTENTE(id_asist),
    FOREIGN KEY (id_evento) REFERENCES EVENTO(id_evento)
);

-- 4. Tabla de artistas: músicos, grupos o presentadores
CREATE TABLE ARTISTA (
    id_artista INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    especialidad VARCHAR(100) NOT NULL
);

-- 5. Tabla de escenarios: lugares donde se presentan los eventos
CREATE TABLE ESCENARIO (
    id_escenario INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    capacidad INT NOT NULL
);

-- 6. Tabla pivote: relación entre eventos y artistas
CREATE TABLE EVENTO_ARTISTA (
    id_evento INT,
    id_artista INT,
    PRIMARY KEY (id_evento, id_artista),
    FOREIGN KEY (id_evento) REFERENCES EVENTO(id_evento),
    FOREIGN KEY (id_artista) REFERENCES ARTISTA(id_artista)
);

-- 7. Tabla organizadores: quienes gestionan los eventos
CREATE TABLE ORGANIZADOR (
    id_org INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    entidad VARCHAR(100),
    id_evento INT,
    FOREIGN KEY (id_evento) REFERENCES EVENTO(id_evento)
);

-- =============================
-- INSERTS DE DATOS DE PRUEBA (máximo 2 líneas por tabla)
-- =============================
INSERT INTO ASISTENTE (nombre, documento) VALUES 
  ('Ana Torres', '111222333'),
  ('Luis Pérez', '444555666');
INSERT INTO EVENTO (nombre, tipo, fecha) VALUES 
  ('Festival Jazz', 'Musical', '2024-08-01'),
  ('Feria del Libro', 'Cultural', '2024-09-15');
INSERT INTO INSCRIPCION (id_asist, id_evento) VALUES
  (1, 1), (2, 2);
INSERT INTO ARTISTA (nombre, especialidad) VALUES 
  ('Grupo Jazz Latino', 'Jazz'),
  ('Carlos Cuervo', 'Narrador oral');
INSERT INTO ESCENARIO (nombre, capacidad) VALUES 
  ('Escenario Central', 5000),
  ('Sala Alterna', 1200);
INSERT INTO EVENTO_ARTISTA (id_evento, id_artista) VALUES
  (1, 1), (2, 2);
INSERT INTO ORGANIZADOR (nombre, entidad, id_evento) VALUES
  ('Cultura Viva', 'Alcaldía Local', 1), 
  ('Lectura Libre', 'Fundación Letras', 2);

-- =============================
-- SELECTs con funciones agregadas
-- =============================
SELECT COUNT(*) AS total_eventos FROM EVENTO;
SELECT MAX(capacidad) AS capacidad_max FROM ESCENARIO;
SELECT MIN(fecha) AS primer_evento FROM EVENTO;

-- =============================
-- SUBCONSULTAS
-- =============================
SELECT nombre FROM EVENTO WHERE id_evento IN (
    SELECT id_evento FROM INSCRIPCION WHERE id_asist = 1
);
SELECT nombre FROM ASISTENTE WHERE id_asist IN (
    SELECT id_asist FROM INSCRIPCION WHERE id_evento = 2
);

-- =============================
-- JOINS
-- =============================
SELECT e.nombre, s.nombre AS escenario
  FROM EVENTO e 
  LEFT JOIN ESCENARIO s ON s.id_escenario = 1;

SELECT a.nombre AS artista, ev.nombre AS evento 
  FROM ARTISTA a 
  RIGHT JOIN EVENTO_ARTISTA ea ON a.id_artista = ea.id_artista
JOIN EVENTO ev ON ea.id_evento = ev.id_evento;

-- =============================
-- UPDATEs
-- =============================
UPDATE ASISTENTE SET nombre = 'Ana M. Torres' WHERE id_asist = 1;
UPDATE EVENTO SET tipo = 'Literario' WHERE id_evento = 2;

-- =============================
-- DELETEs
-- =============================
DELETE FROM INSCRIPCION WHERE id_asist = 2 AND id_evento = 2;
DELETE FROM EVENTO_ARTISTA WHERE id_evento = 1 AND id_artista = 1;

-- =============================
-- ALTERs
-- =============================
ALTER TABLE EVENTO ADD lugar VARCHAR(100);
ALTER TABLE ORGANIZADOR DROP COLUMN entidad;

-- =============================
-- TRUNCATE y DROP
-- =============================
TRUNCATE TABLE INSCRIPCION;
TRUNCATE TABLE EVENTO_ARTISTA;
DROP TABLE INSCRIPCION;
DROP TABLE EVENTO_ARTISTA;













