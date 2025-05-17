CREATE TABLE ELECTOR (
  dni VARCHAR(20) PRIMARY KEY,
  nombre VARCHAR(50),
  apellido VARCHAR(50),
  fecha_nacimiento DATE,
  calle VARCHAR(100),
  altura INTEGER,
  provincia VARCHAR(50),
  codigo_postal VARCHAR(50)
);

CREATE TABLE MAQUINA_VOTOS (
  numero_serie VARCHAR(30) PRIMARY KEY,
  info_hardware VARCHAR(100),
  info_software VARCHAR(100)
);

CREATE TABLE CENTRO_VOTACION (
  id_centro VARCHAR(20) PRIMARY KEY,
  nombre VARCHAR(50),
  calle VARCHAR(100),
  altura INTEGER,
  provincia VARCHAR(50),
  codigo_postal VARCHAR(50)
);

CREATE TABLE RESPONSABLE (
  dni VARCHAR(20) PRIMARY KEY,
  nombre VARCHAR(50),
  apellido VARCHAR(50)
);

CREATE TABLE CAMIONETA (
  id_camioneta VARCHAR(20) PRIMARY KEY,
  marca VARCHAR(50),
  modelo VARCHAR(50),
  patente VARCHAR(20)
);

CREATE table CAMIONETA_RESPONSABLE(
id_camioneta VARCHAR(20),
dni_responsable VARCHAR(20),
PRIMARY KEY (id_camioneta,dni_responsable),
FOREIGN KEY (id_camioneta) REFERENCES CAMIONETA(id_camioneta),
FOREIGN KEY (dni_responsable) REFERENCES RESPONSABLE(dni)

);

CREATE TABLE ELECCION (
  id_eleccion VARCHAR(20) PRIMARY KEY,
  fecha_eleccion DATE,
  territorio VARCHAR(20) 
);

CREATE TABLE CAMIONETA_CENTRO_ELECCION (
  id_camioneta VARCHAR(20),
  id_eleccion VARCHAR(20),
  id_centro VARCHAR(20),

  PRIMARY KEY (id_camioneta, id_eleccion),

  FOREIGN KEY (id_camioneta) REFERENCES CAMIONETA(id_camioneta),
  FOREIGN KEY (id_eleccion) REFERENCES ELECCION(id_eleccion),
  FOREIGN KEY (id_centro) REFERENCES CENTRO_VOTACION(id_centro)
);


CREATE TABLE INTEGRANTE (
  dni VARCHAR(20) PRIMARY KEY,
  nombre VARCHAR(50),
  apellido VARCHAR(50)
);

CREATE TABLE TECNICO (
  dni VARCHAR(20) PRIMARY KEY,
  nivel_experiencia VARCHAR(20),
  FOREIGN KEY (dni) REFERENCES INTEGRANTE(dni)
);

CREATE TABLE PRESIDENTE (
  dni VARCHAR(20) PRIMARY KEY,
  FOREIGN KEY (dni) REFERENCES INTEGRANTE(dni)
);


CREATE TABLE VICEPRESIDENTE (
  dni VARCHAR(20) PRIMARY KEY,
  FOREIGN KEY (dni) REFERENCES INTEGRANTE(dni)
);

CREATE TABLE SUPLENTE (
  dni VARCHAR(20) PRIMARY KEY,
  FOREIGN KEY (dni) REFERENCES INTEGRANTE(dni)
);



CREATE TABLE MESA_ELECTORAL (
  id_mesa VARCHAR(20),
  id_centro VARCHAR(20),
  id_eleccion VARCHAR(20),
  dni_tecnico VARCHAR(20) NOT NULL,
  dni_vicepresidente VARCHAR(20) NOT NULL,
  dni_presidente VARCHAR(20) NOT NULL,
  dni_suplente VARCHAR(20) NOT NULL,
  PRIMARY KEY (id_mesa, id_centro, id_eleccion),
  FOREIGN KEY (id_centro) REFERENCES CENTRO_VOTACION(id_centro),
  FOREIGN KEY (id_eleccion) REFERENCES ELECCION(id_eleccion),
  FOREIGN KEY (dni_tecnico) REFERENCES TECNICO(dni),
  FOREIGN KEY (dni_vicepresidente) REFERENCES VICEPRESIDENTE(dni),
  FOREIGN KEY (dni_presidente) REFERENCES PRESIDENTE(dni),
  FOREIGN KEY (dni_suplente) REFERENCES SUPLENTE(dni)
);

CREATE TABLE MESA_UTILIZA_MAQUINA (
  id_mesa VARCHAR(20),
  id_centro VARCHAR(20),
  id_eleccion VARCHAR(20),
  numero_serie VARCHAR(30),

  PRIMARY KEY (id_mesa, id_centro, id_eleccion, numero_serie),

  FOREIGN KEY (id_mesa, id_centro, id_eleccion)
    REFERENCES MESA_ELECTORAL(id_mesa, id_centro, id_eleccion),

  FOREIGN KEY (numero_serie)
    REFERENCES MAQUINA_VOTOS(numero_serie)
);


CREATE TABLE PADRON_ELECCION ( 
  dni_elector VARCHAR(20),
  id_eleccion VARCHAR(20),
  id_mesa VARCHAR(20),
  id_centro VARCHAR(20),
  si_voto BOOLEAN,

  PRIMARY KEY (dni_elector, id_eleccion), -- Aca se usa restricción semántica propia del dominio del problema(chat) que es que un elector puede solo puede estar asignado a una única mesa en una elección, entocned no necesitas las 4 PK's para armar la PK 
  -- restricción de unicidad por elección, muy importnatne aclarar esto porque osea si pones como PK las 4 PK's completa permitis que un elecor este asociado a mas d euan emsa por eleccion. 
  FOREIGN KEY (dni_elector) REFERENCES ELECTOR(dni),
  FOREIGN KEY (id_eleccion) REFERENCES ELECCION(id_eleccion),
  FOREIGN KEY (id_mesa, id_centro, id_eleccion) REFERENCES MESA_ELECTORAL(id_mesa, id_centro, id_eleccion)
);
--Forzas que el votante aparezca una unica vez por eleccion 




CREATE TABLE FISCAL (
  dni VARCHAR(20) PRIMARY KEY,
  FOREIGN KEY (dni) REFERENCES INTEGRANTE(dni)
);

CREATE TABLE MESA_FISCAL (
  dni_fiscal VARCHAR(20),
  id_mesa VARCHAR(20),
  id_centro VARCHAR(20),
  id_eleccion VARCHAR(20),
  PRIMARY KEY (dni_fiscal, id_mesa, id_centro, id_eleccion),
  FOREIGN KEY (dni_fiscal) REFERENCES FISCAL(dni),
  FOREIGN KEY (id_mesa, id_centro, id_eleccion) REFERENCES MESA_ELECTORAL(id_mesa, id_centro, id_eleccion)
);


CREATE TABLE PARTIDO_POLITICO (
  id_partido VARCHAR(20) PRIMARY KEY,
  nombre VARCHAR(50)
);

CREATE TABLE FISCAL_PARTIDO (
  dni_fiscal VARCHAR(20),
  id_partido VARCHAR(20),
  PRIMARY KEY (dni_fiscal, id_partido),
  FOREIGN KEY (dni_fiscal) REFERENCES FISCAL(dni),
  FOREIGN KEY (id_partido) REFERENCES PARTIDO_POLITICO(id_partido)
);

CREATE TABLE POLITICO (
  id_candidato VARCHAR(20) PRIMARY KEY,
  nombre VARCHAR(50),
  apellido VARCHAR(50)
);

CREATE TABLE ELECCION_LEGISLATIVA (
  id_eleccion VARCHAR(20) PRIMARY KEY,
  cargo VARCHAR(50),
  FOREIGN KEY (id_eleccion) REFERENCES ELECCION(id_eleccion)
);

CREATE TABLE CONSULTA_POPULAR (
  id_eleccion VARCHAR(20) PRIMARY KEY,
  pregunta TEXT,
  FOREIGN KEY (id_eleccion) REFERENCES ELECCION(id_eleccion)
);

CREATE TABLE POLITICO_PARTICIPA (
  id_politico VARCHAR(20),
  id_eleccion VARCHAR(20),
  PRIMARY KEY (id_politico, id_eleccion),
  FOREIGN KEY (id_politico) REFERENCES POLITICO(id_candidato),
  FOREIGN KEY (id_eleccion) REFERENCES ELECCION_LEGISLATIVA(id_eleccion)
);

CREATE TABLE POLITICO_ELECCION_PERTENECE_PARTIDO (
  id_politico VARCHAR(20),
  id_eleccion VARCHAR(20),
  id_partido VARCHAR(20),
  PRIMARY KEY (id_politico, id_eleccion),
  FOREIGN KEY (id_politico, id_eleccion) REFERENCES POLITICO_PARTICIPA(id_politico, id_eleccion),
  FOREIGN KEY (id_partido) REFERENCES PARTIDO_POLITICO(id_partido)
);


CREATE TABLE VOTO (
  num_voto VARCHAR(20),
  id_eleccion VARCHAR(20),
  id_mesa VARCHAR(20),
  numero_serie VARCHAR(30),
  id_centro VARCHAR(20),
  ts TIMESTAMP,
  PRIMARY KEY (num_voto, id_eleccion),
  FOREIGN KEY (id_mesa, id_centro, id_eleccion,numero_serie) REFERENCES MESA_UTILIZA_MAQUINA(id_mesa, id_centro, id_eleccion,numero_serie)
);

CREATE TABLE VOTO_ELECCION_LEGISLATIVA (
  num_voto VARCHAR(20),
  id_eleccion VARCHAR(20),
  PRIMARY KEY (num_voto, id_eleccion),
  FOREIGN KEY (num_voto, id_eleccion) REFERENCES VOTO(num_voto, id_eleccion)
);

CREATE TABLE VOTO_CONSULTA_POPULAR (
  num_voto VARCHAR(20),
  id_eleccion VARCHAR(20),
  PRIMARY KEY (num_voto, id_eleccion),
  FOREIGN KEY (num_voto, id_eleccion) REFERENCES VOTO(num_voto, id_eleccion)
);

CREATE TABLE OPCION_RESPUESTA (
  id_opcion VARCHAR(20) PRIMARY KEY,
  respuesta VARCHAR(100)
);

CREATE TABLE VOTO_ELIJE_OPCION_RESPUESTA (
  num_voto VARCHAR(20),
  id_eleccion VARCHAR(20),
  id_opcion VARCHAR(20),
  PRIMARY KEY (num_voto, id_eleccion),
  FOREIGN KEY (num_voto, id_eleccion) REFERENCES VOTO_CONSULTA_POPULAR(num_voto, id_eleccion),
  FOREIGN KEY (id_opcion) REFERENCES OPCION_RESPUESTA(id_opcion)
);

CREATE TABLE CP_TIENE_OPCION_RESPUESTA (
  id_eleccion VARCHAR(20),
  id_opcion VARCHAR(20),
  PRIMARY KEY (id_eleccion, id_opcion),
  FOREIGN KEY (id_opcion) REFERENCES OPCION_RESPUESTA(id_opcion),
  FOREIGN KEY (id_eleccion) REFERENCES CONSULTA_POPULAR(id_eleccion)
);


CREATE TABLE VOTO_ELECCION_CANDIDATO (
  num_voto VARCHAR(20),
  id_eleccion VARCHAR(20),
  id_politico VARCHAR(20),
  PRIMARY KEY (num_voto, id_eleccion),
  FOREIGN KEY (num_voto, id_eleccion) REFERENCES VOTO_ELECCION_LEGISLATIVA(num_voto, id_eleccion),
  FOREIGN KEY (id_politico) REFERENCES POLITICO(id_candidato)
);



-- Caso que queramos borrar todas las tablas para reiniciar

/*
DROP TABLE IF EXISTS 
  CP_TIENE_OPCION_RESPUESTA,
  VOTO_ELECCION_CANDIDATO,
  VOTO_ELIJE_OPCION_RESPUESTA,
  VOTO_ELECCION_LEGISLATIVA,
  VOTO_CONSULTA_POPULAR,
  VOTO,
  OPCION_RESPUESTA,
  POLITICO_ELECCION_PERTENECE_PARTIDO,
  POLITICO_PARTICIPA,
  CONSULTA_POPULAR,
  ELECCION_LEGISLATIVA,
  PARTIDO_POLITICO,
  PADRON_ELECCION,
  FISCAL_PARTIDO,
  MESA_FISCAL,
  FISCAL,
  SUPLENTE,
  PRESIDENTE,
  VICEPRESIDENTE,
  TECNICO,
  MESA_UTILIZA_MAQUINA,
  MESA_ELECTORAL,
  MAQUINA_VOTOS,
  INTEGRANTE,
  CAMIONETA_CENTRO_ELECCION,
  CAMIONETA_RESPONSABLE,
  CAMIONETA,
  RESPONSABLE,
  CENTRO_VOTACION,
  POLITICO,
  ELECCION,
  ELECTOR
CASCADE;
*/

