

CREATE DATABASE IF NOT EXISTS feria_sp
  CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;

-- (opcional) crea el usuario si no existe
CREATE USER IF NOT EXISTS 'usuario_mysql'@'%' IDENTIFIED BY 'TU_PASSWORD';

-- otorga permisos sobre esa BD
GRANT ALL PRIVILEGES ON feria_sp.* TO 'usuario_mysql'@'%';
FLUSH PRIVILEGES;






DROP DATABASE IF EXISTS feria_sp;
CREATE DATABASE feria_sp ;
USE feria_sp;




CREATE SCHEMA feria_estructura;
GO

CREATE SCHEMA feria_empresarial;
GO

CREATE SCHEMA feria_personas;
GO

-- Logins
CREATE LOGIN login_adminFeria   WITH PASSWORD = 'admin',       CHECK_POLICY = OFF;
CREATE LOGIN login_estructura   WITH PASSWORD = 'estructura',  CHECK_POLICY = OFF;
CREATE LOGIN login_empresarial  WITH PASSWORD = 'empresarial', CHECK_POLICY = OFF;
CREATE LOGIN login_persona      WITH PASSWORD = 'persona',     CHECK_POLICY = OFF;
GO

CREATE USER user_adminFeria  FOR LOGIN login_adminFeria;
CREATE USER user_estructura  FOR LOGIN login_estructura;
CREATE USER user_empresarial FOR LOGIN login_empresarial;
CREATE USER user_persona     FOR LOGIN login_persona;
GO

GRANT CONTROL ON SCHEMA::feria_estructura  TO user_adminFeria;
GRANT CONTROL ON SCHEMA::feria_empresarial TO user_adminFeria;
GRANT CONTROL ON SCHEMA::feria_personas    TO user_adminFeria;
GO

GRANT SELECT, INSERT, UPDATE, DELETE ON SCHEMA::feria_estructura  TO user_estructura;
GRANT SELECT, INSERT, UPDATE, DELETE ON SCHEMA::feria_empresarial TO user_empresarial;
GRANT SELECT, INSERT, UPDATE, DELETE ON SCHEMA::feria_personas    TO user_persona;
GO












CREATE OR ALTER PROCEDURE dbo.pr_crear_tablas
AS
BEGIN
    
        DROP TABLE IF EXISTS feria_personas.feria_personas_registro;
        DROP TABLE IF EXISTS feria_personas.feria_personas_demostracion;
        DROP TABLE IF EXISTS feria_personas.feria_personas_charla;
        DROP TABLE IF EXISTS feria_personas.feria_personas_visitante;
        DROP TABLE IF EXISTS feria_personas.feria_personas_tipo_entrada;
        DROP TABLE IF EXISTS feria_personas.feria_personas_ponente;
        DROP TABLE IF EXISTS feria_empresarial.feria_empresarial_responsables;
        DROP TABLE IF EXISTS feria_empresarial.feria_empresarial_productos;
        DROP TABLE IF EXISTS feria_empresarial.feria_empresarial_stands;
        DROP TABLE IF EXISTS feria_empresarial.feria_empresarial_empresas;
        DROP TABLE IF EXISTS feria_estructura.feria_estructura_pabellon;
        DROP TABLE IF EXISTS feria_estructura.feria_estructura_tema;
        DROP TABLE IF EXISTS feria_estructura.feria_estructura_feria;
        DROP TABLE IF EXISTS feria_personas.feria_personas_persona;


        CREATE TABLE feria_estructura.feria_estructura_feria (
            id_feria     INT          NOT NULL PRIMARY KEY,
            nombre       VARCHAR(100) NOT NULL,
            fecha_inicio DATE         NOT NULL,
            fecha_fin    DATE         NOT NULL
        );

        CREATE TABLE feria_estructura.feria_estructura_tema (
            id_tema INT          NOT NULL PRIMARY KEY,
            tema    VARCHAR(100) NOT NULL
        );

        CREATE TABLE feria_estructura.feria_estructura_pabellon (
            id_pabellon INT          NOT NULL PRIMARY KEY,
            nombre      VARCHAR(100) NOT NULL,
            tematica    VARCHAR(100) NOT NULL,
            capacidad   INT          NOT NULL,
            id_feria    INT          NULL,
            id_tema     INT          NULL,
            CONSTRAINT FK_pabellon_feria
                FOREIGN KEY (id_feria)
                REFERENCES feria_estructura.feria_estructura_feria (id_feria),
            CONSTRAINT FK_pabellon_tema
                FOREIGN KEY (id_tema)
                REFERENCES feria_estructura.feria_estructura_tema (id_tema)
        );

        CREATE TABLE feria_empresarial.feria_empresarial_empresas (
            id_empresa INT          NOT NULL PRIMARY KEY,
            nombre     VARCHAR(100) NOT NULL
        );

        CREATE TABLE feria_empresarial.feria_empresarial_stands (
            id_stand    INT          NOT NULL PRIMARY KEY,
            numero      INT          NOT NULL,
            nombre      VARCHAR(100) NOT NULL,
            id_empresa  INT          NULL,
            id_pabellon INT          NULL,
            CONSTRAINT FK_stands_empresa
                FOREIGN KEY (id_empresa)
                REFERENCES feria_empresarial.feria_empresarial_empresas (id_empresa),
            CONSTRAINT FK_stands_pabellon
                FOREIGN KEY (id_pabellon)
                REFERENCES feria_estructura.feria_estructura_pabellon (id_pabellon)
        );

        CREATE TABLE feria_empresarial.feria_empresarial_productos (
            id_producto INT           NOT NULL PRIMARY KEY,
            nombre      VARCHAR(100)  NOT NULL,
            descripcion VARCHAR(MAX)  NULL,
            id_stand    INT           NULL,
            CONSTRAINT FK_productos_stand
                FOREIGN KEY (id_stand)
                REFERENCES feria_empresarial.feria_empresarial_stands (id_stand)
        );

        CREATE TABLE feria_personas.feria_personas_persona (
            id_persona INT          NOT NULL PRIMARY KEY,
            nombre     VARCHAR(100) NOT NULL
        );

        CREATE TABLE feria_personas.feria_personas_ponente (
            id_ponente INT NOT NULL PRIMARY KEY,
            id_persona INT NULL,
            CONSTRAINT FK_ponente_persona
                FOREIGN KEY (id_persona)
                REFERENCES feria_personas.feria_personas_persona (id_persona)
        );

        CREATE TABLE feria_personas.feria_personas_tipo_entrada (
            id_tipo_entrada INT          NOT NULL PRIMARY KEY,
            tipo_entrada    VARCHAR(100) NULL
        );

        CREATE TABLE feria_personas.feria_personas_visitante (
            id_visitante    INT NOT NULL PRIMARY KEY,
            id_persona      INT NULL,
            id_tipo_entrada INT NULL,
            CONSTRAINT FK_visitante_persona
                FOREIGN KEY (id_persona)
                REFERENCES feria_personas.feria_personas_persona (id_persona),
            CONSTRAINT FK_visitante_tipo
                FOREIGN KEY (id_tipo_entrada)
                REFERENCES feria_personas.feria_personas_tipo_entrada (id_tipo_entrada)
        );

        CREATE TABLE feria_personas.feria_personas_charla (
            id_charla INT          NOT NULL PRIMARY KEY,
            nombre    VARCHAR(100) NULL
        );

        CREATE TABLE feria_personas.feria_personas_demostracion (
            id_demostracion INT          NOT NULL PRIMARY KEY,
            nombre          VARCHAR(100) NULL
        );

        CREATE TABLE feria_empresarial.feria_empresarial_responsables (
            id_responsable INT NOT NULL PRIMARY KEY,
            id_producto    INT NULL,
            id_persona     INT NULL,
            CONSTRAINT FK_resp_producto
                FOREIGN KEY (id_producto)
                REFERENCES feria_empresarial.feria_empresarial_productos (id_producto),
            CONSTRAINT FK_resp_persona
                FOREIGN KEY (id_persona)
                REFERENCES feria_personas.feria_personas_persona (id_persona)
        );

        CREATE TABLE feria_personas.feria_personas_registro (
            id_registro     INT NOT NULL PRIMARY KEY,
            id_charla       INT NULL,
            id_demostracion INT NULL,
            id_empresa      INT NULL,
            id_feria        INT NULL,
            id_ponente      INT NULL,
            id_visitante    INT NULL,
            CONSTRAINT FK_registro_charla
                FOREIGN KEY (id_charla)
                REFERENCES feria_personas.feria_personas_charla (id_charla),
            CONSTRAINT FK_registro_demostracion
                FOREIGN KEY (id_demostracion)
                REFERENCES feria_personas.feria_personas_demostracion (id_demostracion),
            CONSTRAINT FK_registro_empresa
                FOREIGN KEY (id_empresa)
                REFERENCES feria_empresarial.feria_empresarial_empresas (id_empresa),
            CONSTRAINT FK_registro_feria
                FOREIGN KEY (id_feria)
                REFERENCES feria_estructura.feria_estructura_feria (id_feria),
            CONSTRAINT FK_registro_ponente
                FOREIGN KEY (id_ponente)
                REFERENCES feria_personas.feria_personas_ponente (id_ponente),
            CONSTRAINT FK_registro_visitante
                FOREIGN KEY (id_visitante)
                REFERENCES feria_personas.feria_personas_visitante (id_visitante)
        );

    
END
GO

EXEC dbo.pr_crear_tablas;


CREATE OR ALTER PROCEDURE dbo.pr_poblar_feria
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @i INT = 1;

    -- Insertar datos para feria_estructura.feria_estructura_feria
    WHILE @i <= 1000
    BEGIN
        INSERT INTO feria_estructura.feria_estructura_feria (id_feria, nombre, fecha_inicio, fecha_fin)
        VALUES (@i, CONCAT('Feria ', @i), '2025-01-01', '2025-12-31');
        SET @i += 1;
    END

    SET @i = 1;

    -- Insertar datos para feria_estructura.feria_estructura_tema
    WHILE @i <= 1000
    BEGIN
        INSERT INTO feria_estructura.feria_estructura_tema (id_tema, tema)
        VALUES (@i, CONCAT('Tema ', @i));
        SET @i += 1;
    END

    SET @i = 1;

    -- Insertar datos para feria_estructura.feria_estructura_pabellon
    WHILE @i <= 1000
    BEGIN
        INSERT INTO feria_estructura.feria_estructura_pabellon 
            (id_pabellon, nombre, tematica, capacidad, id_feria, id_tema)
        VALUES 
            (@i, CONCAT('Pabellon ', @i), CONCAT('Tematica ', @i), 100 + @i, @i, @i);
        SET @i += 1;
    END

    SET @i = 1;

    -- feria_empresarial_empresas
    WHILE @i <= 1000
    BEGIN
        INSERT INTO feria_empresarial.feria_empresarial_empresas
        (id_empresa, nombre)
        VALUES (@i, CONCAT('Empresa ', @i));
        SET @i += 1;
    END

    SET @i = 1;

    -- feria_empresarial_stands
    WHILE @i <= 1000
    BEGIN
        INSERT INTO feria_empresarial.feria_empresarial_stands
        (id_stand, numero, nombre, id_empresa, id_pabellon)
        VALUES (@i, @i, CONCAT('Stand ', @i), @i, @i);
        SET @i += 1;
    END

    SET @i = 1;

    -- feria_empresarial_productos
    WHILE @i <= 1000
    BEGIN
        INSERT INTO feria_empresarial.feria_empresarial_productos
        (id_producto, nombre, descripcion, id_stand)
        VALUES (@i, CONCAT('Producto ', @i), CONCAT('Descripción del producto ', @i), @i);
        SET @i += 1;
    END

    SET @i = 1;

    -- feria_personas_persona
    WHILE @i <= 1000
    BEGIN
        INSERT INTO feria_personas.feria_personas_persona
        (id_persona, nombre)
        VALUES (@i, CONCAT('Persona ', @i));
        SET @i += 1;
    END

    SET @i = 1;

    -- feria_personas_ponente
    WHILE @i <= 1000
    BEGIN
        INSERT INTO feria_personas.feria_personas_ponente
        (id_ponente, id_persona)
        VALUES (@i, @i);
        SET @i += 1;
    END

    SET @i = 1;

    -- feria_personas_tipo_entrada
    WHILE @i <= 1000
    BEGIN
        INSERT INTO feria_personas.feria_personas_tipo_entrada
        (id_tipo_entrada, tipo_entrada)
        VALUES (@i, CONCAT('Tipo Entrada ', @i));
        SET @i += 1;
    END

    SET @i = 1;

    -- feria_personas_visitante
    WHILE @i <= 1000
    BEGIN
        INSERT INTO feria_personas.feria_personas_visitante
        (id_visitante, id_persona, id_tipo_entrada)
        VALUES (@i, @i, @i);
        SET @i += 1;
    END

    SET @i = 1;

    -- feria_personas_charla
    WHILE @i <= 1000
    BEGIN
        INSERT INTO feria_personas.feria_personas_charla
        (id_charla, nombre)
        VALUES (@i, CONCAT('Charla ', @i));
        SET @i += 1;
    END

    SET @i = 1;

    -- feria_personas_demostracion
    WHILE @i <= 1000
    BEGIN
        INSERT INTO feria_personas.feria_personas_demostracion
        (id_demostracion, nombre)
        VALUES (@i, CONCAT('Demostración ', @i));
        SET @i += 1;
    END

    SET @i = 1;

    -- feria_empresarial_responsables
    WHILE @i <= 1000
    BEGIN
        INSERT INTO feria_empresarial.feria_empresarial_responsables
        (id_responsable, id_producto, id_persona)
        VALUES (@i, @i, @i);
        SET @i += 1;
    END

    SET @i = 1;

    -- feria_personas_registro
    WHILE @i <= 1000
    BEGIN
        INSERT INTO feria_personas.feria_personas_registro
        (id_registro, id_charla, id_demostracion, id_empresa, id_feria, id_ponente, id_visitante)
        VALUES (@i, @i, @i, @i, @i, @i, @i);
        SET @i += 1;
    END

END
GO

EXEC dbo.pr_poblar_feria;
