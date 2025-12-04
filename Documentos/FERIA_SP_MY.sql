-- (A) CREAR BASES / ESQUEMAS
-- ==========================================================
DROP DATABASE IF EXISTS FERIA_SP;
CREATE DATABASE FERIA_SP;

CREATE DATABASE IF NOT EXISTS feria_estructura CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE DATABASE IF NOT EXISTS feria_empresarial CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE DATABASE IF NOT EXISTS feria_personas   CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Trabajaremos el procedimiento en feria_estructura
USE feria_estructura;
USE feria_estructura;

DROP PROCEDURE IF EXISTS pr_crear_tablas;
DELIMITER //

CREATE PROCEDURE pr_crear_tablas()
BEGIN
    -- LIMPIEZA (hijos -> padres)
    DROP TABLE IF EXISTS feria_personas.registro;
    DROP TABLE IF EXISTS feria_personas.demostracion;
    DROP TABLE IF EXISTS feria_personas.charla;
    DROP TABLE IF EXISTS feria_personas.visitante;
    DROP TABLE IF EXISTS feria_personas.tipo_entrada;
    DROP TABLE IF EXISTS feria_personas.ponente;
    DROP TABLE IF EXISTS feria_empresarial.responsables;
    DROP TABLE IF EXISTS feria_empresarial.productos;
    DROP TABLE IF EXISTS feria_empresarial.stands;
    DROP TABLE IF EXISTS feria_empresarial.empresas;
    DROP TABLE IF EXISTS feria_estructura.pabellon;
    DROP TABLE IF EXISTS feria_estructura.tema;
    DROP TABLE IF EXISTS feria_estructura.feria;
    DROP TABLE IF EXISTS feria_personas.persona;

    /* feria_estructura */
    CREATE TABLE feria_estructura.feria (
        id_feria INT PRIMARY KEY,
        nombre VARCHAR(100) NOT NULL,
        fecha_inicio DATE NOT NULL,
        fecha_fin DATE NOT NULL
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

    CREATE TABLE feria_estructura.tema (
        id_tema INT PRIMARY KEY,
        tema VARCHAR(100) NOT NULL
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

    CREATE TABLE feria_estructura.pabellon (
        id_pabellon INT PRIMARY KEY,
        nombre VARCHAR(100) NOT NULL,
        tematica VARCHAR(100) NOT NULL,
        capacidad INT NOT NULL,
        id_feria INT NOT NULL,
        id_tema INT NOT NULL,
        CONSTRAINT fk_pabellon_feria
          FOREIGN KEY (id_feria) REFERENCES feria_estructura.feria(id_feria),
        CONSTRAINT fk_pabellon_tema
          FOREIGN KEY (id_tema) REFERENCES feria_estructura.tema(id_tema)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

    /* feria_empresarial */
    CREATE TABLE feria_empresarial.empresas (
        id_empresa INT PRIMARY KEY,
        nombre VARCHAR(100) NOT NULL
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

    CREATE TABLE feria_empresarial.stands (
        id_stand INT PRIMARY KEY,
        numero INT NOT NULL,
        nombre VARCHAR(100) NOT NULL,
        id_empresa INT NOT NULL,
        id_pabellon INT NOT NULL,
        CONSTRAINT fk_stands_empresa
          FOREIGN KEY (id_empresa) REFERENCES feria_empresarial.empresas(id_empresa),
        CONSTRAINT fk_stands_pabellon
          FOREIGN KEY (id_pabellon) REFERENCES feria_estructura.pabellon(id_pabellon)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

    CREATE TABLE feria_empresarial.productos (
        id_producto INT PRIMARY KEY,
        nombre VARCHAR(100) NOT NULL,
        descripcion TEXT NULL,
        id_stand INT NOT NULL,
        CONSTRAINT fk_productos_stand
          FOREIGN KEY (id_stand) REFERENCES feria_empresarial.stands(id_stand)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

    /* feria_personas */
    CREATE TABLE feria_personas.persona (
        id_persona INT PRIMARY KEY,
        nombre VARCHAR(100) NOT NULL
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

    CREATE TABLE feria_personas.tipo_entrada (
        id_tipo_entrada INT PRIMARY KEY,
        tipo_entrada VARCHAR(100) NOT NULL
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

    CREATE TABLE feria_personas.ponente (
        id_ponente INT PRIMARY KEY,
        id_persona INT NOT NULL,
        CONSTRAINT fk_ponente_persona
          FOREIGN KEY (id_persona) REFERENCES feria_personas.persona(id_persona)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

    CREATE TABLE feria_personas.visitante (
        id_visitante INT PRIMARY KEY,
        id_persona INT NOT NULL,
        id_tipo_entrada INT NOT NULL,
        CONSTRAINT fk_visitante_persona
          FOREIGN KEY (id_persona) REFERENCES feria_personas.persona(id_persona),
        CONSTRAINT fk_visitante_tipoentrada
          FOREIGN KEY (id_tipo_entrada) REFERENCES feria_personas.tipo_entrada(id_tipo_entrada)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

    CREATE TABLE feria_personas.charla (
        id_charla INT PRIMARY KEY,
        nombre VARCHAR(100) NOT NULL
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

    CREATE TABLE feria_personas.demostracion (
        id_demostracion INT PRIMARY KEY,
        nombre VARCHAR(100) NOT NULL
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

    CREATE TABLE feria_empresarial.responsables (
        id_responsable INT PRIMARY KEY,
        id_producto INT NOT NULL,
        id_persona INT NOT NULL,
        CONSTRAINT fk_responsables_producto
          FOREIGN KEY (id_producto) REFERENCES feria_empresarial.productos(id_producto),
        CONSTRAINT fk_responsables_persona
          FOREIGN KEY (id_persona) REFERENCES feria_personas.persona(id_persona)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

    CREATE TABLE feria_personas.registro (
        id_registro INT PRIMARY KEY,
        id_charla INT NULL,
        id_demostracion INT NULL,
        id_empresa INT NULL,
        id_feria INT NULL,
        id_ponente INT NULL,
        id_visitante INT NULL,
        CONSTRAINT fk_registro_charla
          FOREIGN KEY (id_charla) REFERENCES feria_personas.charla(id_charla),
        CONSTRAINT fk_registro_demostracion
          FOREIGN KEY (id_demostracion) REFERENCES feria_personas.demostracion(id_demostracion),
        CONSTRAINT fk_registro_empresa
          FOREIGN KEY (id_empresa) REFERENCES feria_empresarial.empresas(id_empresa),
        CONSTRAINT fk_registro_feria
          FOREIGN KEY (id_feria) REFERENCES feria_estructura.feria(id_feria),
        CONSTRAINT fk_registro_ponente
          FOREIGN KEY (id_ponente) REFERENCES feria_personas.ponente(id_ponente),
        CONSTRAINT fk_registro_visitante
          FOREIGN KEY (id_visitante) REFERENCES feria_personas.visitante(id_visitante)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
END//

DELIMITER ;

CALL pr_crear_tablas();


USE feria_estructura;

DROP PROCEDURE IF EXISTS pr_insertar_datos;
DELIMITER //

CREATE PROCEDURE pr_insertar_datos()
BEGIN
    DECLARE i INT DEFAULT 1;

    /* feria_estructura.feria */
    WHILE i <= 1000 DO
        INSERT INTO feria_estructura.feria (id_feria, nombre, fecha_inicio, fecha_fin)
        VALUES (i, CONCAT('Feria_', i), DATE_ADD('2025-01-01', INTERVAL i DAY), DATE_ADD('2025-01-10', INTERVAL i DAY));
        SET i = i + 1;
    END WHILE;

    SET i = 1;
    /* feria_estructura.tema */
    WHILE i <= 1000 DO
        INSERT INTO feria_estructura.tema (id_tema, tema)
        VALUES (i, CONCAT('Tema_', i));
        SET i = i + 1;
    END WHILE;

    SET i = 1;
    /* feria_estructura.pabellon */
    WHILE i <= 1000 DO
        INSERT INTO feria_estructura.pabellon (id_pabellon, nombre, tematica, capacidad, id_feria, id_tema)
        VALUES (i, CONCAT('Pabellon_', i), CONCAT('Tematica_', i), 100 + i, i, i);
        SET i = i + 1;
    END WHILE;

    SET i = 1;
    /* feria_empresarial.empresas */
    WHILE i <= 1000 DO
        INSERT INTO feria_empresarial.empresas (id_empresa, nombre)
        VALUES (i, CONCAT('Empresa_', i));
        SET i = i + 1;
    END WHILE;

    SET i = 1;
    /* feria_empresarial.stands */
    WHILE i <= 1000 DO
        INSERT INTO feria_empresarial.stands (id_stand, numero, nombre, id_empresa, id_pabellon)
        VALUES (i, i, CONCAT('Stand_', i), i, i);
        SET i = i + 1;
    END WHILE;

    SET i = 1;
    /* feria_empresarial.productos */
    WHILE i <= 1000 DO
        INSERT INTO feria_empresarial.productos (id_producto, nombre, descripcion, id_stand)
        VALUES (i, CONCAT('Producto_', i), CONCAT('Descripcion del producto_', i), i);
        SET i = i + 1;
    END WHILE;

    SET i = 1;
    /* feria_personas.persona */
    WHILE i <= 1000 DO
        INSERT INTO feria_personas.persona (id_persona, nombre)
        VALUES (i, CONCAT('Persona_', i));
        SET i = i + 1;
    END WHILE;

    SET i = 1;
    /* feria_personas.tipo_entrada */
    WHILE i <= 1000 DO
        INSERT INTO feria_personas.tipo_entrada (id_tipo_entrada, tipo_entrada)
        VALUES (i, CONCAT('Tipo_', i));
        SET i = i + 1;
    END WHILE;

    SET i = 1;
    /* feria_personas.ponente */
    WHILE i <= 1000 DO
        INSERT INTO feria_personas.ponente (id_ponente, id_persona)
        VALUES (i, i);
        SET i = i + 1;
    END WHILE;

    SET i = 1;
    /* feria_personas.visitante */
    WHILE i <= 1000 DO
        INSERT INTO feria_personas.visitante (id_visitante, id_persona, id_tipo_entrada)
        VALUES (i, i, i);
        SET i = i + 1;
    END WHILE;

    SET i = 1;
    /* feria_personas.charla */
    WHILE i <= 1000 DO
        INSERT INTO feria_personas.charla (id_charla, nombre)
        VALUES (i, CONCAT('Charla_', i));
        SET i = i + 1;
    END WHILE;

    SET i = 1;
    /* feria_personas.demostracion */
    WHILE i <= 1000 DO
        INSERT INTO feria_personas.demostracion (id_demostracion, nombre)
        VALUES (i, CONCAT('Demostracion_', i));
        SET i = i + 1;
    END WHILE;

    SET i = 1;
    /* feria_empresarial.responsables */
    WHILE i <= 1000 DO
        INSERT INTO feria_empresarial.responsables (id_responsable, id_producto, id_persona)
        VALUES (i, i, i);
        SET i = i + 1;
    END WHILE;

    SET i = 1;
    /* feria_personas.registro */
    WHILE i <= 1000 DO
        INSERT INTO feria_personas.registro (id_registro, id_charla, id_demostracion, id_empresa, id_feria, id_ponente, id_visitante)
        VALUES (i, i, i, i, i, i, i);
        SET i = i + 1;
    END WHILE;
END//

DELIMITER ;

CALL pr_insertar_datos();






