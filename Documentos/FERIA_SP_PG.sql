DROP DATABASE feria_sp WITH (FORCE);
CREATE DATABASE feria_sp;



CREATE OR REPLACE PROCEDURE pr_crear_tablas()
LANGUAGE plpgsql
AS $$
BEGIN
  
    CREATE SCHEMA IF NOT EXISTS feria_estructura;
    CREATE SCHEMA IF NOT EXISTS feria_empresarial;
    CREATE SCHEMA IF NOT EXISTS feria_personas;

    DROP TABLE IF EXISTS feria_personas.registro       CASCADE;
    DROP TABLE IF EXISTS feria_personas.demostracion   CASCADE;
    DROP TABLE IF EXISTS feria_personas.charla         CASCADE;
    DROP TABLE IF EXISTS feria_personas.visitante      CASCADE;
    DROP TABLE IF EXISTS feria_personas.tipo_entrada   CASCADE;
    DROP TABLE IF EXISTS feria_personas.ponente        CASCADE;
    DROP TABLE IF EXISTS feria_empresarial.responsables CASCADE;
    DROP TABLE IF EXISTS feria_empresarial.productos   CASCADE;
    DROP TABLE IF EXISTS feria_empresarial.stands      CASCADE;
    DROP TABLE IF EXISTS feria_empresarial.empresas    CASCADE;
    DROP TABLE IF EXISTS feria_estructura.pabellon     CASCADE;
    DROP TABLE IF EXISTS feria_estructura.tema         CASCADE;
    DROP TABLE IF EXISTS feria_estructura.feria        CASCADE;
    DROP TABLE IF EXISTS feria_personas.persona        CASCADE;

    ------------------------------------------------------------
    -- 2️⃣ Crear tablas: feria_estructura
    ------------------------------------------------------------
    CREATE TABLE feria_estructura.feria(
        id_feria SERIAL PRIMARY KEY,
        nombre VARCHAR(100) NOT NULL,
        fecha_inicio DATE NOT NULL,
        fecha_fin DATE NOT NULL
    );

    CREATE TABLE feria_estructura.tema(
        id_tema SERIAL PRIMARY KEY,
        tema VARCHAR(100) NOT NULL
    );

    CREATE TABLE feria_estructura.pabellon(
        id_pabellon SERIAL PRIMARY KEY,
        nombre VARCHAR(100) NOT NULL,
        tematica VARCHAR(100) NOT NULL,
        capacidad INT NOT NULL,
        id_feria INT REFERENCES feria_estructura.feria(id_feria),
        id_tema  INT REFERENCES feria_estructura.tema(id_tema)
    );

  
    CREATE TABLE feria_empresarial.empresas(
        id_empresa SERIAL PRIMARY KEY,
        nombre VARCHAR(100) NOT NULL
    );

    CREATE TABLE feria_empresarial.stands(
        id_stand SERIAL PRIMARY KEY,
        numero INT NOT NULL,
        nombre VARCHAR(100) NOT NULL,
        id_empresa INT REFERENCES feria_empresarial.empresas(id_empresa),
        id_pabellon INT REFERENCES feria_estructura.pabellon(id_pabellon)
    );

    CREATE TABLE feria_empresarial.productos(
        id_producto SERIAL PRIMARY KEY,
        nombre VARCHAR(100) NOT NULL,
        descripcion TEXT,
        id_stand INT REFERENCES feria_empresarial.stands(id_stand)
    );

    CREATE TABLE feria_empresarial.responsables(
        id_responsable SERIAL PRIMARY KEY,
        id_producto INT REFERENCES feria_empresarial.productos(id_producto),
        id_persona  INT
    );

    ------------------------------------------------------------
    -- 4️⃣ Crear tablas: feria_personas
    ------------------------------------------------------------
    CREATE TABLE feria_personas.persona(
        id_persona SERIAL PRIMARY KEY,
        nombre VARCHAR(100) NOT NULL
    );

    CREATE TABLE feria_personas.ponente(
        id_ponente SERIAL PRIMARY KEY,
        id_persona INT REFERENCES feria_personas.persona(id_persona)
    );

    CREATE TABLE feria_personas.tipo_entrada(
        id_tipo_entrada SERIAL PRIMARY KEY,
        tipo_entrada VARCHAR(100)
    );

    CREATE TABLE feria_personas.visitante(
        id_visitante SERIAL PRIMARY KEY,
        id_persona INT REFERENCES feria_personas.persona(id_persona),
        id_tipo_entrada INT REFERENCES feria_personas.tipo_entrada(id_tipo_entrada)
    );

    CREATE TABLE feria_personas.charla(
        id_charla SERIAL PRIMARY KEY,
        nombre VARCHAR(100)
    );

    CREATE TABLE feria_personas.demostracion(
        id_demostracion SERIAL PRIMARY KEY,
        nombre VARCHAR(100)
    );

    CREATE TABLE feria_personas.registro(
        id_registro SERIAL PRIMARY KEY,
        id_charla INT REFERENCES feria_personas.charla(id_charla),
        id_demostracion INT REFERENCES feria_personas.demostracion(id_demostracion),
        id_empresa INT REFERENCES feria_empresarial.empresas(id_empresa),
        id_feria INT REFERENCES feria_estructura.feria(id_feria),
        id_ponente INT REFERENCES feria_personas.ponente(id_ponente),
        id_visitante INT REFERENCES feria_personas.visitante(id_visitante)
    );

    ------------------------------------------------------------
    -- 🔹 Relaciones faltantes (con persona)
    ------------------------------------------------------------
    ALTER TABLE feria_empresarial.responsables
        ADD CONSTRAINT fk_resp_persona
        FOREIGN KEY (id_persona)
        REFERENCES feria_personas.persona(id_persona);

END;
$$;

-- Ejecutar el procedimiento
CALL pr_crear_tablas();


CREATE OR REPLACE PROCEDURE pr_insertar_datos(p_n INT DEFAULT 1000, mode TEXT DEFAULT 'reset')
LANGUAGE plpgsql
AS $$
DECLARE
    i INT; base INT; id INT;
BEGIN
    IF lower(mode)='reset' THEN
        DELETE FROM feria_personas.registro;
        DELETE FROM feria_personas.demostracion;
        DELETE FROM feria_personas.charla;
        DELETE FROM feria_personas.visitante;
        DELETE FROM feria_personas.tipo_entrada;
        DELETE FROM feria_personas.ponente;
        DELETE FROM feria_empresarial.responsables;
        DELETE FROM feria_empresarial.productos;
        DELETE FROM feria_empresarial.stands;
        DELETE FROM feria_empresarial.empresas;
        DELETE FROM feria_estructura.pabellon;
        DELETE FROM feria_estructura.tema;
        DELETE FROM feria_estructura.feria;
        DELETE FROM feria_personas.persona;
        base := 1;
    ELSE
        SELECT 1 + GREATEST(
            COALESCE((SELECT MAX(id_feria)       FROM feria_estructura.feria),0),
            COALESCE((SELECT MAX(id_tema)        FROM feria_estructura.tema),0),
            COALESCE((SELECT MAX(id_pabellon)    FROM feria_estructura.pabellon),0),
            COALESCE((SELECT MAX(id_empresa)     FROM feria_empresarial.empresas),0),
            COALESCE((SELECT MAX(id_stand)       FROM feria_empresarial.stands),0),
            COALESCE((SELECT MAX(id_producto)    FROM feria_empresarial.productos),0),
            COALESCE((SELECT MAX(id_persona)     FROM feria_personas.persona),0),
            COALESCE((SELECT MAX(id_responsable) FROM feria_empresarial.responsables),0),
            COALESCE((SELECT MAX(id_ponente)     FROM feria_personas.ponente),0),
            COALESCE((SELECT MAX(id_tipo_entrada)FROM feria_personas.tipo_entrada),0),
            COALESCE((SELECT MAX(id_visitante)   FROM feria_personas.visitante),0),
            COALESCE((SELECT MAX(id_charla)      FROM feria_personas.charla),0),
            COALESCE((SELECT MAX(id_demostracion)FROM feria_personas.demostracion),0),
            COALESCE((SELECT MAX(id_registro)    FROM feria_personas.registro),0)
        ) INTO base;
    END IF;

    FOR i IN 1..p_n LOOP
        id := base + i - 1;
        INSERT INTO feria_estructura.feria(id_feria,nombre,fecha_inicio,fecha_fin)
        VALUES (id,'Feria '||id, DATE '2025-01-01'+(id||' days')::interval, DATE '2025-01-06'+(id||' days')::interval);
    END LOOP;

    FOR i IN 1..p_n LOOP
        id := base + i - 1;
        INSERT INTO feria_estructura.tema(id_tema,tema) VALUES (id,'Tema '||id);
    END LOOP;

    FOR i IN 1..p_n LOOP
        id := base + i - 1;
        INSERT INTO feria_empresarial.empresas(id_empresa,nombre) VALUES (id,'Empresa '||id);
    END LOOP;

    FOR i IN 1..p_n LOOP
        id := base + i - 1;
        INSERT INTO feria_personas.persona(id_persona,nombre) VALUES (id,'Persona '||id);
    END LOOP;

    FOR i IN 1..p_n LOOP
        id := base + i - 1;
        INSERT INTO feria_estructura.pabellon(id_pabellon,nombre,tematica,capacidad,id_feria,id_tema)
        VALUES (id,'Pabellon '||id,'Tematica '||id,100+id,id,id);
    END LOOP;

    FOR i IN 1..p_n LOOP
        id := base + i - 1;
        INSERT INTO feria_empresarial.stands(id_stand,numero,nombre,id_empresa,id_pabellon)
        VALUES (id,id,'Stand '||id,id,id);
    END LOOP;

    FOR i IN 1..p_n LOOP
        id := base + i - 1;
        INSERT INTO feria_empresarial.productos(id_producto,nombre,descripcion,id_stand)
        VALUES (id,'Producto '||id,'Descripcion '||id,id);
    END LOOP;

    FOR i IN 1..p_n LOOP
        id := base + i - 1;
        INSERT INTO feria_personas.ponente(id_ponente,id_persona) VALUES (id,id);
    END LOOP;

    FOR i IN 1..p_n LOOP
        id := base + i - 1;
        INSERT INTO feria_personas.tipo_entrada(id_tipo_entrada,tipo_entrada) VALUES (id,'Tipo '||id);
    END LOOP;

    FOR i IN 1..p_n LOOP
        id := base + i - 1;
        INSERT INTO feria_personas.visitante(id_visitante,id_persona,id_tipo_entrada) VALUES (id,id,id);
    END LOOP;

    FOR i IN 1..p_n LOOP
        id := base + i - 1;
        INSERT INTO feria_personas.charla(id_charla,nombre) VALUES (id,'Charla '||id);
    END LOOP;

    FOR i IN 1..p_n LOOP
        id := base + i - 1;
        INSERT INTO feria_personas.demostracion(id_demostracion,nombre) VALUES (id,'Demostracion '||id);
    END LOOP;

    FOR i IN 1..p_n LOOP
        id := base + i - 1;
        INSERT INTO feria_empresarial.responsables(id_responsable,id_producto,id_persona) VALUES (id,id,id);
    END LOOP;

    FOR i IN 1..p_n LOOP
        id := base + i - 1;
        INSERT INTO feria_personas.registro(id_registro,id_charla,id_demostracion,id_empresa,id_feria,id_ponente,id_visitante)
        VALUES (id,id,id,id,id,id,id);
    END LOOP;
END;
$$;

-- Ejecuta
CALL pr_insertar_datos(1000,'reset');



CREATE LOGIN login_adminFeria   WITH PASSWORD = 'admin',     CHECK_POLICY = OFF;
CREATE LOGIN login_estructura   WITH PASSWORD = 'estructura', CHECK_POLICY = OFF;
CREATE LOGIN login_empresarial  WITH PASSWORD = 'empresarial', CHECK_POLICY = OFF;
CREATE LOGIN login_persona      WITH PASSWORD = 'persona',  CHECK_POLICY = OFF;
GO

CREATE USER user_adminFeria   FOR LOGIN login_adminFeria;
CREATE USER user_estructura   FOR LOGIN login_estructura;
CREATE USER user_empresarial  FOR LOGIN login_empresarial;
CREATE USER user_persona      FOR LOGIN login_persona;
GO

GRANT CONTROL ON SCHEMA::feria_estructura  TO user_adminFeria;
GRANT CONTROL ON SCHEMA::feria_empresarial TO user_adminFeria;
GRANT CONTROL ON SCHEMA::feria_personas    TO user_adminFeria;
GO

GRANT SELECT, INSERT, UPDATE, DELETE ON SCHEMA::feria_estructura TO user_estructura;
GO

GRANT SELECT, INSERT, UPDATE, DELETE ON SCHEMA::feria_empresarial TO user_empresarial;
GO

GRANT SELECT, INSERT, UPDATE, DELETE ON SCHEMA::feria_personas TO user_persona;
GO
}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}


