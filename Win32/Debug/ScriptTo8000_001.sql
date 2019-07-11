CREATE TABLE TB_DOCUMENTOSHACIENDA 
(
  ID                          INTEGER         NOT NULL PRIMARY KEY,
  IDENCABEZADO                INTEGER,
  SUCURSAL                    VARCHAR(     3)  COLLATE NONE,
  TERMINAL                    VARCHAR(     5)  COLLATE NONE,
  TIPO                        VARCHAR(     2)  COLLATE NONE,
  NUMERACION                  VARCHAR(    10)  COLLATE NONE,
  CONSECUTIVO                 VARCHAR(    20)  COLLATE NONE,
  PAIS                        VARCHAR(     3)  COLLATE NONE,
  DIA                         VARCHAR(     2)  COLLATE NONE,
  MES                         VARCHAR(     2)  COLLATE NONE,
  MYEAR                       VARCHAR(     2)  COLLATE NONE,
  IDENTIFICACION              VARCHAR(    11)  COLLATE NONE,
  SITUACION                   VARCHAR(     1)  COLLATE NONE,
  SEGURIDAD                   VARCHAR(     8)  COLLATE NONE,
  CLAVE                       VARCHAR(    50)  COLLATE NONE,
  MQR                            BLOB SUB_TYPE 1 SEGMENT SIZE 80
);
