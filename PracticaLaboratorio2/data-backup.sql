-- -----------------------------------------------------
-- Data for table `AdminViviendas`.`Provincias`
-- -----------------------------------------------------
START TRANSACTION;
USE `AdminViviendas`;
INSERT INTO `AdminViviendas`.`Provincias` (`codigoProvincia`, `nombre`) VALUES 
    ('6122326HHH', 'Valladolid'),
    ('7245675RTY', 'Segovia');

COMMIT;


-- -----------------------------------------------------
-- Data for table `AdminViviendas`.`Municipios`
-- -----------------------------------------------------
START TRANSACTION;
USE `AdminViviendas`;
INSERT INTO `AdminViviendas`.`Municipios` (`idMunicipio`, `nombre`, `area`, `codigoProvincia`) VALUES
	('40063', 'Cuellar', 348.66, '7245675RTY'),
	('47075', 'Iscar', 60.5, '6122326HHH'),
	('47122', 'Portillo', 64.42, '6122326HHH'),
	('47076', 'Laguna de duero', 33.5, '6122326HHH'),
	('47023', 'Boecillo', 77.5, '6122326HHH'),
	('40004', 'Aguilafuente', 66.3, '7245675RTY'),
	('47005', 'Alcazarén', 82.5, '6122326HHH'),
	('47030', 'Campaspero', 50.3, '6122326HHH'),
	('47063', 'Fompedraza', 49, '6122326HHH'),
	('47067', 'Fuente el sol', 33.9, '6122326HHH'),
	('47082', 'Matapozuelos', 66.2, '6122326HHH'),
	('40001', 'Abades', 31.98, '7245675RTY'),
	('40013', 'Aldeasoña', 18.67, '7245675RTY'),
	('40020', 'Arcones', 31.75, '7245675RTY'),
	('40041', 'Cantimpalos', 26.90, '7245675RTY'),
	('40161', 'Carabias', 25.86, '7245675RTY'),
	('40043', 'Carbonero el Mayor', 66.35, '7245675RTY'),
	('40076', 'El Espinar', 205.10, '7245675RTY'),
	('40086', 'Fuentepelayo', 30.90, '7245675RTY'),
	('40093', 'Gallegos', 21.80, '7245675RTY'),
	('40131', 'Monterrubio', 25.54, '7245675RTY'),
	('40134', 'Mozoncillo', 42.74, '7245675RTY'),
	('40003', 'Adrados', 18.19, '7245675RTY'),
	('40109', 'Languilla', 26.66, '7245675RTY'),
	('40110', 'Lastras de Cuellar', 65.42, '7245675RTY'),
	('40200', 'Valladolid', 554.6, '6122326HHH'),
	('40300', 'Segovia', 74.1, '7245675RTY');

COMMIT;


-- -----------------------------------------------------
-- Data for table `AdminViviendas`.`Barrios`
-- -----------------------------------------------------
START TRANSACTION;
USE `AdminViviendas`;
INSERT INTO `AdminViviendas`.`Barrios` (`idBarrios`, `nombre`, `area`, `coord`, `zipCode`, `avgM2price`, `idMunicipio`) VALUES 
	('7500', 'Brujas', 45.6, '15.64842,24.12847', 40100, 1000, '40063'),
	('7501', 'Caballeros', 18.2, '15.84621,24.51743', 40300, 1200, '40063'),
	('7502', 'Las Canonjías', 47.3, '15.65784,21.35486', 40200, 1300, '40063'),
	('7503', 'Parquesol', 29.5, '17.24854,19.25847', 47100, 1500, '47075'),
	('7504', 'La Rondilla', 13.3, '17.36548,25.15487', 47200, 900, '47122'),
	('7505', 'Covaresa', 18.4, '19.35487,54.21584', 47300, 1200, '47076'),
	('7506', 'Caballeros', 35.5, '40.949430,-4.119209	', 40001, 800, '47023'),
	('7507', 'Judería', 42, '44.923261,-4.923226', 40002, 500, '40004'),
	('7508', 'San Millán', 20, '41.322418,-3.651515', 40003, 1200, '47005'),
	('7509', 'El Salvador', 23.5, '43.051551,-6.651056', 40004, 1150, '40131'),
	('7510', 'San Marcos', 28.8, '35.215121,-4.551815', 40005, 1450, '40200');

COMMIT;


-- -----------------------------------------------------
-- Data for table `AdminViviendas`.`Propietarios`
-- -----------------------------------------------------
START TRANSACTION;
USE `AdminViviendas`;
INSERT INTO `AdminViviendas`.`Propietarios` (`dni`, `nombre`, `apellidos`, `calle`, `num`, `piso`) VALUES
	('73793158G', 'Pedro', 'Ramiro López', 'Avenida Martin Lopez', 5, '3 F'),
	('71297004V', 'Jaime', 'Pérez Miranda', 'Calle Camilo José Cela', 7, '4 D'),
	('62269663S', 'Raúl', 'Migua Otero', 'Calle Arcediano Gomez', 23, '2 C'),
	('44892211Y', 'Carla', 'Verdugo Velasco', 'Calle Viejo Cuartel', 11, '3 B'),
	('41679701K', 'Juana', 'Cruz Madrigal', 'Calle del colegio', 10, '1 B'),
	('60758270K', 'Laura', 'Velasco Lorenzo', 'Calle Antigua enfermeria', 5, '1 E'),
	('81139896J', 'Martín', 'Bravo Velasco ', 'Calle estrella', 4, '2 E'),
	('19655225T', 'Oscar', 'Llorente Luengo', 'Calle de la luna', 7, '2 D'),
	('94328497T', 'Anabel', 'Verdugo Madrigal', 'Calle El Calvario', 18, '3 C'),
	('20039032Y', 'Lorenzo', 'West Garcia', 'Calle la Resina', 13, '4 E'),
	('59408410P', 'Juan', 'Senovilla Laporte', 'Avenida Salamanca', 19, '2 A'),
	('59804933B', 'Juanjo', 'Casillas Sevilla', 'Calle Topacio', 28, '1 A'),
	('23310054Z', 'Abril', 'Madrid Suarez', 'Calle Ramón Martín', 1, '1 E'),
	('50445509T', 'Maria', 'Pascual Garcia', 'Calle Urraca', 14, '3 D'),
	('64105041Q', 'Marcos', 'Garcia Galicia', 'Avenida Gamazo', 15, '4 A');

COMMIT;


-- -----------------------------------------------------
-- Data for table `AdminViviendas`.`Viviendas`
-- -----------------------------------------------------
START TRANSACTION;
USE `AdminViviendas`;
INSERT INTO `AdminViviendas`.`Viviendas` (`nºCatastro`, `calle`, `num`, `piso`, `m2`, `precioTasacion`, `idBarrios`, `dni`) VALUES 
	('9872023 VH5797S 0001 WX', 'Calle Luna', 7, '1 A', 200, 200000, '7500', '73793158G'),
	('9666525 RR5168T 8541 GG', 'Calle Lorenzo Gonzalez', 2, '2 A', 60, 120500, '7501', '73793158G'),
	('9112515 SC5184F 9952 FR', 'Avda. Camilo Sexto', 5, NULL, 400, 450000, '7503', '73793158G'),
	('9001259 ZE7812S 2288 YY', 'Calle El Caldero', 12, '2 C', 90, 250000, '7502', '20039032Y'),
	('9110254 WS448O 3354 QW', 'Avda. Don Calero Martinez', 10, '2 B', 95, 220500, '7505', '41679701K'),
	('7445852 LP8524O 1119 ZX', 'Calle Sésamo Bravo', 11, '2 A', 83, 150000, '7504', '71297004V'),
	('7445852 HG2591T 0202 VN', 'Avda. Paco Casado', 3, '1 C', 350, 330000, '7507', '59804933B'),
	('8956211 VB6518F 0025 VV', 'Calle El Portal ', 15, NULL, 523, 452500, '7509', '20039032Y'),
	('1888254 CF4511R 9955 NB', 'Calle El Jorobado Danés', 10, '2 B', 122, 192300, '7510', '23310054Z'),
	('2255255 CC8858Y 0110 SA', 'Avda. Zapataria ', 11, '3 B', 162, 126850, '7509', '73793158G'),
	('2255877 ZZ9523J 7751 MN', 'Avda. Punta Cuntera', 5, '5 A', 63, 115300, '7505', '44892211Y'),
	('9522624 YP4525P 0005 KK', 'Avda. La Sevillana Marena', 2, '1 D', 80, 175300, '7506', '94328497T'),
	('1388754 CX8466H 0666 PO', 'Avda. Palencia', 1, '1 A', 107, 107640, '7510', '64105041Q');

COMMIT;


-- -----------------------------------------------------
-- Data for table `AdminViviendas`.`Impuestos`
-- -----------------------------------------------------
START TRANSACTION;
USE `AdminViviendas`;
INSERT INTO `AdminViviendas`.`Impuestos` (`fechaInico`, `fechaVencimiento`, `importe`, `fechaActualPago`, `idViviendas`, `dni`) VALUES 
	('2018-10-17', '2018-12-26', 300, '2018-11-02', 1, '73793158G'),
	('2018-08-11', '2018-11-22', 562.25, '2018-10-15', 2, '73793158G'),
	('2018-09-19', '2018-12-25', 956.32, '2018-11-12', 3, '73793158G'),
	('2018-08-25', '2018-10-21', 200.65, '2018-09-05', 4, '20039032Y'),
	('2018-11-29', '2019-01-17', 201.90, '2018-12-26', 5, '41679701K'),
	('2018-07-02', '2018-09-12', 362.15, '2018-08-29', 6, '71297004V'),
	('2018-02-15', '2018-05-13', 253.02, '2018-02-28', 7, '59804933B'),
	('2018-04-18', '2018-06-26', 426.332, '2018-05-08', 8, '20039032Y'),
	('2018-01-30', '2018-03-11', 481.30, NULL, 9, '23310054Z'),
	('2018-10-22', '2019-02-02', 305.9, '2018-02-01', 10, '73793158G'),
	('2018-12-15', '2019-03-29', 557.5, NULL, 12, '94328497T');

COMMIT;


-- -----------------------------------------------------
-- Data for table `AdminViviendas`.`Ocupantes`
-- -----------------------------------------------------
START TRANSACTION;
USE `AdminViviendas`;
INSERT INTO `AdminViviendas`.`Ocupantes` (`dni`, `nombre`, `apellidos`, `fNac`, `idViviendas`) VALUES 
	('74564234Q', 'Pedro', 'Alvarez Callado', '1982-12-17', 1),
	('16512788T', 'Juan', 'Perez Adrados', '1980-03-11', 2),
	('90095607S', 'Alvaro', 'Pascual Ramirez', '1975-07-15', 3),
	('20911089H', 'Carmen', 'Ruiz De la fuente', '1939-11-02', 4),
	('04915024Q', 'Raquel', 'Alberas Aizaga', '1973-12-01', 5),
	('72692306R', 'Miguel', 'Encinas Escalante', '1976-02-22', 6),
	('69790544B', 'Irene', 'Martinez Contreras', '1989-06-27', 7),
	('71860541P', 'Imma', 'Baptista Escalero', '1992-12-30', 9),
	('64105041Q', 'Carmen', 'Menosa Escudero', '1924-11-21', 10),
	('25613098E', 'Lauren', 'Green Jones', '1970-09-12', 11),
	('68496613Z', 'Rafael', 'Gustavson Drarksen', '1968-03-09', 11),
	('47543333U', 'Javier', 'Gutiérrez Del Río', '1938-11-15', 3);

COMMIT;
