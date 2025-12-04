CREATE DATABASE GimnasioMerch;
USE GimnasioMerch;

-- Tabla CLIENTES (similar a tu tabla original pero adaptada)
CREATE TABLE CLIENTES (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(20),
    membresia VARCHAR(50)
);

-- Tabla CATEGORIAS (similar a ACTIVIDAD en estructura)
CREATE TABLE CATEGORIAS (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nombre_categoria VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255)
);

-- Tabla PRODUCTOS (nueva estructura central)
CREATE TABLE PRODUCTOS (
    id_producto INT PRIMARY KEY AUTO_INCREMENT,
    nombre_producto VARCHAR(100) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
   
    id_categoria INT NOT NULL,
    FOREIGN KEY (id_categoria) REFERENCES CATEGORIAS(id_categoria)
);

-- Tabla DISEÑOS (similar a ENTRENADOR en estructura)
CREATE TABLE DISEÑOS (
    id_diseño INT PRIMARY KEY AUTO_INCREMENT,
    nombre_diseño VARCHAR(100) NOT NULL,
    tipo VARCHAR(50)
);

-- Tabla pivote PRODUCTO_DISEÑO (similar a Actividad_Cliente)
CREATE TABLE PRODUCTO_DISEÑO (
    id_producto INT NOT NULL,
    id_diseño INT NOT NULL,
    PRIMARY KEY (id_producto, id_diseño),
    FOREIGN KEY (id_producto) REFERENCES PRODUCTOS(id_producto),
    FOREIGN KEY (id_diseño) REFERENCES DISEÑOS(id_diseño)
);

-- Tabla VENTAS (nueva tabla central para transacciones)
CREATE TABLE VENTAS (
    id_venta INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    fecha_venta DATETIME NOT NULL,
    total DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES CLIENTES(id_cliente)
);

-- Tabla DETALLE_VENTA (similar a Entrenador_Sala)
CREATE TABLE DETALLE_VENTA (
    id_venta INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (id_venta, id_producto),
    FOREIGN KEY (id_venta) REFERENCES VENTAS(id_venta),
    FOREIGN KEY (id_producto) REFERENCES PRODUCTOS(id_producto)
);

-- Inserts adaptados
INSERT INTO CLIENTES (nombre, telefono, membresia) VALUES
('Juan Pérez', '5551234567', 'Premium'),
('María López', '5557654321', 'Básica'),
;

INSERT INTO CATEGORIAS (nombre_categoria, descripcion) VALUES
('Camisetas', 'Prendas de vestir para entrenar'),
('Accesorios', 'Complementos deportivos'),
);

INSERT INTO PRODUCTOS (nombre_producto, precio, stock, id_categoria) VALUES
('Camiseta Fit', 24.99, 50, 1),
('Taza Motivación', 12.50, 30, 2),
);

INSERT INTO DISEÑOS (nombre_diseño, tipo) VALUES
('Diseño SQL', 'Digital'),
('Logo Gimnasio', 'Vectorial'),


INSERT INTO PRODUCTO_DISEÑO (id_producto, id_diseño) VALUES
(1, 1),
(1, 2),








--SELECT
-- 1. Cliente, actividad y nivel (solo clientes inscritos)
SELECT c.nombre AS cliente, a.nombre_actividad AS actividad, a.nivel
FROM Cliente c
INNER JOIN Actividad_Cliente ac ON c.id_cliente   = ac.id_cliente
INNER JOIN Actividad        a  ON ac.id_actividad = a.id_actividad;

-- 2. Entrenador con la sala asignada y su capacidad
SELECT e.nombre_entrenador AS entrenador, s.nombre_sala AS sala,
       s.capacidad
FROM Entrenador e
INNER JOIN Entrenador_Sala es ON e.id_entrenador = es.id_entrenador
INNER JOIN Sala s ON es.id_sala = s.id_sala;


SELECT nombre_sala
FROM   Sala
WHERE  id_sala IN (
    SELECT id_sala
    FROM   Entrenador_Sala
    WHERE  id_entrenador IN (
        SELECT id_entrenador
        FROM   Entrenador
        WHERE  especialidad = 'cardio'
    )
);

SELECT nombre
FROM   Cliente
WHERE  id_cliente IN (
    SELECT id_cliente
    FROM   Actividad_Cliente
    WHERE  id_actividad IN (
        SELECT id_actividad
        FROM   Actividad
        WHERE  nivel = 'básico'
    )
);

-- SELECT CON FUNCIONES                            




-- 1. CAPACIDAD MÁXIMA ENTRE TODAS LAS SALAS
SELECT MAX(capacidad) AS capacidad_maxima
FROM Sala;

-- 2. LISTA DE ENTRENADORES CON ESPECIALIDAD CONCATENADA
SELECT CONCAT(nombre_entrenador, ' (', especialidad, ')') AS entrenador_info
FROM Entrenador;






-- UPDATE

UPDATE Cliente SET edad = 30           
WHERE id_cliente = 1;
UPDATE Actividad SET nivel = 'intermedio'
WHERE id_actividad = 101;


-- DELETE

DELETE FROM Actividad_Cliente WHERE id_cliente = 3 AND id_actividad = 103;
DELETE FROM Entrenador_Sala WHERE id_entrenador = 202 AND id_sala = 302;


-- ALTER

ALTER TABLE Cliente ADD telefono VARCHAR(20);
ALTER TABLE Actividad DROP COLUMN nivel;


-- TRUNCATE

TRUNCATE TABLE Actividad_Cliente;
TRUNCATE TABLE Entrenador_Sala;

-- DROP

DROP TABLE Actividad_Cliente;
DROP TABLE Entrenador_Sala;

 










--- Creación de la base de datos
CREATE DATABASE colegio;
-- Selecciona la base de datos 'colegio' para usarla
USE colegio;

-- Tabla ESTUDIANTE
CREATE TABLE ESTUDIANTE (
    id_est INT PRIMARY KEY AUTO_INCREMENT, -- Identificador único del estudiante
    nombre VARCHAR(100) NOT NULL, -- Nombre completo del estudiante
    edad INT, -- Edad del estudiante
    telefono VARCHAR(20) -- Número de teléfono del estudiante
);

-- Tabla CURSO
CREATE TABLE CURSO (
    id_curso INT PRIMARY KEY AUTO_INCREMENT, -- Identificador único del curso
    nombre VARCHAR(100) NOT NULL, -- Nombre del curso
    nivel VARCHAR(50), -- Nivel del curso (ej. Básico, Intermedio, Avanzado)
    descripcion VARCHAR(255) -- Descripción detallada del curso
);

-- Tabla PROFESOR
CREATE TABLE PROFESOR (
    id_prof INT PRIMARY KEY AUTO_INCREMENT, -- Identificador único del profesor
    nombre VARCHAR(100) NOT NULL, -- Nombre completo del profesor
    especialidad VARCHAR(100), -- Área de especialización del profesor
    edad INT -- Edad del profesor
);

-- Tabla AULA
CREATE TABLE AULA (
    id_aula INT PRIMARY KEY AUTO_INCREMENT, -- Identificador único del aula
    nombre VARCHAR(100) NOT NULL, -- Nombre o número del aula
    capacidad INT, -- Capacidad máxima de estudiantes en el aula
    piso INT -- Número de piso donde se encuentra el aula
);

-- Tabla HORARIO
CREATE TABLE HORARIO (
    id_horario INT PRIMARY KEY AUTO_INCREMENT, -- Identificador único del horario
    dia VARCHAR(20) NOT NULL, -- Día de la semana del horario
    hora_inicio TIME NOT NULL, -- Hora de inicio del bloque horario
    hora_fin TIME NOT NULL -- Hora de fin del bloque horario
);

-- Tabla Pivote INSCRIPCION
CREATE TABLE INSCRIPCION (
    id_est INT NOT NULL, -- Identificador del estudiante
    id_curso INT NOT NULL, -- Identificador del curso
    PRIMARY KEY (id_est, id_curso),
    FOREIGN KEY (id_est) REFERENCES ESTUDIANTE(id_est),
    FOREIGN KEY (id_curso) REFERENCES CURSO(id_curso)
);

-- Tabla Pivote CURSO_PROFESOR
CREATE TABLE CURSO_PROFESOR (
    id_curso INT NOT NULL, -- Identificador del curso
    id_prof INT NOT NULL, -- Identificador del profesor
    PRIMARY KEY (id_curso, id_prof),
    FOREIGN KEY (id_curso) REFERENCES CURSO(id_curso),
    FOREIGN KEY (id_prof) REFERENCES PROFESOR(id_prof)
);

--- INSERTS
INSERT INTO ESTUDIANTE (nombre, edad, telefono) VALUES
('Juan Pérez', 20, '5551234567'),
('María López', 22, '5557654321'),
('Carlos Gómez', 19, '5559876543');

INSERT INTO CURSO (nombre, nivel, descripcion) VALUES
('Matemáticas Básicas', 'Básico', 'Fundamentos de matemáticas para principiantes.'),
('Programación Avanzada', 'Avanzado', 'Técnicas y algoritmos de programación.'),
('Historia del Arte', 'Intermedio', 'Recorrido por la historia del arte mundial.');

INSERT INTO PROFESOR (nombre, especialidad, edad) VALUES
('Dr. Ana García', 'Matemáticas', 45),
('Ing. Luis Soto', 'Programación', 38),
('Lic. Elena Ruiz', 'Historia', 50);

INSERT INTO AULA (nombre, capacidad, piso) VALUES
('Aula Magna A', 100, 1),
('Laboratorio de Cómputo B', 30, 2),
('Salón de Clases C', 25, 3);

INSERT INTO HORARIO (dia, hora_inicio, hora_fin) VALUES
('Lunes', '08:00:00', '09:30:00'),
('Miércoles', '10:00:00', '11:30:00'),
('Viernes', '14:00:00', '15:30:00');

INSERT INTO INSCRIPCION (id_est, id_curso) VALUES
(1, 1),
(1, 2),
(2, 1),
(3, 3);

INSERT INTO CURSO_PROFESOR (id_curso, id_prof) VALUES
(1, 1),
(2, 2),
(3, 3);

--- PROCEDIMIENTOS ALMACENADOS
DELIMITER //
CREATE PROCEDURE InsertarEstudiante(
    IN p_nombre VARCHAR(100), -- Nombre del estudiante a insertar
    IN p_edad INT -- Edad del estudiante a insertar
)
BEGIN
    INSERT INTO ESTUDIANTE (nombre, edad)
    VALUES (p_nombre, p_edad);
END //
DELIMITER ;

CALL InsertarEstudiante('Laura Valdés', 21);

--- SELECTS
-- Muestra el nombre del estudiante, el curso en el que está inscrito y el nivel de ese curso
SELECT e.nombre AS estudiante, c.nombre AS curso, c.nivel
FROM ESTUDIANTE e
INNER JOIN INSCRIPCION i ON e.id_est = i.id_est
INNER JOIN CURSO c ON i.id_curso = c.id_curso;

-- Muestra el nombre del profesor, el curso que imparte, el aula donde se imparte y la capacidad del aula
SELECT p.nombre AS profesor, c.nombre AS curso, a.nombre AS aula, a.capacidad
FROM PROFESOR p
INNER JOIN CURSO_PROFESOR cp ON p.id_prof = cp.id_prof
INNER JOIN CURSO c ON cp.id_curso = c.id_curso
INNER JOIN AULA a ON c.id_curso = a.id_aula;

-- Muestra el nombre del curso y el total de estudiantes inscritos en él
SELECT c.nombre AS curso,
        COUNT(i.id_est) AS total_estudiantes_inscritos
FROM CURSO c
INNER JOIN INSCRIPCION i ON c.id_curso = i.id_curso
GROUP BY c.id_curso, c.nombre;

-- Muestra el nombre del profesor y el número de cursos que imparte
SELECT p.nombre AS profesor,
        COUNT(cp.id_curso) AS cursos_impartidos
FROM PROFESOR p
INNER JOIN CURSO_PROFESOR cp ON p.id_prof = cp.id_prof
GROUP BY p.id_prof, p.nombre;

-- Muestra el nombre del aula, el curso que se imparte en ella y el profesor que lo imparte
SELECT a.nombre AS aula, c.nombre AS curso, p.nombre AS profesor
FROM AULA a
INNER JOIN CURSO c ON a.id_aula = c.id_curso
INNER JOIN CURSO_PROFESOR cp ON c.id_curso = cp.id_curso
INNER JOIN PROFESOR p ON cp.id_prof = p.id_prof;

--- SUBCONSULTAS
-- Selecciona los nombres de los profesores que imparten cursos en aulas con capacidad mayor a 50
SELECT nombre
FROM PROFESOR
WHERE id_prof IN (
    SELECT id_prof
    FROM CURSO_PROFESOR
    WHERE id_curso IN (
        SELECT id_curso
        FROM CURSO
        WHERE id_curso IN (
            SELECT id_aula
            FROM AULA
            WHERE capacidad > 50
        )
    )
);

-- Selecciona los nombres de los estudiantes inscritos en cursos de nivel 'Avanzado'
SELECT nombre
FROM ESTUDIANTE
WHERE id_est IN (
    SELECT id_est
    FROM INSCRIPCION
    WHERE id_curso IN (
        SELECT id_curso
        FROM CURSO
        WHERE nivel = 'Avanzado'
    )
);

-- Selecciona los nombres de los cursos en los que están inscritos estudiantes menores de 21 años
SELECT nombre
FROM CURSO
WHERE id_curso IN (
    SELECT id_curso
    FROM INSCRIPCION
    WHERE id_est IN (
        SELECT id_est
        FROM ESTUDIANTE
        WHERE edad < 21
    )
);

-- Selecciona los nombres de las aulas donde se imparten cursos por profesores con especialidad 'Programación'
SELECT nombre
FROM AULA
WHERE id_aula IN (
    SELECT id_curso
    FROM CURSO
    WHERE id_curso IN (
        SELECT id_curso
        FROM CURSO_PROFESOR
        WHERE id_prof IN (
            SELECT id_prof
            FROM PROFESOR
            WHERE especialidad = 'Programación'
        )
    )
);

-- Selecciona los nombres de los estudiantes inscritos en cursos de nivel 'Básico'
SELECT nombre
FROM ESTUDIANTE
WHERE id_est IN (
    SELECT id_est
    FROM INSCRIPCION
    WHERE id_curso IN (
        SELECT id_curso
        FROM CURSO
        WHERE nivel = 'Básico'
    )
);

--- SELECTS CON FUNCIONES
-- Muestra la capacidad máxima de todas las aulas
SELECT MAX(capacidad) AS capacidad_maxima
FROM AULA;

-- Muestra el nombre y la especialidad de cada profesor concatenados
SELECT CONCAT(nombre, ' (', especialidad, ')') AS profesor_info
FROM PROFESOR;

-- Muestra el ID del curso y el nombre del curso en mayúsculas
SELECT id_curso,
        UPPER(nombre) AS curso_mayuscula
FROM CURSO;

-- Muestra la edad mínima entre todos los estudiantes
SELECT MIN(edad) AS edad_minima
FROM ESTUDIANTE;

-- Muestra la cantidad total de cursos registrados
SELECT COUNT(*) AS total_cursos
FROM CURSO;

--- UPDATES
-- Actualiza la edad de un estudiante específico
UPDATE ESTUDIANTE SET edad = 25
WHERE id_est = 1;

-- Actualiza el nivel de un curso específico
UPDATE CURSO SET nivel = 'Avanzado'
WHERE id_curso = 1;

-- Actualiza la especialidad de un profesor específico
UPDATE PROFESOR SET especialidad = 'Ciencias de Datos'
WHERE id_prof = 2;

-- Actualiza la capacidad de un aula específica
UPDATE AULA SET capacidad = 80
WHERE id_aula = 1;

-- Actualiza la hora de fin de un horario específico
UPDATE HORARIO SET hora_fin = '18:00:00'
WHERE id_horario = 2;

--- DELETES
-- Elimina una inscripción específica de la tabla INSCRIPCION
DELETE FROM INSCRIPCION WHERE id_est = 3 AND id_curso = 3;

-- Elimina la asignación de un curso a un profesor específico de la tabla CURSO_PROFESOR
DELETE FROM CURSO_PROFESOR WHERE id_curso = 2 AND id_prof = 2;

-- Elimina un horario específico de la tabla HORARIO
DELETE FROM HORARIO WHERE id_horario = 3;

-- Elimina un aula específica de la tabla AULA
DELETE FROM AULA WHERE id_aula = 3;

-- Elimina un estudiante específico de la tabla ESTUDIANTE
DELETE FROM ESTUDIANTE WHERE id_est = 3;

--- ALTERS
-- Añade una columna 'email' a la tabla ESTUDIANTE
ALTER TABLE ESTUDIANTE ADD email VARCHAR(100);

-- Elimina la columna 'descripcion' de la tabla CURSO
ALTER TABLE CURSO DROP COLUMN descripcion;

-- Añade una columna 'numero_aula' a la tabla AULA
ALTER TABLE AULA ADD numero_aula VARCHAR(10);

-- Añade una columna 'fecha_nacimiento' a la tabla PROFESOR
ALTER TABLE PROFESOR ADD fecha_nacimiento DATE;

-- Elimina la columna 'hora_fin' de la tabla HORARIO
ALTER TABLE HORARIO DROP COLUMN hora_fin;

--- TRUNCATES
TRUNCATE TABLE INSCRIPCION;
TRUNCATE TABLE CURSO_PROFESOR;
TRUNCATE TABLE HORARIO;
TRUNCATE TABLE AULA;
TRUNCATE TABLE ESTUDIANTE;

--- DROPS
DROP TABLE INSCRIPCION;
DROP TABLE CURSO_PROFESOR;
DROP TABLE CURSO;
DROP TABLE PROFESOR;
DROP TABLE ESTUDIANTE;











-- Tabla CLIENTE
CREATE TABLE CLIENTE (
    id_clie INT PRIMARY KEY AUTO_INCREMENT, -- Identificador único del cliente
    nombre VARCHAR(100) NOT NULL, -- Nombre del cliente
    correo VARCHAR(100) UNIQUE NOT NULL -- Correo electrónico del cliente
);

-- Tabla PELICULA
CREATE TABLE PELICULA (
    id_peli INT PRIMARY KEY AUTO_INCREMENT, -- Identificador único de la película
    titulo VARCHAR(255) NOT NULL, -- Título de la película
    duracion INT -- Duración de la película en minutos
);

-- Tabla SALA
CREATE TABLE SALA (
    id_sala INT PRIMARY KEY AUTO_INCREMENT, -- Identificador único de la sala
    nombre_sala VARCHAR(100) NOT NULL, -- Nombre de la sala
    capacidad INT NOT NULL -- Capacidad de la sala
);

-- Tabla DIRECTOR
CREATE TABLE DIRECTOR (
    id_dir INT PRIMARY KEY AUTO_INCREMENT, -- Identificador único del director
    nombre VARCHAR(100) NOT NULL, -- Nombre del director
    nacionalidad VARCHAR(50) -- Nacionalidad del director
);

-- Tabla pivote PELI_DIRECTOR
CREATE TABLE PELI_DIRECTOR (
    id_peli INT NOT NULL, -- Identificador de la película
    id_dir INT NOT NULL, -- Identificador del director
    PRIMARY KEY (id_peli, id_dir),
    FOREIGN KEY (id_peli) REFERENCES PELICULA(id_peli),
    FOREIGN KEY (id_dir) REFERENCES DIRECTOR(id_dir)
);

-- Tabla RESERVA
CREATE TABLE RESERVA (
    id_reserva INT PRIMARY KEY AUTO_INCREMENT, -- Identificador único de la reserva
    id_clie INT NOT NULL, -- Identificador del cliente que realiza la reserva
    id_peli INT NOT NULL, -- Identificador de la película reservada
    fecha_reserva DATETIME NOT NULL, -- Fecha y hora de la reserva
    precio_total DECIMAL(10,2) NOT NULL, -- Precio total de la reserva
    FOREIGN KEY (id_clie) REFERENCES CLIENTE(id_clie),
    FOREIGN KEY (id_peli) REFERENCES PELICULA(id_peli)
);

-- Tabla FUNCION
CREATE TABLE FUNCION (
    id_func INT PRIMARY KEY AUTO_INCREMENT, -- Identificador único de la función
    fecha DATE NOT NULL, -- Fecha de la función
    hora TIME NOT NULL, -- Hora de la función
    id_peli INT NOT NULL, -- Identificador de la película de la función
    id_sala INT NOT NULL, -- Identificador de la sala donde se proyecta la función
    FOREIGN KEY (id_peli) REFERENCES PELICULA(id_peli),
    FOREIGN KEY (id_sala) REFERENCES SALA(id_sala)
);

-- Inserts adaptados
INSERT INTO CLIENTE (nombre, correo) VALUES
('Juan Pérez','juan.perez@email.com'),
('María López','maria.lopez@email.com');

INSERT INTO PELICULA (titulo, duracion) VALUES
('Interestelar',169),
('Origen',148),
('Blade Runner 2049',164);

INSERT INTO SALA (nombre_sala, capacidad) VALUES
('Sala 1',150),
('Sala VIP',50);

INSERT INTO DIRECTOR (nombre, nacionalidad) VALUES
('Christopher Nolan','Británica-Estadounidense'),
('Denis Villeneuve','Canadiense');

INSERT INTO PELI_DIRECTOR (id_peli, id_dir) VALUES
(1, 1),
(2, 1),
(3, 2);

INSERT INTO RESERVA (id_clie, id_peli, fecha_reserva, precio_total) VALUES
(1, 1,'2025-07-20 19:00:00', 12.50),
(2, 2,'2025-07-21 21:00:00', 15.00);

INSERT INTO FUNCION (fecha, hora, id_peli, id_sala) VALUES
('2025-07-20','19:00:00', 1,1),
('2025-07-21','21:00:00', 2,2),
('2025-07-22','20:30:00', 3,1);

-- Procedimiento Almacenado adaptado
DELIMITER //
CREATE PROCEDURE InsertarClienteCine(
    IN p_nombre VARCHAR(100), -- Nombre del cliente a insertar
    IN p_correo VARCHAR(100) -- Correo del cliente a insertar
)
BEGIN
    INSERT INTO CLIENTE (nombre, correo)
    VALUES (p_nombre, p_correo);
END //
DELIMITER ;
CALL InsertarClienteCine('Mariana Ruiz', 'mariana.ruiz@email.com');

-- SELECTs adaptados

-- 1. Cliente y las películas que ha reservado
SELECT c.nombre AS cliente, p.titulo AS pelicula, r.fecha_reserva
FROM CLIENTE c
INNER JOIN RESERVA r ON c.id_clie = r.id_clie
INNER JOIN PELICULA p ON r.id_peli = p.id_peli;

-- 2. Director con las películas que ha dirigido
SELECT d.nombre AS director, p.titulo AS pelicula
FROM DIRECTOR d
INNER JOIN PELI_DIRECTOR pd ON d.id_dir = pd.id_dir
INNER JOIN PELICULA p ON pd.id_peli = p.id_peli;

-- 3. Película y el total de reservas
SELECT p.titulo AS pelicula, COUNT(r.id_reserva) AS total_reservas
FROM PELICULA p
INNER JOIN RESERVA r ON p.id_peli = r.id_peli
GROUP BY p.id_peli, p.titulo;

-- 4. Director y el número de películas que ha dirigido
SELECT d.nombre AS director, COUNT(pd.id_peli) AS peliculas_dirigidas
FROM DIRECTOR d
INNER JOIN PELI_DIRECTOR pd ON d.id_dir = pd.id_dir
GROUP BY d.id_dir, d.nombre;

-- 5. Función con la película, la sala y su capacidad
SELECT fu.fecha, fu.hora, p.titulo AS pelicula, s.nombre_sala AS sala, s.capacidad
FROM FUNCION fu
INNER JOIN PELICULA p ON fu.id_peli = p.id_peli
INNER JOIN SALA s ON fu.id_sala = s.id_sala;

-- Subconsultas adaptadas

-- 1. Directores que han dirigido películas con funciones en salas de más de 100 de capacidad
SELECT nombre
FROM DIRECTOR
WHERE id_dir IN (
    SELECT pd.id_dir
    FROM PELI_DIRECTOR pd
    WHERE pd.id_peli IN
(
        SELECT fu.id_peli
        FROM FUNCION fu
        WHERE fu.id_sala IN
(
            SELECT id_sala
            FROM SALA
            WHERE capacidad > 100
        )
    )
);

-- 2. Clientes que han reservado películas con duración mayor a 150 minutos
SELECT nombre
FROM CLIENTE
WHERE id_clie IN (
    SELECT id_clie
    FROM RESERVA
    WHERE id_peli IN (
        SELECT id_peli
        FROM PELICULA
        WHERE duracion > 150
    )
);

-- 3. Películas reservadas por clientes con nombre que empieza por 'J'
SELECT titulo
FROM PELICULA
WHERE id_peli IN (
    SELECT id_peli
    FROM RESERVA
    WHERE id_clie IN (
        SELECT id_clie
        FROM CLIENTE
        WHERE nombre LIKE 'J%'
    )
);

-- 4. Salas con funciones de películas dirigidas por directores de nacionalidad 'Canadiense'
SELECT nombre_sala
FROM SALA
WHERE id_sala IN (
    SELECT fu.id_sala
    FROM FUNCION fu
    WHERE fu.id_peli IN
(
        SELECT pd.id_peli
        FROM PELI_DIRECTOR pd
        WHERE pd.id_dir IN (
            SELECT id_dir
            FROM DIRECTOR
            WHERE nacionalidad ='Canadiense'
        )
    )
);

-- 5. Clientes que han reservado películas con duración entre 140 y 160 minutos
SELECT nombre
FROM CLIENTE
WHERE id_clie IN (
    SELECT id_clie
    FROM RESERVA
    WHERE id_peli IN (
        SELECT id_peli
        FROM PELICULA
        WHERE duracion BETWEEN 140 AND 160
    )
);

-- SELECTs con funciones adaptadas

-- 1. Capacidad máxima entre todas las Salas
SELECT MAX(capacidad) AS capacidad_maxima_sala
FROM SALA;

-- 2. Lista de Directores con nacionalidad concatenada
SELECT CONCAT(nombre,' (', nacionalidad, ')') AS director_info
FROM DIRECTOR;

-- 3. Títulos de Películas en mayúscula
SELECT id_peli, UPPER(titulo) AS titulo_mayuscula
FROM PELICULA;

-- 4. Duración mínima registrada entre todas las Películas
SELECT MIN(duracion) AS duracion_minima_pelicula
FROM PELICULA;

-- 5. Cantidad total de Funciones programadas
SELECT COUNT(*) AS total_funciones
FROM FUNCION;

-- UPDATEs adaptados

-- Actualiza el correo de un cliente
UPDATE CLIENTE SET correo = 'juan.nuevo@email.com'
WHERE id_clie = 1;

-- Actualiza la duración de una película
UPDATE PELICULA SET duracion = 175
WHERE id_peli = 1;

-- Actualiza la nacionalidad de un director
UPDATE DIRECTOR SET nacionalidad ='Estadounidense'
WHERE id_dir = 1;

-- Actualiza la capacidad de una sala
UPDATE SALA SET capacidad = 200
WHERE id_sala = 1;

-- Actualiza la hora de una función
UPDATE FUNCION SET hora = '22:00:00'
WHERE id_func = 2;

-- DELETEs adaptados

-- Elimina una reserva específica
DELETE FROM RESERVA WHERE id_clie = 1 AND id_peli =1;

-- Elimina la asignación de una película a un director
DELETE FROM PELI_DIRECTOR WHERE id_peli = 3 AND id_dir = 2;

-- Elimina una función específica
DELETE FROM FUNCION WHERE id_func = 3;

-- Elimina una sala específica
DELETE FROM SALA WHERE id_sala = 2;

-- Elimina un cliente específico
DELETE FROM CLIENTE WHERE id_clie = 2;

-- ALTERs adaptados

-- Añade una columna de fecha de nacimiento a la tabla CLIENTE
ALTER TABLE CLIENTE ADD fecha_nacimiento DATE;

-- Elimina la columna 'duracion' de la tabla PELICULA
ALTER TABLE PELICULA DROP COLUMN duracion;

-- Añade una columna de 'estado' a la tabla SALA
ALTER TABLE SALA ADD estado VARCHAR(50);

-- Añade una columna de 'fecha_inicio_carrera' a la tabla DIRECTOR
ALTER TABLE DIRECTOR ADD fecha_inicio_carrera DATE;

-- Elimina la columna 'hora' de la tabla FUNCION
ALTER TABLE FUNCION DROP COLUMN hora;

-- TRUNCATEs adaptados

TRUNCATE TABLE RESERVA;
TRUNCATE TABLE PELI_DIRECTOR;
TRUNCATE TABLE FUNCION;
TRUNCATE TABLE SALA;
TRUNCATE TABLE CLIENTE;

-- DROP s adaptados
DROP TABLE RESERVA;
DROP TABLE PELI_DIRECTOR;
DROP TABLE FUNCION;
DROP TABLE CLIENTE;
DROP TABLE PELICULA;




CREATE TABLE HUESPED (
    id_huesp INT PRIMARY KEY AUTO_INCREMENT, -- Identificador único del huésped
    nombre VARCHAR(100) NOT NULL, -- Nombre del huésped
    documento VARCHAR(50) UNIQUE -- Documento de identificación del huésped
);

CREATE TABLE PISO (
    id_piso INT PRIMARY KEY AUTO_INCREMENT, -- Identificador único del piso
    nivel VARCHAR(50) NOT NULL, -- Nivel del piso (e.g., "Primer Piso", "Segundo Piso")
    ascensor BOOLEAN -- Indica si el piso tiene ascensor (TRUE/FALSE)
);

CREATE TABLE HABITACION (
    id_hab INT PRIMARY KEY AUTO_INCREMENT, -- Identificador único de la habitación
    numero VARCHAR(100) NOT NULL, -- Número de la habitación
    tipo VARCHAR(50), -- Tipo de habitación (e.g., "Simple", "Doble", "Suite")
    id_piso INT NOT NULL, -- Identificador del piso al que pertenece la habitación
    FOREIGN KEY (id_piso) REFERENCES PISO(id_piso)
);

CREATE TABLE SERVICIO (
    id_serv INT PRIMARY KEY AUTO_INCREMENT, -- Identificador único del servicio
    nombre VARCHAR(100) NOT NULL, -- Nombre del servicio (e.g., "Desayuno", "Lavandería")
    categoria VARCHAR(50) -- Categoría del servicio (e.g., "Alimentos", "Limpieza")
);

CREATE TABLE HAB_SERVICIO (
    id_hab INT NOT NULL, -- Identificador de la habitación
    id_serv INT NOT NULL, -- Identificador del servicio
    PRIMARY KEY (id_hab, id_serv),
    FOREIGN KEY (id_hab) REFERENCES HABITACION(id_hab),
    FOREIGN KEY (id_serv) REFERENCES SERVICIO(id_serv)
);

CREATE TABLE RESERVA (
    id_reserva INT PRIMARY KEY AUTO_INCREMENT, -- Identificador único de la reserva
    id_huesp INT NOT NULL, -- Identificador del huésped que realiza la reserva
    id_hab INT NOT NULL, -- Identificador de la habitación reservada
    fecha_entrada DATETIME NOT NULL, -- Fecha y hora de entrada de la reserva
    fecha_salida DATETIME NOT NULL, -- Fecha y hora de salida de la reserva
    FOREIGN KEY (id_huesp) REFERENCES HUESPED(id_huesp),
    FOREIGN KEY (id_hab) REFERENCES HABITACION(id_hab)
);

CREATE TABLE EMPLEADO (
    id_emp INT PRIMARY KEY AUTO_INCREMENT, -- Identificador único del empleado
    nombre VARCHAR(100) NOT NULL, -- Nombre del empleado
    cargo VARCHAR(100), -- Cargo del empleado
    id_piso INT, -- Identificador del piso asignado al empleado (opcional)
    FOREIGN KEY (id_piso) REFERENCES PISO(id_piso)
);

INSERT INTO HUESPED (nombre, documento) VALUES
('Juan Pérez','1234567890'),
('María López','0987654321');

INSERT INTO PISO (nivel, ascensor) VALUES
('Primer Piso',TRUE),
('Segundo Piso',FALSE);

INSERT INTO HABITACION (numero, tipo, id_piso) VALUES
('101', 'Simple',1),
('205', 'Doble',2),
('102', 'Suite',1);

INSERT INTO SERVICIO (nombre, categoria) VALUES
('Desayuno','Alimentos'),
('Lavandería','Limpieza'),
('Spa', 'Bienestar');

INSERT INTO HAB_SERVICIO (id_hab, id_serv) VALUES
(1, 1),
(1, 2),
(2, 1);

INSERT INTO RESERVA (id_huesp, id_hab, fecha_entrada, fecha_salida) VALUES
(1, 1,'2025-07-01 15:00:00', '2025-07-03 12:00:00'),
(2, 2,'2025-07-05 14:00:00', '2025-07-10 11:00:00');

INSERT INTO EMPLEADO (nombre, cargo, id_piso) VALUES
('Carlos García','Recepcionista', 1),
('Ana Torres','Limpieza', 2);

DELIMITER //
CREATE PROCEDURE InsertarHuesped(
    IN p_nombre VARCHAR(100), -- Nombre del huésped a insertar
    IN p_documento VARCHAR(50) -- Documento del huésped a insertar
)
BEGIN
    INSERT INTO HUESPED (nombre, documento)
    VALUES (p_nombre, p_documento);
END //
DELIMITER ;
CALL InsertarHuesped('Mariana Ruiz', '1122334455');

-- SELECTs
SELECT h.nombre AS huesped, ha.numero AS habitacion, r.fecha_entrada, r.fecha_salida
FROM HUESPED h
INNER JOIN RESERVA r ON h.id_huesp = r.id_huesp
INNER JOIN HABITACION ha ON r.id_hab = ha.id_hab;

SELECT ha.numero AS habitacion, s.nombre AS servicio, s.categoria
FROM HABITACION ha
INNER JOIN HAB_SERVICIO hs ON ha.id_hab = hs.id_hab
INNER JOIN SERVICIO s ON hs.id_serv = s.id_serv;

SELECT p.nivel AS piso, COUNT(ha.id_hab) AS total_habitaciones
FROM PISO p
LEFT JOIN HABITACION ha ON p.id_piso = ha.id_piso
GROUP BY p.nivel;

SELECT e.nombre AS empleado, e.cargo, p.nivel AS piso_asignado
FROM EMPLEADO e
LEFT JOIN PISO p ON e.id_piso = p.id_piso;

SELECT ha.numero AS habitacion, ha.tipo, p.nivel AS piso
FROM HABITACION ha
INNER JOIN PISO p ON ha.id_piso = p.id_piso;

-- SUBCONSULTAS

SELECT nombre
FROM HUESPED
WHERE id_huesp IN (
    SELECT id_huesp
    FROM RESERVA
    WHERE id_hab IN (
        SELECT id_hab
        FROM HABITACION
        WHERE tipo = 'Suite'
    )
);

SELECT numero
FROM HABITACION
WHERE id_hab IN (
    SELECT id_hab
    FROM HAB_SERVICIO
    WHERE id_serv = (SELECT id_serv FROM SERVICIO WHERE nombre = 'Desayuno')
);

SELECT nivel
FROM PISO
WHERE id_piso IN (
    SELECT id_piso
    FROM HABITACION
    WHERE id_hab IN (
        SELECT id_hab
        FROM RESERVA
        WHERE id_huesp IN (SELECT id_huesp FROM HUESPED WHERE nombre = 'Juan Pérez')
    )
);

SELECT nombre
FROM EMPLEADO
WHERE id_piso IN (
    SELECT id_piso
    FROM PISO
    WHERE ascensor = TRUE
);

SELECT nombre
FROM SERVICIO
WHERE id_serv IN (
    SELECT id_serv
    FROM HAB_SERVICIO
    WHERE id_hab IN (
        SELECT id_hab
        FROM HABITACION
        WHERE numero = '101'
    )
);

-- SELECT CON FUNCIONES

SELECT COUNT(*) AS total_huespedes
FROM HUESPED;

SELECT MAX(nivel) AS nivel_mas_alto_piso
FROM PISO;

SELECT UPPER(tipo) AS tipo_habitacion_mayuscula
FROM HABITACION;

SELECT COUNT(*) AS total_reservas
FROM RESERVA;

SELECT CONCAT(nombre,' (', cargo, ')') AS empleado_info
FROM EMPLEADO;

-- UPDATE

UPDATE HUESPED SET nombre = 'Juan Perez Modificado'
WHERE id_huesp = 1;

UPDATE HABITACION SET tipo = 'Ejecutiva'
WHERE id_hab = 1;

UPDATE SERVICIO SET categoria = 'Personalizado'
WHERE id_serv = 1;

UPDATE PISO SET ascensor = FALSE
WHERE id_piso = 2;

UPDATE EMPLEADO SET cargo = 'Supervisor'
WHERE id_emp = 1;

-- DELETE

DELETE FROM HAB_SERVICIO WHERE id_hab = 1 AND id_serv = 2;
DELETE FROM RESERVA WHERE id_huesp = 1 AND id_hab =1;
DELETE FROM EMPLEADO WHERE id_emp = 2;
DELETE FROM HABITACION WHERE id_hab = 3;
DELETE FROM HUESPED WHERE id_huesp = 2;

-- ALTER

ALTER TABLE HUESPED ADD telefono VARCHAR(20); -- Número de teléfono del huésped
ALTER TABLE HABITACION DROP COLUMN tipo;
ALTER TABLE SERVICIO ADD precio DECIMAL(10,2); -- Precio del servicio
ALTER TABLE PISO DROP COLUMN ascensor;
ALTER TABLE EMPLEADO ADD fecha_contratacion DATE; -- Fecha de contratación del empleado

-- TRUNCATE

TRUNCATE TABLE HAB_SERVICIO;
TRUNCATE TABLE RESERVA;
TRUNCATE TABLE EMPLEADO;
TRUNCATE TABLE HABITACION;
TRUNCATE TABLE HUESPED;

-- DROP

DROP TABLE HAB_SERVICIO;
DROP TABLE RESERVA;
DROP TABLE EMPLEADO;
DROP TABLE HABITACION;
DROP TABLE HUESPED;







CREATE TABLE ASISTENTE (
    id_asist INT PRIMARY KEY AUTO_INCREMENT, -- Identificador único del asistente
    nombre VARCHAR(100) NOT NULL, -- Nombre del asistente
    correo VARCHAR(100) UNIQUE NOT NULL -- Correo electrónico del asistente
);

CREATE TABLE CONCIERTO (
    id_conci INT PRIMARY KEY AUTO_INCREMENT, -- Identificador único del concierto
    nombre VARCHAR(255) NOT NULL, -- Nombre del concierto
    fecha DATE NOT NULL -- Fecha del concierto
);

CREATE TABLE ESCENARIO (
    id_escenario INT PRIMARY KEY AUTO_INCREMENT, -- Identificador único del escenario
    nombre_escenario VARCHAR(100) NOT NULL, -- Nombre del escenario
    capacidad INT NOT NULL -- Capacidad del escenario
);

CREATE TABLE ARTISTA (
    id_artist INT PRIMARY KEY AUTO_INCREMENT, -- Identificador único del artista
    nombre VARCHAR(100) NOT NULL, -- Nombre del artista
    genero VARCHAR(50) -- Género musical del artista
);

CREATE TABLE BOLETO (
    id_asist INT NOT NULL, -- Identificador del asistente
    id_conci INT NOT NULL, -- Identificador del concierto
    PRIMARY KEY (id_asist, id_conci),
    fecha_compra DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, -- Fecha y hora de compra del boleto
    precio DECIMAL(10,2) NOT NULL, -- Precio del boleto
    FOREIGN KEY (id_asist) REFERENCES ASISTENTE(id_asist),
    FOREIGN KEY (id_conci) REFERENCES CONCIERTO(id_conci)
);

CREATE TABLE ARTISTA_CONCIERTO (
    id_artist INT NOT NULL, -- Identificador del artista
    id_conci INT NOT NULL, -- Identificador del concierto
    PRIMARY KEY (id_artist, id_conci),
    FOREIGN KEY (id_artist) REFERENCES ARTISTA(id_artist),
    FOREIGN KEY (id_conci) REFERENCES CONCIERTO(id_conci)
);

CREATE TABLE ORGANIZADOR (
    id_org INT PRIMARY KEY AUTO_INCREMENT, -- Identificador único del organizador
    nombre VARCHAR(100) NOT NULL, -- Nombre del organizador
    telefono VARCHAR(20), -- Número de teléfono del organizador
    id_conci INT, -- Identificador del concierto que organiza (opcional)
    FOREIGN KEY (id_conci) REFERENCES CONCIERTO(id_conci)
);

INSERT INTO ASISTENTE (nombre, correo) VALUES
('Ana García','ana.garcia@email.com'),
('Luis Rodríguez','luis.rodriguez@email.com');

INSERT INTO CONCIERTO (nombre, fecha) VALUES
('Rock Fest 2025','2025-08-10'),
('Jazz Night','2025-09-15');

INSERT INTO ESCENARIO (nombre_escenario, capacidad) VALUES
('Estadio Metropolitano',50000),
('Teatro Ciudad',2000);

INSERT INTO ARTISTA (nombre, genero) VALUES
('The Rockers','Rock'),
('Jazz Fusion Trio','Jazz'),
('Pop Divas','Pop');

INSERT INTO BOLETO (id_asist, id_conci, precio) VALUES
(1, 1,75.00),
(2, 2,50.00),
(1, 2,50.00);

INSERT INTO ARTISTA_CONCIERTO (id_artist, id_conci) VALUES
(1, 1),
(2, 2);

INSERT INTO ORGANIZADOR (nombre, telefono, id_conci) VALUES
('Eventos Musicales SA','555-1111', 1),
('Producciones Artísticas','555-2222', 2);

DELIMITER //
CREATE PROCEDURE InsertarAsistente(
    IN p_nombre VARCHAR(100), -- Nombre del asistente a insertar
    IN p_correo VARCHAR(100) -- Correo del asistente a insertar
)
BEGIN
    INSERT INTO ASISTENTE (nombre, correo)
    VALUES (p_nombre, p_correo);
END //
DELIMITER ;
CALL InsertarAsistente('Sofía Fernández', 'sofia.fernandez@email.com');

-- SELECTs
SELECT a.nombre AS asistente, c.nombre AS concierto, b.fecha_compra, b.precio
FROM ASISTENTE a
INNER JOIN BOLETO b ON a.id_asist = b.id_asist
INNER JOIN CONCIERTO c ON b.id_conci = c.id_conci;

SELECT ar.nombre AS artista, c.nombre AS concierto, c.fecha
FROM ARTISTA ar
INNER JOIN ARTISTA_CONCIERTO ac ON ar.id_artist = ac.id_artist
INNER JOIN CONCIERTO c ON ac.id_conci = c.id_conci;

SELECT co.nombre AS concierto, COUNT(b.id_asist) AS total_boletos_vendidos, SUM(b.precio) AS ingresos_totales
FROM CONCIERTO co
LEFT JOIN BOLETO b ON co.id_conci = b.id_conci
GROUP BY co.id_conci, co.nombre;

SELECT ar.nombre AS artista, COUNT(ac.id_conci) AS total_conciertos
FROM ARTISTA ar
LEFT JOIN ARTISTA_CONCIERTO ac ON ar.id_artist = ac.id_artist
GROUP BY ar.id_artist, ar.nombre;

SELECT o.nombre AS organizador, o.telefono, c.nombre AS concierto_organizado
FROM ORGANIZADOR o
LEFT JOIN CONCIERTO c ON o.id_conci = c.id_conci;

-- SUBCONSULTAS
SELECT nombre
FROM ARTISTA
WHERE id_artist IN (
    SELECT id_artist
    FROM ARTISTA_CONCIERTO
    WHERE id_conci IN (
        SELECT id_conci
        FROM CONCIERTO
        WHERE nombre LIKE '%Rock%'
    )
);

SELECT nombre
FROM ASISTENTE
WHERE id_asist IN (
    SELECT id_asist
    FROM BOLETO
    WHERE id_conci = (SELECT id_conci FROM CONCIERTO WHERE nombre = 'Jazz Night')
);

SELECT nombre
FROM CONCIERTO
WHERE id_conci IN (
    SELECT id_conci
    FROM ORGANIZADOR
    WHERE nombre LIKE '%Eventos%'
);

SELECT nombre_escenario
FROM ESCENARIO
WHERE capacidad > 10000;

SELECT nombre
FROM ARTISTA
WHERE genero = 'Jazz';

-- SELECT CON FUNCIONES
SELECT MAX(capacidad) AS capacidad_maxima_escenario
FROM ESCENARIO;

SELECT CONCAT(nombre,' (', genero, ')') AS artista_info
FROM ARTISTA;

SELECT UPPER(nombre) AS nombre_concierto_mayuscula
FROM CONCIERTO;

SELECT COUNT(DISTINCT id_artist) AS total_artistas_diferentes
FROM ARTISTA_CONCIERTO;

SELECT AVG(precio) AS precio_promedio_boleto
FROM BOLETO;

-- UPDATE
UPDATE ASISTENTE SET correo = 'ana.g@newemail.com'
WHERE id_asist = 1;

UPDATE CONCIERTO SET fecha = '2025-08-15'
WHERE id_conci = 1;

UPDATE ARTISTA SET genero = 'Pop Latino'
WHERE id_artist = 3;

UPDATE ESCENARIO SET capacidad = 60000
WHERE id_escenario = 1;

UPDATE ORGANIZADOR SET telefono = '555-3333'
WHERE id_org = 1;

-- DELETE
DELETE FROM BOLETO WHERE id_asist = 1 AND id_conci =2;
DELETE FROM ARTISTA_CONCIERTO WHERE id_artist = 1 AND id_conci = 1;
DELETE FROM ORGANIZADOR WHERE id_org = 2;
DELETE FROM ESCENARIO WHERE id_escenario = 2;
DELETE FROM ASISTENTE WHERE id_asist = 2;

-- ALTER
ALTER TABLE ASISTENTE ADD telefono VARCHAR(20); -- Número de teléfono del asistente
ALTER TABLE CONCIERTO DROP COLUMN fecha;
ALTER TABLE ESCENARIO ADD ubicacion VARCHAR(255); -- Ubicación del escenario
ALTER TABLE ARTISTA ADD pais_origen VARCHAR(50); -- País de origen del artista
ALTER TABLE ORGANIZADOR DROP COLUMN telefono;

-- TRUNCATE
TRUNCATE TABLE BOLETO;
TRUNCATE TABLE ARTISTA_CONCIERTO;
TRUNCATE TABLE ORGANIZADOR;
TRUNCATE TABLE ASISTENTE;
TRUNCATE TABLE CONCIERTO;

-- DROP
DROP TABLE BOLETO;
DROP TABLE ARTISTA_CONCIERTO;
DROP TABLE ORGANIZADOR;
DROP TABLE ASISTENTE;
DROP TABLE CONCIERTO;

