
DROP DATABASE IF EXISTS feria_sp;
CREATE DATABASE feria_sp CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE feria_sp;



DELIMITER //

CREATE PROCEDURE pr_crear_tablas()
BEGIN
    

    DROP TABLE IF EXISTS
        feria_personas_registro,
        feria_empresarial_responsables,
        feria_personas_demostracion,
        feria_personas_charla,
        feria_empresarial_productos,
        feria_empresarial_stands,
        feria_empresarial_empresas,
        feria_personas_visitante,
        feria_personas_tipo_entrada,
        feria_personas_ponente,
        feria_estructura_pabellon,
        feria_estructura_tema,
        feria_estructura_feria,
        feria_personas_persona;


    CREATE TABLE feria_estructura_feria (
        id_feria      INT PRIMARY KEY,
        nombre        VARCHAR(100) NOT NULL,
        fecha_inicio  DATE NOT NULL,
        fecha_fin     DATE NOT NULL
    ) ENGINE=InnoDB;

    CREATE TABLE feria_estructura_tema (
        id_tema INT PRIMARY KEY,
        tema    VARCHAR(100) NOT NULL
    ) ENGINE=InnoDB;

    CREATE TABLE feria_estructura_pabellon (
        id_pabellon INT PRIMARY KEY,
        nombre      VARCHAR(100) NOT NULL,
        tematica    VARCHAR(100) NOT NULL,
        capacidad   INT NOT NULL,
        id_feria    INT,
        id_tema     INT,
        CONSTRAINT fk_pabellon_feria
            FOREIGN KEY (id_feria)
            REFERENCES feria_estructura_feria (id_feria),
        CONSTRAINT fk_pabellon_tema
            FOREIGN KEY (id_tema)
            REFERENCES feria_estructura_tema (id_tema)
    ) ENGINE=InnoDB;

    -- ===========================
    -- Tablas "feria_empresarial"
    -- ===========================
    CREATE TABLE feria_empresarial_empresas (
        id_empresa INT PRIMARY KEY,
        nombre     VARCHAR(100) NOT NULL
    ) ENGINE=InnoDB;

    CREATE TABLE feria_empresarial_stands (
        id_stand    INT PRIMARY KEY,
        numero      INT NOT NULL,
        nombre      VARCHAR(100) NOT NULL,
        id_empresa  INT,
        id_pabellon INT,
        CONSTRAINT fk_stands_empresa
            FOREIGN KEY (id_empresa)
            REFERENCES feria_empresarial_empresas (id_empresa),
        CONSTRAINT fk_stands_pabellon
            FOREIGN KEY (id_pabellon)
            REFERENCES feria_estructura_pabellon (id_pabellon)
    ) ENGINE=InnoDB;

    CREATE TABLE feria_empresarial_productos (
        id_producto INT PRIMARY KEY,
        nombre      VARCHAR(100) NOT NULL,
        descripcion TEXT,
        id_stand    INT,
        CONSTRAINT fk_productos_stand
            FOREIGN KEY (id_stand)
            REFERENCES feria_empresarial_stands (id_stand)
    ) ENGINE=InnoDB;

    CREATE TABLE feria_empresarial_responsables (
        id_responsable INT PRIMARY KEY,
        id_producto    INT,
        id_persona     INT,
        CONSTRAINT fk_resp_producto
            FOREIGN KEY (id_producto)
            REFERENCES feria_empresarial_productos (id_producto),
        CONSTRAINT fk_resp_persona
            FOREIGN KEY (id_persona)
            REFERENCES feria_personas_persona (id_persona)
    ) ENGINE=InnoDB;

    -- ===========================
    -- Tablas "feria_personas"
    -- ===========================
    CREATE TABLE feria_personas_persona (
        id_persona INT PRIMARY KEY,
        nombre     VARCHAR(100) NOT NULL
    ) ENGINE=InnoDB;

    CREATE TABLE feria_personas_ponente (
        id_ponente INT PRIMARY KEY,
        id_persona INT,
        CONSTRAINT fk_ponente_persona
            FOREIGN KEY (id_persona)
            REFERENCES feria_personas_persona (id_persona)
    ) ENGINE=InnoDB;

    CREATE TABLE feria_personas_tipo_entrada (
        id_tipo_entrada INT PRIMARY KEY,
        tipo_entrada    VARCHAR(100)
    ) ENGINE=InnoDB;

    CREATE TABLE feria_personas_visitante (
        id_visitante    INT PRIMARY KEY,
        id_persona      INT,
        id_tipo_entrada INT,
        CONSTRAINT fk_visitante_persona
            FOREIGN KEY (id_persona)
            REFERENCES feria_personas_persona (id_persona),
        CONSTRAINT fk_visitante_tipo
            FOREIGN KEY (id_tipo_entrada)
            REFERENCES feria_personas_tipo_entrada (id_tipo_entrada)
    ) ENGINE=InnoDB;

    CREATE TABLE feria_personas_charla (
        id_charla INT PRIMARY KEY,
        nombre    VARCHAR(100)
    ) ENGINE=InnoDB;

    CREATE TABLE feria_personas_demostracion (
        id_demostracion INT PRIMARY KEY,
        nombre          VARCHAR(100)
    ) ENGINE=InnoDB;

    CREATE TABLE feria_personas_registro (
        id_registro     INT PRIMARY KEY,
        id_charla       INT,
        id_demostracion INT,
        id_empresa      INT,
        id_feria        INT,
        id_ponente      INT,
        id_visitante    INT,
        CONSTRAINT fk_registro_charla
            FOREIGN KEY (id_charla)
            REFERENCES feria_personas_charla (id_charla),
        CONSTRAINT fk_registro_demostracion
            FOREIGN KEY (id_demostracion)
            REFERENCES feria_personas_demostracion (id_demostracion),
        CONSTRAINT fk_registro_empresa
            FOREIGN KEY (id_empresa)
            REFERENCES feria_empresarial_empresas (id_empresa),
        CONSTRAINT fk_registro_feria
            FOREIGN KEY (id_feria)
            REFERENCES feria_estructura_feria (id_feria),
        CONSTRAINT fk_registro_ponente
            FOREIGN KEY (id_ponente)
            REFERENCES feria_personas_ponente (id_ponente),
        CONSTRAINT fk_registro_visitante
            FOREIGN KEY (id_visitante)
            REFERENCES feria_personas_visitante (id_visitante)
    ) ENGINE=InnoDB;

END

DELIMITER ;

-- Ejecutar creación de tablas
CALL pr_crear_tablas();

-- =========================================
-- 3) Procedimiento: poblar 1000 filas
-- =========================================
DELIMITER //

CREATE PROCEDURE pr_poblar_feria()
BEGIN
    DECLARE i INT DEFAULT 1;

    -- feria_estructura_feria
    WHILE i <= 1000 DO
        INSERT INTO feria_estructura_feria (id_feria, nombre, fecha_inicio, fecha_fin)
        VALUES (i, CONCAT('Feria ', i), '2025-01-01', '2025-12-31');
        SET i = i + 1;
    END WHILE;

    SET i = 1;
    -- feria_estructura_tema
    WHILE i <= 1000 DO
        INSERT INTO feria_estructura_tema (id_tema, tema)
        VALUES (i, CONCAT('Tema ', i));
        SET i = i + 1;
    END WHILE;

    SET i = 1;
    -- feria_estructura_pabellon
    WHILE i <= 1000 DO
        INSERT INTO feria_estructura_pabellon
            (id_pabellon, nombre, tematica, capacidad, id_feria, id_tema)
        VALUES
            (i, CONCAT('Pabellon ', i), CONCAT('Tematica ', i), 100 + i, i, i);
        SET i = i + 1;
    END WHILE;

    SET i = 1;
    -- feria_empresarial_empresas
    WHILE i <= 1000 DO
        INSERT INTO feria_empresarial_empresas (id_empresa, nombre)
        VALUES (i, CONCAT('Empresa ', i));
        SET i = i + 1;
    END WHILE;

    SET i = 1;
    -- feria_empresarial_stands
    WHILE i <= 1000 DO
        INSERT INTO feria_empresarial_stands (id_stand, numero, nombre, id_empresa, id_pabellon)
        VALUES (i, i, CONCAT('Stand ', i), i, i);
        SET i = i + 1;
    END WHILE;

    SET i = 1;
    -- feria_empresarial_productos
    WHILE i <= 1000 DO
        INSERT INTO feria_empresarial_productos (id_producto, nombre, descripcion, id_stand)
        VALUES (i, CONCAT('Producto ', i), CONCAT('Descripcion del producto ', i), i);
        SET i = i + 1;
    END WHILE;

    SET i = 1;
    -- feria_personas_persona
    WHILE i <= 1000 DO
        INSERT INTO feria_personas_persona (id_persona, nombre)
        VALUES (i, CONCAT('Persona ', i));
        SET i = i + 1;
    END WHILE;

    SET i = 1;
    -- feria_personas_ponente
    WHILE i <= 1000 DO
        INSERT INTO feria_personas_ponente (id_ponente, id_persona)
        VALUES (i, i);
        SET i = i + 1;
    END WHILE;

    SET i = 1;
    -- feria_personas_tipo_entrada
    WHILE i <= 1000 DO
        INSERT INTO feria_personas_tipo_entrada (id_tipo_entrada, tipo_entrada)
        VALUES (i, CONCAT('Tipo Entrada ', i));
        SET i = i + 1;
    END WHILE;

    SET i = 1;
    -- feria_personas_visitante
    WHILE i <= 1000 DO
        INSERT INTO feria_personas_visitante (id_visitante, id_persona, id_tipo_entrada)
        VALUES (i, i, i);
        SET i = i + 1;
    END WHILE;

    SET i = 1;
    -- feria_personas_charla
    WHILE i <= 1000 DO
        INSERT INTO feria_personas_charla (id_charla, nombre)
        VALUES (i, CONCAT('Charla ', i));
        SET i = i + 1;
    END WHILE;

    SET i = 1;
    -- feria_personas_demostracion
    WHILE i <= 1000 DO
        INSERT INTO feria_personas_demostracion (id_demostracion, nombre)
        VALUES (i, CONCAT('Demostracion ', i));
        SET i = i + 1;
    END WHILE;

    SET i = 1;
    -- feria_empresarial_responsables
    WHILE i <= 1000 DO
        INSERT INTO feria_empresarial_responsables (id_responsable, id_producto, id_persona)
        VALUES (i, i, i);
        SET i = i + 1;
    END WHILE;

    SET i = 1;
    -- feria_personas_registro
    WHILE i <= 1000 DO
        INSERT INTO feria_personas_registro
            (id_registro, id_charla, id_demostracion, id_empresa, id_feria, id_ponente, id_visitante)
        VALUES (i, i, i, i, i, i, i);
        SET i = i + 1;
    END WHILE;
END //
//
DELIMITER ;

-- Ejecutar población
CALL pr_poblar_feria;
