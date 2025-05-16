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

CREATE TABLE ELECCION (
  id_eleccion VARCHAR(20) PRIMARY KEY,
  fecha_eleccion DATE,
  territorio VARCHAR(20) 
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
  centro_votacion VARCHAR(20),
  si_voto BOOLEAN,
  PRIMARY KEY (dni_elector, id_eleccion), -- Aca se usa restricción semántica propia del dominio del problema(chat) que es que un elector puede solo puede estar asignado a una única mesa en una elección, entocned no necesitas las 4 PK's para armar la PK 
  -- restricción de unicidad por elección, muy importnatne aclarar esto porque osea si pones como PK las 4 PK's completa permitis que un elecor este asociado a mas d euan emsa por eleccion. 
  FOREIGN KEY (dni_elector) REFERENCES ELECTOR(dni),
  FOREIGN KEY (id_eleccion) REFERENCES ELECCION(id_eleccion),
  FOREIGN KEY (id_mesa, centro_votacion, id_eleccion) REFERENCES MESA_ELECTORAL(id_mesa, id_centro, id_eleccion)
);
--Forzas que el votante aparezca una unica vez por eleccion 


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
  PRIMARY KEY (num_voto, id_eleccion),
  FOREIGN KEY (num_voto, id_eleccion) REFERENCES VOTO(num_voto, id_eleccion),
  FOREIGN KEY (id_politico) REFERENCES POLITICO(id_candidato)
);

CREATE TABLE VOTO_ELECCION_CP (
  id_opcion VARCHAR(20),
  id_eleccion VARCHAR(20),
  PRIMARY KEY (id_opcion, id_eleccion),
  FOREIGN KEY (id_opcion) REFERENCES OPCION_RESPUESTA(id_opcion),
  FOREIGN KEY (id_eleccion) REFERENCES CONSULTA_POPULAR(id_eleccion)
);


-- Comenzamos a insertados datos artificiales a nuestras tablas


INSERT INTO ELECTOR values
('1001', 'Ana', 'Pérez', '1990-05-12', 'Calle Falsa', 123, 'Buenos Aires', '1000'),
('1002', 'Luis', 'Gómez', '1985-08-23', 'Av. Siempre Viva', 742, 'Buenos Aires', '1001'),
('1003', 'María', 'Fernández', '1997-03-15', 'Mitre', 456, 'Córdoba', '5000'),
('1004', 'Javier', 'Sánchez', '1982-11-09', 'San Martín', 1122, 'Mendoza', '5500'),
('1005', 'Lucía', 'Torres', '1994-06-30', '9 de Julio', 334, 'Santa Fe', '3000'),
('1006', 'Carlos', 'Ramírez', '1979-02-27', 'Belgrano', 890, 'Buenos Aires', '1405'),
('1007', 'Paula', 'Díaz', '2000-08-12', 'Lavalle', 100, 'Salta', '4400'),
('1008', 'Federico', 'López', '1991-12-01', 'Independencia', 200, 'Tucumán', '4000'),
('1009', 'Sofía', 'Morales', '1993-09-07', 'Rivadavia', 777, 'Entre Ríos', '3100'),
('1010', 'Diego', 'Herrera', '1988-04-18', 'Corrientes', 654, 'Neuquén', '8300');

INSERT INTO ELECCION VALUES ('E01', '2023-10-22', 'Argentina');

INSERT INTO RESPONSABLE VALUES
('9101', 'Ariel', 'Ponce'),
('9102', 'Romina', 'Cruz'),
('9103', 'Mauricio', 'Acuña'),
('9104', 'Celeste', 'Bermúdez'),
('9105', 'Ramiro', 'Maldonado'),
('9106', 'Luciana', 'Benítez'),
('9107', 'Tomás', 'Rivas'),
('9108', 'Marcela', 'Correa'),
('9109', 'Federico', 'Salas'),
('9110', 'Noelia', 'Domínguez');

INSERT INTO CAMIONETA VALUES
('CAM1',  'Ford',      'Ranger',    'ABC101'),
('CAM2',  'Toyota',    'Hilux',     'DEF202'),
('CAM3',  'Chevrolet', 'S10',       'GHI303'),
('CAM4',  'Volkswagen','Amarok',    'JKL404'),
('CAM5',  'Nissan',    'Frontier',  'MNO505'),
('CAM6',  'Renault',   'Alaskan',   'PQR606'),
('CAM7',  'Fiat',      'Toro',      'STU707'),
('CAM8',  'Peugeot',   'Landtrek',  'VWX808'),
('CAM9',  'Jeep',      'Gladiator', 'YZA909'),
('CAM10', 'RAM',       '1500',      'BCD010');

INSERT INTO CAMIONETA_RESPONSABLE VALUES
('CAM1', '9101'),
('CAM2', '9102'),
('CAM3', '9103'),
('CAM4', '9104'),
('CAM5', '9105'),
('CAM6', '9106'),
('CAM7', '9107'),
('CAM8', '9108'),
('CAM9', '9109'),
('CAM10', '9110');




INSERT INTO CENTRO_VOTACION VALUES
('C1', 'Escuela Primaria N°12', 'Av. Rivadavia', 1234, 'Buenos Aires', '1000'),
('C2', 'Escuela Técnica N°5', 'Calle San Juan', 567, 'Buenos Aires', '1001'),
('C3', 'Colegio Nacional Córdoba', 'Av. Colón', 900, 'Córdoba', '5000'),
('C4', 'Escuela N°24 General San Martín', '25 de Mayo', 111, 'Mendoza', '5500'),
('C5', 'Escuela Normal Superior', 'Gral. Paz', 456, 'Santa Fe', '3000'),
('C6', 'Instituto Belgrano', 'Av. Belgrano', 789, 'Buenos Aires', '1405'),
('C7', 'Colegio Secundario Salta', 'España', 300, 'Salta', '4400'),
('C8', 'Escuela Técnica Tucumán', 'Av. Sarmiento', 455, 'Tucumán', '4000'),
('C9', 'Esc. Sec. Entre Ríos', 'Mitre', 122, 'Entre Ríos', '3100'),
('C10', 'Centro Educativo Neuquén', 'Av. Argentina', 600, 'Neuquén', '8300');


INSERT INTO CAMIONETA_CENTRO_ELECCION VALUES
('CAM1',  'E01', 'C1'),
('CAM2',  'E01', 'C2'),
('CAM3',  'E01', 'C3'),
('CAM4',  'E01', 'C4'),
('CAM5',  'E01', 'C5'),
('CAM6',  'E01', 'C6'),
('CAM7',  'E01', 'C7'),
('CAM8',  'E01', 'C8'),
('CAM9',  'E01', 'C9'),
('CAM10', 'E01', 'C10');



INSERT INTO INTEGRANTE values
--TECNICO
('4001', 'Joaquín', 'Martínez'),
('4002', 'Carla', 'Fernández'),
('4003', 'Sebastián', 'Vega'),
('4004', 'Valeria', 'Suárez'),
('4005', 'Andrés', 'Luna'),
('4006', 'Mariana', 'Paz'),
('4007', 'Esteban', 'Bravo'),
('4008', 'Florencia', 'Silva'),
('4009', 'Ramiro', 'Benítez'),
('4010', 'Cecilia', 'García'),

--Vicepresidente
('5001', 'Gabriela', 'López'),
('5002', 'Tomás', 'Ibarra'),
('5003', 'Natalia', 'Campos'),
('5004', 'Diego', 'Mendoza'),
('5005', 'Rocío', 'Giménez'),
('5006', 'Matías', 'Olivera'),
('5007', 'Julieta', 'Ramos'),
('5008', 'Leandro', 'Pereyra'),
('5009', 'Brenda', 'Castro'),
('5010', 'Agustín', 'Moreno'),
--Presidente
('6001', 'Martina', 'Ruiz'),
('6002', 'Gabriel', 'Farias'),
('6003', 'Soledad', 'Molina'),
('6004', 'Iván', 'Peralta'),
('6005', 'Camila', 'Juárez'),
('6006', 'Ezequiel', 'Soria'),
('6007', 'Milagros', 'Acosta'),
('6008', 'Lucas', 'Quinteros'),
('6009', 'Julia', 'Ortiz'),
('6010', 'Franco', 'Delgado'),
--Suplente
('7001', 'Ivana', 'González'),
('7002', 'Bruno', 'Cáceres'),
('7003', 'Lorena', 'Méndez'),
('7004', 'Nicolás', 'Agüero'),
('7005', 'Patricia', 'Vargas'),
('7006', 'Facundo', 'Leiva'),
('7007', 'Valentina', 'Bustos'),
('7008', 'Emiliano', 'Ferreyra'),
('7009', 'Daniela', 'Carrizo'),
('7010', 'Hernán', 'Muñoz'),
--Fiscal 
('8001', 'Noelia', 'Almada'),
('8002', 'Rodrigo', 'Coronel'),
('8003', 'Vanesa', 'Paredes'),
('8004', 'Santiago', 'Toledo'),
('8005', 'Verónica', 'Muñiz'),
('8006', 'Cristian', 'Lagos'),
('8007', 'Malena', 'Funes'),
('8008', 'Gustavo', 'Navarro'),
('8009', 'Daniela', 'Escobar'),
('8010', 'Nicolás', 'Reyes');

INSERT INTO TECNICO VALUES
('4001', 'Alta'),
('4002', 'Media'),
('4003', 'Alta'),
('4004', 'Baja'),
('4005', 'Media'),
('4006', 'Alta'),
('4007', 'Media'),
('4008', 'Baja'),
('4009', 'Alta'),
('4010', 'Media');



-- VICEPRESIDENTE

INSERT INTO VICEPRESIDENTE VALUES
('5001'),
('5002'),
('5003'),
('5004'),
('5005'),
('5006'),
('5007'),
('5008'),
('5009'),
('5010');


-- PRESIDENTE
INSERT INTO PRESIDENTE VALUES
('6001'),
('6002'),
('6003'),
('6004'),
('6005'),
('6006'),
('6007'),
('6008'),
('6009'),
('6010');



-- SUPLENTE
INSERT INTO SUPLENTE VALUES
('7001'),
('7002'),
('7003'),
('7004'),
('7005'),
('7006'),
('7007'),
('7008'),
('7009'),
('7010');


--Mesa electoral y Maquina de votacion



INSERT INTO MESA_ELECTORAL VALUES 
('M1', 'C1', 'E01', '4001', '5001', '6001', '7001'),
('M2', 'C2', 'E01', '4002', '5002', '6002', '7002'),
('M3', 'C3', 'E01', '4003', '5003', '6003', '7003'),
('M4', 'C4', 'E01', '4004', '5004', '6004', '7004'),
('M5', 'C5', 'E01', '4005', '5005', '6005', '7005'),
('M6', 'C6', 'E01', '4006', '5006', '6006', '7006'),
('M7', 'C7', 'E01', '4007', '5007', '6007', '7007'),
('M8', 'C8', 'E01', '4008', '5008', '6008', '7008'),
('M9', 'C9', 'E01', '4009', '5009', '6009', '7009'),
('M10', 'C10', 'E01', '4010', '5010', '6010', '7010');






INSERT INTO MAQUINA_VOTOS VALUES 
('MX001-A1', 'HW: SmartVote Model A1, ARMv7 1GB', 'SW: VoteOS 2.1.0 - checksum: a1b2c3'),
('MX002-B2', 'HW: SmartVote Model B2, ARMv8 2GB', 'SW: VoteOS 2.1.1 - checksum: b2c3d4'),
('MX003-C3', 'HW: SecureVote X1, Cortex-A53 2GB', 'SW: VoteSecure 3.0 - checksum: c3d4e5'),
('MX004-D4', 'HW: SecureVote Lite, ARMv7 1GB', 'SW: VoteSecure 3.1 - checksum: d4e5f6'),
('MX005-E5', 'HW: SmartTab Pro, ARM A72 4GB', 'SW: VoteOS 3.2.1 - checksum: e5f6g7'),
('MX006-F6', 'HW: CivicVote T1, Cortex-A55 2GB', 'SW: CivicOS 1.0 - checksum: f6g7h8'),
('MX007-G7', 'HW: CivicVote X2, ARM Cortex-A75', 'SW: CivicOS 1.1 - checksum: g7h8i9'),
('MX008-H8', 'HW: VoteBox 3000, Intel Atom', 'SW: SecureBallot v2 - checksum: h8i9j0'),
('MX009-I9', 'HW: ElectraTouch E9, AMD A4', 'SW: BallotSoft 4.0 - checksum: i9j0k1'),
('MX010-J0', 'HW: CompactVote Mini, ARM Cortex-A7', 'SW: VoteLight 1.5 - checksum: j0k1l2');


INSERT INTO MESA_UTILIZA_MAQUINA VALUES
('M1', 'C1', 'E01', 'MX001-A1'),
('M2', 'C2', 'E01', 'MX002-B2'),
('M3', 'C3', 'E01', 'MX003-C3'),
('M4', 'C4', 'E01', 'MX004-D4'),
('M5', 'C5', 'E01', 'MX005-E5'),
('M6', 'C6', 'E01', 'MX006-F6'),
('M7', 'C7', 'E01', 'MX007-G7'),
('M8', 'C8', 'E01', 'MX008-H8'),
('M9', 'C9', 'E01', 'MX009-I9'),
('M10', 'C10', 'E01', 'MX010-J0');




--FISCAL 
INSERT INTO FISCAL VALUES
('8001'),
('8002'),
('8003'),
('8004'),
('8005'),
('8006'),
('8007'),
('8008'),
('8009'),
('8010');

--Conexion mesa y fiscal 
INSERT INTO MESA_FISCAL VALUES
('8001', 'M1', 'C1', 'E01'),
('8002', 'M2', 'C2', 'E01'),
('8003', 'M3', 'C3', 'E01'),
('8004', 'M4', 'C4', 'E01'),
('8005', 'M5', 'C5', 'E01'),
('8006', 'M6', 'C6', 'E01'),
('8007', 'M7', 'C7', 'E01'),
('8008', 'M8', 'C8', 'E01'),
('8009', 'M9', 'C9', 'E01'),
('8010', 'M10', 'C10', 'E01');



--Partido politico
INSERT INTO PARTIDO_POLITICO VALUES
('PA1', 'Unión Cívica Radical'),
('PA2', 'Partido Justicialista'),
('PA3', 'PRO - Propuesta Republicana'),
('PA4', 'Frente de Todos'),
('PA5', 'La Libertad Avanza');


--Fiscal y partido 
INSERT INTO FISCAL_PARTIDO VALUES
('8001', 'PA1'),
('8002', 'PA1'),
('8003', 'PA2'),
('8004', 'PA2'),
('8005', 'PA3'),
('8006', 'PA3'),
('8007', 'PA4'),
('8008', 'PA4'),
('8009', 'PA5'),
('8010', 'PA5');


--Politico 

INSERT INTO POLITICO VALUES
('9001', 'Ricardo', 'Alfonsín'),
('9002', 'Sergio', 'Massa'),
('9003', 'Patricia', 'Bullrich'),
('9004', 'Axel', 'Kicillof'),
('9005', 'Javier', 'Milei');

-- ELECCIÓN LEGISLATIVA
INSERT INTO ELECCION_LEGISLATIVA VALUES ('E01', 'Presidente');

-- PARTICIPACIÓN DE POLÍTICOS EN LA ELECCIÓN
INSERT INTO POLITICO_PARTICIPA VALUES
('9001', 'E01'),
('9002', 'E01'),
('9003', 'E01'),
('9004', 'E01'),
('9005', 'E01');

-- POLÍTICOS PERTENECEN A PARTIDOS EN LA ELECCIÓN
INSERT INTO POLITICO_ELECCION_PERTENECE_PARTIDO VALUES
('9001', 'E01', 'PA1'),
('9002', 'E01', 'PA2'),
('9003', 'E01', 'PA3'),
('9004', 'E01', 'PA4'),
('9005', 'E01', 'PA5');

-- VOTOS REGISTRADOS
INSERT INTO VOTO VALUES
('V001', 'E01', 'M1',  'MX001-A1', 'C1',  '2023-10-22 08:00:00'),
('V002', 'E01', 'M2',  'MX002-B2', 'C2',  '2023-10-22 08:05:00'),
('V003', 'E01', 'M3',  'MX003-C3', 'C3',  '2023-10-22 08:10:00'),
('V004', 'E01', 'M4',  'MX004-D4', 'C4',  '2023-10-22 08:15:00'),
('V005', 'E01', 'M5',  'MX005-E5', 'C5',  '2023-10-22 08:20:00'),
('V006', 'E01', 'M6',  'MX006-F6', 'C6',  '2023-10-22 08:25:00'),
('V007', 'E01', 'M7',  'MX007-G7', 'C7',  '2023-10-22 08:30:00'),
('V008', 'E01', 'M8',  'MX008-H8', 'C8',  '2023-10-22 08:35:00'),
('V009', 'E01', 'M9',  'MX009-I9', 'C9',  '2023-10-22 08:40:00'),
('V010', 'E01', 'M10', 'MX010-J0', 'C10', '2023-10-22 08:45:00');

-- VOTOS LEGISLATIVOS (relación con VOTO)
INSERT INTO VOTO_ELECCION_LEGISLATIVA VALUES
('V001', 'E01'),
('V002', 'E01'),
('V003', 'E01'),
('V004', 'E01'),
('V005', 'E01'),
('V006', 'E01'),
('V007', 'E01'),
('V008', 'E01'),
-- VOTO EN BLANCO
-- ('V009', 'E01'),
-- ('V010', 'E01');
DELETE FROM VOTO_ELECCION_CANDIDATO
 WHERE id_eleccion = 'E01'
   AND num_voto    IN ('V009', 'V010');

-- OPCIONES DE RESPUESTA PARA CONSULTAS POPULARES
INSERT INTO OPCION_RESPUESTA VALUES
('OP1', 'Estoy de acuerdo'),
('OP2', 'No estoy de acuerdo'),
('OP3', 'Me abstengo');

-- VOTOS A CANDIDATOS (relación con VOTO y POLÍTICO)
INSERT INTO VOTO_ELECCION_CANDIDATO VALUES
('V001', 'E01', '9001'),
('V002', 'E01', '9002'),
('V003', 'E01', '9003'),
('V004', 'E01', '9004'),
('V005', 'E01', '9005'),
('V006', 'E01', '9001'),
('V007', 'E01', '9005'),
('V008', 'E01', '9002'),
('V009', 'E01', '9005'),
('V010', 'E01', '9005');


-- Total votos
SELECT COUNT(*) AS total_votos
FROM VOTO
where id_eleccion = 'E01';


-- cant. votos en blanco
SELECT COUNT(*) AS votos_blanco
  FROM VOTO v
  LEFT JOIN VOTO_ELECCION_CANDIDATO vc
    ON v.id_eleccion = vc.id_eleccion
   AND v.num_voto    = vc.num_voto
 WHERE v.id_eleccion = 'E01'
   AND vc.id_politico IS NULL;

-- electores que no votaron 
SELECT pe.dni_elector,
       e.nombre,
       e.apellido
  FROM PADRON_ELECCION pe
  JOIN ELECTOR e
    ON pe.dni_elector = e.dni
 WHERE pe.id_eleccion = 'E01'
   AND NOT EXISTS (
     SELECT 1
       FROM VOTO v
      WHERE v.id_eleccion = pe.id_eleccion
        AND v.num_voto    IN (
              SELECT num_voto
                FROM VOTO 
               WHERE id_eleccion = pe.id_eleccion
            )
        -- si tu VOTO tuviera FK a dni_elector, pondrías AND v.dni_elector = pe.dni_elector
   );