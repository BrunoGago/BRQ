-- Gerado por Oracle SQL Developer Data Modeler 21.4.1.349.1605
--   em:        2022-10-05 09:44:48 BRT
--   site:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE t_bairro (
    cd_bairro          CHAR(2) NOT NULL,
    nm_bairro          VARCHAR2(32) NOT NULL,
    t_cidade_cd_cidade CHAR(2) NOT NULL
);

ALTER TABLE t_bairro ADD CONSTRAINT t_bairro_pk PRIMARY KEY ( cd_bairro );

CREATE TABLE t_camera (
    video                  BLOB NOT NULL,
    t_telefone_nr_telefone VARCHAR2(13) NOT NULL
);

ALTER TABLE t_camera ADD CONSTRAINT t_camera_pk PRIMARY KEY ( t_telefone_nr_telefone );

CREATE TABLE t_cidade (
    cd_cidade          CHAR(2) NOT NULL,
    nm_cidade          VARCHAR2(32) NOT NULL,
    t_estado_cd_estado CHAR(2 CHAR) NOT NULL
);

ALTER TABLE t_cidade ADD CONSTRAINT t_cidade_pk PRIMARY KEY ( cd_cidade );

CREATE TABLE t_endereco (
    nr_cep                     VARCHAR2(8 CHAR) NOT NULL,
    t_bairro_cd_bairro         CHAR(2) NOT NULL,
    t_multimidia_nm_serie      VARCHAR2(32) NOT NULL,
    cd_logradouro              CHAR(2) NOT NULL,
    t_logradouro_cd_logradouro CHAR(2) NOT NULL
);

CREATE UNIQUE INDEX t_endreco__idx ON
    t_endereco (
        t_multimidia_nm_serie
    ASC );

ALTER TABLE t_endereco ADD CONSTRAINT t_endreco_pk PRIMARY KEY ( nr_cep );

CREATE TABLE t_estado (
    cd_estado CHAR(2 CHAR) NOT NULL,
    nm_estado VARCHAR2(32) NOT NULL,
    sg_estado CHAR(2) NOT NULL
);

ALTER TABLE t_estado ADD CONSTRAINT t_estado_pk PRIMARY KEY ( cd_estado );

CREATE TABLE t_gps (
    estacao            CHAR(2 CHAR) NOT NULL,
    tipo_estacao       CHAR(3 CHAR) NOT NULL,
    tema               CHAR(2 CHAR) NOT NULL,
    uf                 CHAR(2 CHAR) NOT NULL,
    municipio          VARCHAR2(30 CHAR) NOT NULL,
    geocpdigo          NUMBER NOT NULL,
    latitude_longitude VARCHAR2(60 CHAR) NOT NULL,
    fonte_coord        VARCHAR2(30) NOT NULL,
    datum_plan         VARCHAR2(30) NOT NULL
);

ALTER TABLE t_gps ADD CONSTRAINT t_gps_pk PRIMARY KEY ( latitude_longitude );

CREATE TABLE t_logradouro (
    cd_logradouro CHAR(2) NOT NULL,
    ds_logradouro VARCHAR2(32)
);

ALTER TABLE t_logradouro ADD CONSTRAINT t_logradouro_pk PRIMARY KEY ( cd_logradouro );

CREATE TABLE t_mensagens (
    cd_mensagem            CHAR(2) NOT NULL,
    t_telefone_nr_telefone VARCHAR2(13) NOT NULL,
    ds_mensagem            VARCHAR2(50) NOT NULL
);

ALTER TABLE t_mensagens ADD CONSTRAINT t_mensagens_pk PRIMARY KEY ( cd_mensagem,
                                                                    t_telefone_nr_telefone );

CREATE TABLE t_multimidia (
    nm_serie VARCHAR2(32) NOT NULL
);

ALTER TABLE t_multimidia ADD CONSTRAINT t_multimidia_pk PRIMARY KEY ( nm_serie );

CREATE TABLE t_telefone (
    nr_telefone                 VARCHAR2(13) NOT NULL,
    nr_ddd                      CHAR(3 CHAR) NOT NULL,
    nr_ramal                    CHAR(3),
    nr_ddi                      CHAR(3) NOT NULL,
    t_tipo_telefone_cd_telefone CHAR(1) NOT NULL,
    t_gps_latitude_longitude    VARCHAR2(60 CHAR) NOT NULL,
    t_multimidia_nm_serie       VARCHAR2(32) NOT NULL
);

CREATE UNIQUE INDEX t_telefone__idx ON
    t_telefone (
        t_gps_latitude_longitude
    ASC );

ALTER TABLE t_telefone ADD CONSTRAINT t_telefone_pk PRIMARY KEY ( nr_telefone );

CREATE TABLE t_tipo_telefone (
    cd_telefone CHAR(1) NOT NULL,
    ds_telefone VARCHAR2(20)
);

ALTER TABLE t_tipo_telefone ADD CONSTRAINT t_tipo_telefone_pk PRIMARY KEY ( cd_telefone );

ALTER TABLE t_bairro
    ADD CONSTRAINT t_bairro_t_cidade_fk FOREIGN KEY ( t_cidade_cd_cidade )
        REFERENCES t_cidade ( cd_cidade );

ALTER TABLE t_camera
    ADD CONSTRAINT t_camera_t_telefone_fk FOREIGN KEY ( t_telefone_nr_telefone )
        REFERENCES t_telefone ( nr_telefone );

ALTER TABLE t_cidade
    ADD CONSTRAINT t_cidade_t_estado_fk FOREIGN KEY ( t_estado_cd_estado )
        REFERENCES t_estado ( cd_estado );

ALTER TABLE t_endereco
    ADD CONSTRAINT t_endereco_t_bairro_fk FOREIGN KEY ( t_bairro_cd_bairro )
        REFERENCES t_bairro ( cd_bairro );

ALTER TABLE t_endereco
    ADD CONSTRAINT t_endereco_t_multimidia_fk FOREIGN KEY ( t_multimidia_nm_serie )
        REFERENCES t_multimidia ( nm_serie );

ALTER TABLE t_endereco
    ADD CONSTRAINT t_endreco_t_tipo_logradouro_fk FOREIGN KEY ( t_logradouro_cd_logradouro )
        REFERENCES t_logradouro ( cd_logradouro );

ALTER TABLE t_mensagens
    ADD CONSTRAINT t_mensagens_t_telefone_fk FOREIGN KEY ( t_telefone_nr_telefone )
        REFERENCES t_telefone ( nr_telefone );

ALTER TABLE t_telefone
    ADD CONSTRAINT t_telefone_t_gps_fk FOREIGN KEY ( t_gps_latitude_longitude )
        REFERENCES t_gps ( latitude_longitude );

ALTER TABLE t_telefone
    ADD CONSTRAINT t_telefone_t_multimidia_fk FOREIGN KEY ( t_multimidia_nm_serie )
        REFERENCES t_multimidia ( nm_serie );

ALTER TABLE t_telefone
    ADD CONSTRAINT t_telefone_t_tipo_telefone_fk FOREIGN KEY ( t_tipo_telefone_cd_telefone )
        REFERENCES t_tipo_telefone ( cd_telefone );



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            11
-- CREATE INDEX                             2
-- ALTER TABLE                             21
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
