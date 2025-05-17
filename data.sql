
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
('1010', 'Diego', 'Herrera', '1988-04-18', 'Corrientes', 654, 'Neuquén', '8300'),
('1020', 'Martina', 'Gómez', '1992-04-15', 'Av. Mitre', 321, 'Buenos Aires', '1870'),
('1021', 'Luciano', 'Martínez', '1987-06-21', 'Rivadavia', 4550, 'Buenos Aires', '1406'),
('1022', 'Julieta', 'Herrera', '1995-12-02', 'San Martín', 220, 'Buenos Aires', '1704'),
('1023', 'Iván', 'Romero', '1975-10-19', 'Moreno', 1340, 'Buenos Aires', '1744'),
('1024', 'Micaela', 'Arias', '1990-08-11', 'Eva Perón', 890, 'Buenos Aires', '1888'),
('1025', 'Franco', 'Sosa', '1988-02-03', 'Alsina', 1120, 'Buenos Aires', '1214'),
('1026', 'Camila', 'Quiroga', '2000-09-30', 'Florencio Varela', 1030, 'Buenos Aires', '1884'),
('1027', 'Agustín', 'Delgado', '1996-01-14', 'General Paz', 975, 'Buenos Aires', '1602'),
('1028', 'Valeria', 'Moreno', '1993-05-25', 'Hipólito Yrigoyen', 150, 'Buenos Aires', '1248'),
('1029', 'Ezequiel', 'Peralta', '1985-07-18', 'Ituzaingó', 721, 'Buenos Aires', '1714'),
('1030', 'Ignacio', 'Perez',           '1995-06-01', 'Av. Rivadavia', '1234', 'Buenos Aires', '1000'),
('1031', 'Pablo',   'Picolli',         '1994-07-15', 'Calle Mitre',   '456',  'Buenos Aires', '1001'),
('1032', 'Anahi',   'Hojnadel',        '1996-02-20', 'Calle Salta',   '789',  'Buenos Aires',      '5000'),
('1033', 'Camila',  'Migdal',          '1998-12-05', 'Calle Tucumán', '321',  'Buenos Aires',      '5500'),
('1034', 'Valentina','De Diego',       '1997-08-10', 'Calle Santa Fe','654',  'Buenos Aires',     '3000'),
('1035', 'Olivier', 'Saint Nom',       '1995-09-22', 'Calle Belgrano','777',  'Buenos Aires', '1002'),
('1036', 'Tomas',   'Cobian Morales',  '1999-01-30', 'Calle Lavalle', '888',  'Buenos Aires', '1003');




INSERT INTO ELECCION VALUES 
('E01', '2023-10-22', 'Argentina'),
('E02','2025-05-18','Buenos Aires'),
('E03','2025-05-16','Buenos Aires');



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
('9110', 'Noelia', 'Domínguez'),
('9201', 'Brenda', 'López'),
('9202', 'Leonel', 'Castro'),
('9203', 'Milagros', 'Fernández'),
('9204', 'Ignacio', 'Paredes'),
('9205', 'Carolina', 'Vega'),
('9206', 'Emiliano', 'Gutiérrez'),
('9207', 'Florencia', 'Moreno'),
('9208', 'Julián', 'Aguirre'),
('9209', 'Rocío', 'Navarro'),
('9210', 'Matías', 'Ojeda')

;

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
('CAM10', 'RAM',       '1500',      'BCD010'),
('CAM11', 'Mercedes-Benz', 'X-Class',     'EXA111'),
('CAM12', 'Hyundai',       'Santa Cruz',  'EXA112'),
('CAM13', 'Mitsubishi',    'L200',        'EXA113'),
('CAM14', 'Honda',         'Ridgeline',   'EXA114'),
('CAM15', 'Chevrolet',     'Colorado',    'EXA115'),
('CAM16', 'GMC',           'Canyon',      'EXA116'),
('CAM17', 'Isuzu',         'D-Max',       'EXA117'),
('CAM18', 'Tata',          'Xenon',       'EXA118'),
('CAM19', 'Great Wall',    'Wingle 7',    'EXA119'),
('CAM20', 'Mahindra',      'Scorpio PikUp','EXA120');


;


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
('CAM10', '9110'),
('CAM11', '9201'),
('CAM12', '9202'),
('CAM13', '9203'),
('CAM14', '9204'),
('CAM15', '9205'),
('CAM16', '9206'),
('CAM17', '9207'),
('CAM18', '9208'),
('CAM19', '9209'),
('CAM20', '9210');





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
('C10', 'Centro Educativo Neuquén', 'Av. Argentina', 600, 'Neuquén', '8300'),
('C11', 'Escuela Secundaria N°21',     'Av. Belgrano',      1250, 'Buenos Aires', '1872'),
('C12', 'Instituto General San Martín','Calle San Juan',     930, 'Buenos Aires', '1880'),
('C13', 'Escuela Técnica N°3',         'Av. Mitre',         3012, 'Buenos Aires', '1874'),
('C14', 'Colegio Almafuerte',          'Av. 25 de Mayo',     765, 'Buenos Aires', '1882'),
('C15', 'Escuela Primaria N°14',       'Lavalle',            422, 'Buenos Aires', '1868'),
('C16', 'Centro Educativo N°7',        'Hipólito Yrigoyen', 1044, 'Buenos Aires', '1876'),
('C17', 'Escuela Media N°18',          'Juan B. Justo',      888, 'Buenos Aires', '1890'),
('C18', 'Escuela Técnica N°1',         'Alvear',            1502, 'Buenos Aires', '1866'),
('C19', 'Instituto Mariano Moreno',    'Av. Eva Perón',     1111, 'Buenos Aires', '1878'),
('C20', 'Escuela N°31',                'Av. Roca',           700, 'Buenos Aires', '1886')

;


INSERT INTO CAMIONETA_CENTRO_ELECCION values
--Eleccion 1
('CAM1',  'E01', 'C1'),
('CAM2',  'E01', 'C2'),
('CAM3',  'E01', 'C3'),
('CAM4',  'E01', 'C4'),
('CAM5',  'E01', 'C5'),
('CAM6',  'E01', 'C6'),
('CAM7',  'E01', 'C7'),
('CAM8',  'E01', 'C8'),
('CAM9',  'E01', 'C9'),
('CAM10', 'E01', 'C10'),
--Eleccion 2
('CAM11', 'E02', 'C11'),
('CAM12', 'E02', 'C12'),
('CAM13', 'E02', 'C13'),
('CAM14', 'E02', 'C14'),
('CAM15', 'E02', 'C15'),
('CAM16', 'E02', 'C16'),
('CAM17', 'E02', 'C17'),
('CAM18', 'E02', 'C18'),
('CAM19', 'E02', 'C19'),
('CAM20', 'E02', 'C20'),
--Eleccion 3
('CAM1', 'E03', 'C11'),
('CAM6', 'E03', 'C12'),
('CAM14', 'E03', 'C13');

/*
DELETE FROM CAMIONETA_CENTRO_ELECCION
WHERE id_eleccion = 'E02'
  AND id_camioneta IN (
    'CAM11', 'CAM12', 'CAM13', 'CAM14', 'CAM15',
    'CAM16', 'CAM17', 'CAM18', 'CAM19', 'CAM20'
  );

INSERT INTO CAMIONETA_CENTRO_ELECCION VALUES
('CAM1',  'E02', 'C11'),
('CAM2',  'E02', 'C12'),
('CAM3',  'E02', 'C13'),
('CAM4',  'E02', 'C14'),
('CAM5',  'E02', 'C15'),
('CAM6',  'E02', 'C16'),
('CAM7',  'E02', 'C17'),
('CAM8',  'E02', 'C18'),
('CAM9',  'E02', 'C19'),
('CAM10', 'E02', 'C20')
;
*/



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
('4011', 'Ramiro', 'Cáceres'),
('4012', 'Cintia', 'Maldonado'),
('4013', 'Leandro', 'Herrera'),
('4014', 'Lucía', 'Paz'),
('4015', 'Emilio', 'Serrano'),
('4016', 'Paula', 'Benítez'),
('4017', 'Tomás', 'Valdez'),
('4018', 'Milena', 'Coronel'),
('4019', 'Gabriel', 'Domínguez'),
('4020', 'Julieta', 'Aguirre'),
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
('5011', 'Bruno', 'López'),
('5012', 'Agustina', 'Vega'),
('5013', 'Ignacio', 'Romano'),
('5014', 'Selena', 'Martínez'),
('5015', 'Carlos', 'Alonso'),
('5016', 'Débora', 'Ibarra'),
('5017', 'Esteban', 'Núñez'),
('5018', 'Rocío', 'Ferreyra'),
('5019', 'Lautaro', 'Toledo'),
('5020', 'Florencia', 'Silva'),
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
('6011', 'Marina', 'Ponce'),
('6012', 'Juan', 'Salazar'),
('6013', 'Nadia', 'Bravo'),
('6014', 'Alan', 'Moyano'),
('6015', 'Virginia', 'Quiroga'),
('6016', 'Facundo', 'Cruz'),
('6017', 'Camila', 'Sosa'),
('6018', 'Tobías', 'Ortiz'),
('6019', 'Antonella', 'Barrios'),
('6020', 'Valentín', 'Ríos'),
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
('7011', 'Sol', 'Navarrete'),
('7012', 'Santiago', 'Meza'),
('7013', 'Bárbara', 'Arias'),
('7014', 'Kevin', 'Peralta'),
('7015', 'Magalí', 'Godoy'),
('7016', 'Benjamín', 'Almada'),
('7017', 'Ayelén', 'Ramos'),
('7018', 'Joaquín', 'Gómez'),
('7019', 'Micaela', 'Carrizo'),
('7020', 'Gonzalo', 'Luna'),
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
('8010', 'Nicolás', 'Reyes'),
('8011', 'Brenda', 'Acosta'),
('8012', 'Emanuel', 'Gallardo'),
('8013', 'Melina', 'Escudero'),
('8014', 'Franco', 'Paredes'),
('8015', 'Ailén', 'Morales'),
('8016', 'Damián', 'Ojeda'),
('8017', 'Zaira', 'Mendoza'),
('8018', 'Ángel', 'Villar'),
('8019', 'Tamara', 'Sánchez'),
('8020', 'Lucas', 'Iglesias')

;

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
('4010', 'Media'),
('4011', 'Alta'),
('4012', 'Media'),
('4013', 'Alta'),
('4014', 'Media'),
('4015', 'Baja'),
('4016', 'Alta'),
('4017', 'Media'),
('4018', 'Alta'),
('4019', 'Media'),
('4020', 'Baja')

;



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
('5010'),
('5011'),
('5012'),
('5013'),
('5014'),
('5015'),
('5016'),
('5017'),
('5018'),
('5019'),
('5020')
;


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
('6010'),
('6011'),
('6012'),
('6013'),
('6014'),
('6015'),
('6016'),
('6017'),
('6018'),
('6019'),
('6020')
;



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
('7010'),
('7011'),
('7012'),
('7013'),
('7014'),
('7015'),
('7016'),
('7017'),
('7018'),
('7019'),
('7020')

;


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
('M10', 'C10', 'E01', '4010', '5010', '6010', '7010'),
--Eleccion 2 
('M11', 'C11', 'E02', '4011', '5011', '6011', '7011'),
('M12', 'C12', 'E02', '4012', '5012', '6012', '7012'),
('M13', 'C13', 'E02', '4013', '5013', '6013', '7013'),
('M14', 'C14', 'E02', '4014', '5014', '6014', '7014'),
('M15', 'C15', 'E02', '4015', '5015', '6015', '7015'),
('M16', 'C16', 'E02', '4016', '5016', '6016', '7016'),
('M17', 'C17', 'E02', '4017', '5017', '6017', '7017'),
('M18', 'C18', 'E02', '4018', '5018', '6018', '7018'),
('M19', 'C19', 'E02', '4019', '5019', '6019', '7019'),
('M20', 'C20', 'E02', '4020', '5020', '6020', '7020'),
--Eleccion 3 
('M1', 'C11', 'E03', '4001', '5001', '6001', '7001'),
('M2', 'C12', 'E03', '4006', '5006', '6006', '7006'),
('M1', 'C13', 'E03', '4015', '5015', '6015', '7015')


;


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
('MX010-J0', 'HW: CompactVote Mini, ARM Cortex-A7', 'SW: VoteLight 1.5 - checksum: j0k1l2'),
('MX011-K1', 'HW: CivicVote X3, Cortex-A78 3GB', 'SW: VoteSecureOS v4.0.0 - checksum: k1l2m3'),
('MX012-L2', 'HW: SmartTab Elite, ARM A76 4GB',   'SW: VoteOS 3.5.1 - checksum: l2m3n4')
;


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
('M10', 'C10', 'E01', 'MX010-J0'),
--Eleccion 2 
('M11', 'C11', 'E02', 'MX001-A1'),
('M12', 'C12', 'E02', 'MX002-B2'),
('M13', 'C13', 'E02', 'MX003-C3'),
('M14', 'C14', 'E02', 'MX004-D4'),
('M15', 'C15', 'E02', 'MX005-E5'),
('M16', 'C16', 'E02', 'MX006-F6'),
('M17', 'C17', 'E02', 'MX007-G7'),
('M18', 'C18', 'E02', 'MX008-H8'),
('M19', 'C19', 'E02', 'MX011-K1'),  
('M20', 'C20', 'E02', 'MX012-L2'),
--Eleccion 3 
('M1', 'C11', 'E03', 'MX002-B2'),
('M2', 'C12', 'E03', 'MX005-E5'),
('M1', 'C13', 'E03', 'MX009-I9')

; 




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
('8010'),
('8011'),
('8012'),
('8013'),
('8014'),
('8015'),
('8016'),
('8017'),
('8018'),
('8019'),
('8020')
;

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
('8010', 'M10', 'C10', 'E01'),
--Eleccion 2 
('8011', 'M11', 'C11', 'E02'),
('8012', 'M12', 'C12', 'E02'),
('8013', 'M13', 'C13', 'E02'),
('8014', 'M14', 'C14', 'E02'),
('8015', 'M15', 'C15', 'E02'),
('8016', 'M16', 'C16', 'E02'),
('8017', 'M17', 'C17', 'E02'),
('8018', 'M18', 'C18', 'E02'),
('8019', 'M19', 'C19', 'E02'),
('8020', 'M20', 'C20', 'E02')

;



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
('8010', 'PA5'),
('8011', 'PA1'),
('8012', 'PA1'),
('8013', 'PA2'),
('8014', 'PA2'),
('8015', 'PA3'),
('8016', 'PA3'),
('8017', 'PA4'),
('8018', 'PA4'),
('8019', 'PA5'),
('8020', 'PA5')
;


INSERT INTO PADRON_ELECCION VALUES
('1001', 'E01', 'M1',  'C1',  TRUE),
('1002', 'E01', 'M2',  'C2',  FALSE),
('1003', 'E01', 'M3',  'C3',  TRUE),
('1004', 'E01', 'M4',  'C4',  TRUE),
('1005', 'E01', 'M5',  'C5',  TRUE),
('1006', 'E01', 'M6',  'C6',  TRUE),
('1007', 'E01', 'M7',  'C7',  TRUE),
('1008', 'E01', 'M8',  'C8',  FALSE),
('1009', 'E01', 'M9',  'C9',  TRUE),
('1010', 'E01', 'M10', 'C10', TRUE),
('1020', 'E02', 'M11', 'C11', FALSE),
('1021', 'E02', 'M12', 'C12', TRUE),
('1022', 'E02', 'M13', 'C13', FALSE),
('1023', 'E02', 'M14', 'C14', TRUE),
('1024', 'E02', 'M15', 'C15', TRUE),
('1025', 'E02', 'M16', 'C16', FALSE),
('1026', 'E02', 'M17', 'C17', TRUE),
('1027', 'E02', 'M18', 'C18', FALSE),
('1028', 'E02', 'M19', 'C19', TRUE),
('1029', 'E02', 'M20', 'C20', TRUE),
('1030', 'E03', 'M1', 'C11', TRUE),
('1031', 'E03', 'M2', 'C12', TRUE),
('1032', 'E03', 'M2', 'C12', TRUE),
('1033', 'E03', 'M1', 'C13', TRUE),
('1034', 'E03', 'M1', 'C11', TRUE),
('1035', 'E03', 'M1', 'C11', TRUE),
('1036', 'E03', 'M1', 'C13', TRUE)

;


--Politico 

INSERT INTO POLITICO VALUES
('9001', 'Ricardo', 'Alfonsín'),      -- Unión Cívica Radical (PA1)
('9002', 'Sergio', 'Massa'),          -- Partido Justicialista (PA2)
('9003', 'Patricia', 'Bullrich'),     -- PRO (PA3)
('9004', 'Axel', 'Kicillof'),         -- Frente de Todos (PA4)
('9005', 'Javier', 'Milei'),
('9006', 'Leandro', 'Santoro'),
('9007', 'Manuel', 'Adorni'),
('9008', 'Horacio', 'Rodríguez Larreta'),
('9009', 'Lucille', 'Levy'),
('9010', 'Alejandro', 'Kim')

;          -- La Libertad Avanza (PA5)


--Eleccion legislativa 
INSERT INTO ELECCION_LEGISLATIVA VALUES 
('E01','Presidente'),
('E02','Legislador');


--Consulta Popular
INSERT INTO consulta_popular  VALUES 
('E03', '¿Deberia el DER ser evaluado aparte en la materia TD7?'); 


--Politico Pariticipa Eleccion
INSERT INTO POLITICO_PARTICIPA VALUES
('9001', 'E01'),  -- Ricardo Alfonsín - Unión Cívica Radical
('9002', 'E01'),  -- Sergio Massa - Partido Justicialista
('9003', 'E01'),  -- Patricia Bullrich - PRO
('9004', 'E01'),  -- Axel Kicillof - Frente de Todos
('9005', 'E01'),
('9006', 'E02'),
('9007', 'E02'),
('9008', 'E02'),
('9009', 'E02'),
('9010', 'E02')

;  -- Javier Milei - La Libertad Avanza


-- POLITICO_ELECCION_PERTENECE_PARTIDO
INSERT INTO POLITICO_ELECCION_PERTENECE_PARTIDO VALUES
('9001', 'E01', 'PA1'),
('9002', 'E01', 'PA2'),
('9003', 'E01', 'PA3'),
('9004', 'E01', 'PA4'),
('9005', 'E01', 'PA5'),
('9006', 'E02', 'PA4'),
('9007', 'E02', 'PA5'),
('9008', 'E02', 'PA3'),
('9009', 'E02', 'PA1'),
('9010', 'E02', 'PA2')
;


-- VOTO


INSERT INTO VOTO VALUES
('V001', 'E01', 'M1',  'MX001-A1', 'C1',  '2023-10-22 08:00:00'),
('V002', 'E01', 'M2',  'MX002-B2', 'C2',  '2023-10-22 08:05:00'),
('V003', 'E01', 'M3',  'MX003-C3', 'C3',  '2023-10-22 08:10:00'),
('V004', 'E01', 'M4',  'MX004-D4', 'C4',  '2023-10-22 08:15:00'),
('V005', 'E01', 'M5',  'MX005-E5', 'C5',  '2023-10-22 08:20:00'),
('V006', 'E01', 'M6',  'MX006-F6', 'C6',  '2023-10-22 08:25:00'),
('V007', 'E01', 'M7',  'MX007-G7', 'C7',  '2023-10-22 08:30:00'),
('V008', 'E01', 'M8',  'MX008-H8', 'C8',  '2023-10-22 08:35:00'),
('V001', 'E02', 'M11', 'MX001-A1',  'C11', '2025-05-18 09:00:00'),
('V002', 'E02', 'M12', 'MX002-B2',  'C12', '2025-05-18 09:02:00'),
('V003', 'E02', 'M13', 'MX003-C3',  'C13', '2025-05-18 09:04:00'),
('V004', 'E02', 'M14', 'MX004-D4',  'C14', '2025-05-18 09:06:00'),
('V005', 'E02', 'M15', 'MX005-E5',  'C15', '2025-05-18 09:08:00'),
('V006', 'E02', 'M16', 'MX006-F6',  'C16', '2025-05-18 09:10:00'),
('V001', 'E03', 'M1',  'MX001-A1', 'C11',  '2025-05-16 08:00:00'),
('V002', 'E03', 'M2',  'MX002-B2', 'C12',  '2025-05-16 08:05:00'),
('V003', 'E03', 'M2',  'MX003-C3', 'C12',  '2025-05-16 08:10:00'),
('V004', 'E03', 'M1',  'MX004-D4', 'C13',  '2025-05-16 08:15:00'),
('V005', 'E03', 'M1',  'MX005-E5', 'C11',  '2025-05-16 08:20:00'),
('V006', 'E03', 'M1',  'MX006-F6', 'C11',  '2025-05-16 08:25:00'),
('V007', 'E03', 'M1',  'MX007-G7', 'C13',  '2025-05-16 08:30:00')
;

-- VOTO_CONSULTA_POPULAR
INSERT INTO VOTO_CONSULTA_POPULAR values
('V001', 'E03'),
('V002', 'E03'),
('V003', 'E03'),
('V004', 'E03'),
('V005', 'E03'),
('V006', 'E03'),
('V007', 'E03')
;

INSERT INTO OPCION_RESPUESTA VALUES ('OP1', 'Estoy de acuerdo'), ('OP2', 'No estoy de acuerdo');

INSERT INTO VOTO_ELIJE_OPCION_RESPUESTA values
('V001', 'E03','OP2'),
('V002', 'E03','OP2'),
('V003', 'E03','OP2'),
('V004', 'E03','OP2'),
('V005', 'E03','OP2'),
('V006', 'E03','OP1'),
('V007', 'E03','OP2');
 
 -- CP_TIENE_OPCION_RESPUESTA
INSERT INTO CP_TIENE_OPCION_RESPUESTA VALUES 
('E03', 'OP1'),
('E03', 'OP2') ;


-- VOTO_ELECCION_LEGISLATIVA
INSERT INTO VOTO_ELECCION_LEGISLATIVA VALUES
('V001', 'E01'),
('V002', 'E01'),
('V003', 'E01'),
('V004', 'E01'),
('V005', 'E01'),
('V006', 'E01'),
('V007', 'E01'),
('V008', 'E01'),
('V001', 'E02'),
('V002', 'E02'),
('V003', 'E02'),
('V004', 'E02'),
('V005', 'E02'),
('V006', 'E02');


-- VOTO_ELECCION_CANDIDATO

INSERT INTO VOTO_ELECCION_CANDIDATO VALUES
('V001', 'E01', '9001'),
('V002', 'E01', '9002'),
('V003', 'E01', '9003'),
('V004', 'E01', '9004'),
('V005', 'E01', '9005'),
('V006', 'E01', '9001'),
('V007', 'E01', '9005'),
('V008', 'E01', '9002'),
('V001', 'E02', '9006'),
('V002', 'E02', '9007'),
('V003', 'E02', '9008'),
('V004', 'E02', '9009'),
('V005', 'E02', '9010'),
('V006', 'E02', '9006')
;


/*
 Query para eliminar voto 9 y 10 de E01
DELETE FROM VOTO_ELECCION_CANDIDATO
 WHERE id_eleccion = 'E01'
   AND num_voto    IN ('V009', 'V010');
*/