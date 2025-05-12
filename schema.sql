CREATE TABLE ELECTOR (
  dni VARCHAR(20) PRIMARY KEY,
  nombre VARCHAR(50),
  apellido VARCHAR(50),
  fecha_nacimiento DATE,
  direccion VARCHAR(100)
);

CREATE TABLE CENTRO_VOTACION (
  id_centro VARCHAR(20) PRIMARY KEY,
  nombre VARCHAR(50),
  direccion VARCHAR(100)
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
  patente VARCHAR(20),
  dni VARCHAR(20),
  FOREIGN KEY (dni) REFERENCES RESPONSABLE(dni)
);

CREATE TABLE CENTRO_CAMIONETA (
  id_centro VARCHAR(20),
  id_camioneta VARCHAR(20),
  PRIMARY KEY (id_centro, id_camioneta),
  FOREIGN KEY (id_centro) REFERENCES CENTRO_VOTACION(id_centro),
  FOREIGN KEY (id_camioneta) REFERENCES CAMIONETA(id_camioneta)
);

CREATE TABLE INTEGRANTE (
  dni VARCHAR(20) PRIMARY KEY,
  nombre VARCHAR(50),
  apellido VARCHAR(50)
);

CREATE TABLE TECNICO (
  dni VARCHAR(20) PRIMARY KEY,
  FOREIGN KEY (dni) REFERENCES INTEGRANTE(dni)
);

CREATE TABLE ELECCION (
  id_eleccion VARCHAR(20) PRIMARY KEY,
  fecha_eleccion DATE,
  estado VARCHAR(20)
);

CREATE TABLE MESA_ELECTORAL (
  id_mesa VARCHAR(20),
  id_centro VARCHAR(20),
  id_eleccion VARCHAR(20),
  tecnico_dni VARCHAR(20),
  PRIMARY KEY (id_mesa, id_centro, id_eleccion),
  FOREIGN KEY (id_centro) REFERENCES CENTRO_VOTACION(id_centro),
  FOREIGN KEY (id_eleccion) REFERENCES ELECCION(id_eleccion),
  FOREIGN KEY (tecnico_dni) REFERENCES TECNICO(dni)
);

CREATE TABLE PADRON_ELECCION (
  dni_elector VARCHAR(20),
  id_eleccion VARCHAR(20),
  id_mesa VARCHAR(20),
  centro_votacion VARCHAR(20),
  si_voto BOOLEAN,
  PRIMARY KEY (dni_elector, id_eleccion),
  FOREIGN KEY (dni_elector) REFERENCES ELECTOR(dni),
  FOREIGN KEY (id_eleccion) REFERENCES ELECCION(id_eleccion),
  FOREIGN KEY (id_mesa, centro_votacion, id_eleccion) REFERENCES MESA_ELECTORAL(id_mesa, id_centro, id_eleccion)
);

CREATE TABLE PRESIDENTE (
  dni VARCHAR(20) PRIMARY KEY,
  id_mesa VARCHAR(20),
  FOREIGN KEY (dni) REFERENCES INTEGRANTE(dni)
);

CREATE TABLE VICEPRESIDENTE (
  dni VARCHAR(20) PRIMARY KEY,
  id_mesa VARCHAR(20),
  FOREIGN KEY (dni) REFERENCES INTEGRANTE(dni)
);

CREATE TABLE SUPLENTE (
  dni VARCHAR(20) PRIMARY KEY,
  id_mesa VARCHAR(20),
  FOREIGN KEY (dni) REFERENCES INTEGRANTE(dni)
);

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
  fecha_hora TIMESTAMP,
  PRIMARY KEY (num_voto, id_eleccion),
  FOREIGN KEY (id_eleccion) REFERENCES ELECCION(id_eleccion),
  FOREIGN KEY (id_mesa, id_centro, id_eleccion) REFERENCES MESA_ELECTORAL(id_mesa, id_centro, id_eleccion),
  FOREIGN KEY (numero_serie) REFERENCES MAQUINA_VOTOS(numero_serie)
);

CREATE TABLE VOTO_CONSULTA_POPULAR (
  num_voto VARCHAR(20),
  id_eleccion VARCHAR(20),
  PRIMARY KEY (num_voto, id_eleccion),
  FOREIGN KEY (num_voto, id_eleccion) REFERENCES VOTO(num_voto, id_eleccion)
);

CREATE TABLE VOTO_ELECCION_LEGISLATIVA (
  num_voto VARCHAR(20),
  id_eleccion VARCHAR(20),
  PRIMARY KEY (num_voto, id_eleccion),
  FOREIGN KEY (num_voto, id_eleccion) REFERENCES VOTO(num_voto, id_eleccion)
);


CREATE TABLE OPCION_RESPUESTA (
  id_opcion VARCHAR(20) PRIMARY KEY,
  respuesta VARCHAR(100)
);

CREATE TABLE VOTO_CONSULTA_OPCION (
  num_voto VARCHAR(20),
  id_eleccion VARCHAR(20),
  id_opcion VARCHAR(20),
  PRIMARY KEY (num_voto, id_eleccion),
  FOREIGN KEY (num_voto, id_eleccion) REFERENCES VOTO(num_voto, id_eleccion),
  FOREIGN KEY (id_opcion) REFERENCES OPCION_RESPUESTA(id_opcion)
);

CREATE TABLE VOTO_ELECCION_CANDIDATO (
  num_voto VARCHAR(20),
  id_eleccion VARCHAR(20),
  id_politico VARCHAR(20),
  cargo VARCHAR(50),
  PRIMARY KEY (num_voto, id_eleccion),
  FOREIGN KEY (num_voto, id_eleccion) REFERENCES VOTO(num_voto, id_eleccion),
  FOREIGN KEY (id_politico) REFERENCES POLITICO(id_candidato)
);
