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
	('40093', 'Gallegos de la Sierra', 21.80, '7245675RTY'),
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
-- Áreas aleatorias comprendidas entre 5 y 50 m2, coordenadas aleatorias comprendidas entre -50,-50 y 50,50, precio medio del metro
-- cuadrado aleatorio comprendido entre 500 y 2000 y el zip entre 40000 y 48000
-- -----------------------------------------------------
START TRANSACTION;
USE `AdminViviendas`;
INSERT INTO `AdminViviendas`.`Barrios` (`idBarrios`, `nombre`, `area`, `coord`, `zipCode`, `avgM2price`, `idMunicipio`) VALUES 
	('7500', 'Brujas', 						rand()*45+5, concat(format(rand()*100-50, 5), ',', format(rand()*100-50, 5)), floor(rand()*8000+40000), rand()*1500+500, '40063'),
	('7501', 'Caballeros', 					rand()*45+5, concat(format(rand()*100-50, 5), ',', format(rand()*100-50, 5)), floor(rand()*8000+40000), rand()*1500+500, '40063'),
	('7502', 'Las Canonjías', 				rand()*45+5, concat(format(rand()*100-50, 5), ',', format(rand()*100-50, 5)), floor(rand()*8000+40000), rand()*1500+500, '40063'),
	('7503', 'Parquesol', 					rand()*45+5, concat(format(rand()*100-50, 5), ',', format(rand()*100-50, 5)), floor(rand()*8000+40000), rand()*1500+500, '40200'),
	('7504', 'Rondilla', 					rand()*45+5, concat(format(rand()*100-50, 5), ',', format(rand()*100-50, 5)), floor(rand()*8000+40000), rand()*1500+500, '40200'),
	('7505', 'Covaresa', 					rand()*45+5, concat(format(rand()*100-50, 5), ',', format(rand()*100-50, 5)), floor(rand()*8000+40000), rand()*1500+500, '40200'),
	('7506', 'Abades', 						rand()*45+5, concat(format(rand()*100-50, 5), ',', format(rand()*100-50, 5)), floor(rand()*8000+40000), rand()*1500+500, '40001'),
	('7507', 'Adrados', 					rand()*45+5, concat(format(rand()*100-50, 5), ',', format(rand()*100-50, 5)), floor(rand()*8000+40000), rand()*1500+500, '40003'),
	('7508', 'Aguilafuente', 				rand()*45+5, concat(format(rand()*100-50, 5), ',', format(rand()*100-50, 5)), floor(rand()*8000+40000), rand()*1500+500, '40004'),
	('7509', 'Aldeasoña', 					rand()*45+5, concat(format(rand()*100-50, 5), ',', format(rand()*100-50, 5)), floor(rand()*8000+40000), rand()*1500+500, '40013'),
	('7510', 'Arconcillos', 				rand()*45+5, concat(format(rand()*100-50, 5), ',', format(rand()*100-50, 5)), floor(rand()*8000+40000), rand()*1500+500, '40020'),
    ('7511', 'Huerta', 						rand()*45+5, concat(format(rand()*100-50, 5), ',', format(rand()*100-50, 5)), floor(rand()*8000+40000), rand()*1500+500, '40020'),
    ('7512', 'Castillejo', 					rand()*45+5, concat(format(rand()*100-50, 5), ',', format(rand()*100-50, 5)), floor(rand()*8000+40000), rand()*1500+500, '40020'),
    ('7513', 'La Mata', 					rand()*45+5, concat(format(rand()*100-50, 5), ',', format(rand()*100-50, 5)), floor(rand()*8000+40000), rand()*1500+500, '40020'),
    ('7514', 'Colladillo', 					rand()*45+5, concat(format(rand()*100-50, 5), ',', format(rand()*100-50, 5)), floor(rand()*8000+40000), rand()*1500+500, '40020'),
    ('7515', 'Cantimpalos', 				rand()*45+5, concat(format(rand()*100-50, 5), ',', format(rand()*100-50, 5)), floor(rand()*8000+40000), rand()*1500+500, '40041'),
    ('7516', 'Carbonero el Mayor', 			rand()*45+5, concat(format(rand()*100-50, 5), ',', format(rand()*100-50, 5)), floor(rand()*8000+40000), rand()*1500+500, '40043'),
    ('7517', 'El Espinar', 					rand()*45+5, concat(format(rand()*100-50, 5), ',', format(rand()*100-50, 5)), floor(rand()*8000+40000), rand()*1500+500, '40076'),
    ('7518', 'San Rafael', 					rand()*45+5, concat(format(rand()*100-50, 5), ',', format(rand()*100-50, 5)), floor(rand()*8000+40000), rand()*1500+500, '40076'),
    ('7519', 'La Estación de El Espinar', 	rand()*45+5, concat(format(rand()*100-50, 5), ',', format(rand()*100-50, 5)), floor(rand()*8000+40000), rand()*1500+500, '40076'),
    ('7520', 'Los Ángeles de San Rafael', 	rand()*45+5, concat(format(rand()*100-50, 5), ',', format(rand()*100-50, 5)), floor(rand()*8000+40000), rand()*1500+500, '40076'),
    ('7521', 'Fuentepelayo', 				rand()*45+5, concat(format(rand()*100-50, 5), ',', format(rand()*100-50, 5)), floor(rand()*8000+40000), rand()*1500+500, '40086'),
    ('7522', 'Gallegos de la Sierra', 		rand()*45+5, concat(format(rand()*100-50, 5), ',', format(rand()*100-50, 5)), floor(rand()*8000+40000), rand()*1500+500, '40093'),
    ('7523', 'Languilla', 					rand()*45+5, concat(format(rand()*100-50, 5), ',', format(rand()*100-50, 5)), floor(rand()*8000+40000), rand()*1500+500, '40109'),
    ('7524', 'Lastras de Cuéllar', 			rand()*45+5, concat(format(rand()*100-50, 5), ',', format(rand()*100-50, 5)), floor(rand()*8000+40000), rand()*1500+500, '40110'),
    ('7525', 'San Esteban', 				rand()*45+5, concat(format(rand()*100-50, 5), ',', format(rand()*100-50, 5)), floor(rand()*8000+40000), rand()*1500+500, '40110'),
    ('7526', 'La Serreta', 					rand()*45+5, concat(format(rand()*100-50, 5), ',', format(rand()*100-50, 5)), floor(rand()*8000+40000), rand()*1500+500, '40110'),
    ('7527', 'Santa María de Sacedón', 		rand()*45+5, concat(format(rand()*100-50, 5), ',', format(rand()*100-50, 5)), floor(rand()*8000+40000), rand()*1500+500, '40110'),
    ('7528', 'Monterrubio', 				rand()*45+5, concat(format(rand()*100-50, 5), ',', format(rand()*100-50, 5)), floor(rand()*8000+40000), rand()*1500+500, '40131'),
    ('7529', 'Mozoncillo', 					rand()*45+5, concat(format(rand()*100-50, 5), ',', format(rand()*100-50, 5)), floor(rand()*8000+40000), rand()*1500+500, '40134'),
    ('7530', 'Carabias', 					rand()*45+5, concat(format(rand()*100-50, 5), ',', format(rand()*100-50, 5)), floor(rand()*8000+40000), rand()*1500+500, '40161'),
    ('7531', 'Ciruelos', 					rand()*45+5, concat(format(rand()*100-50, 5), ',', format(rand()*100-50, 5)), floor(rand()*8000+40000), rand()*1500+500, '40161'),
    ('7532', 'Pradales', 					rand()*45+5, concat(format(rand()*100-50, 5), ',', format(rand()*100-50, 5)), floor(rand()*8000+40000), rand()*1500+500, '40161'),
    ('7533', 'Segovia', 					rand()*45+5, concat(format(rand()*100-50, 5), ',', format(rand()*100-50, 5)), floor(rand()*8000+40000), rand()*1500+500, '40300'),
    ('7534', 'San Lorenzo', 				rand()*45+5, concat(format(rand()*100-50, 5), ',', format(rand()*100-50, 5)), floor(rand()*8000+40000), rand()*1500+500, '40300'),
    ('7535', 'Nueva Segovia', 				rand()*45+5, concat(format(rand()*100-50, 5), ',', format(rand()*100-50, 5)), floor(rand()*8000+40000), rand()*1500+500, '40300'),
    ('7536', 'Cristo del Mercado', 			rand()*45+5, concat(format(rand()*100-50, 5), ',', format(rand()*100-50, 5)), floor(rand()*8000+40000), rand()*1500+500, '40300'),
    ('7537', 'San Marcos', 					rand()*45+5, concat(format(rand()*100-50, 5), ',', format(rand()*100-50, 5)), floor(rand()*8000+40000), rand()*1500+500, '40300'),
    ('7538', 'San Millán', 					rand()*45+5, concat(format(rand()*100-50, 5), ',', format(rand()*100-50, 5)), floor(rand()*8000+40000), rand()*1500+500, '40300'),
    ('7539', 'San José', 					rand()*45+5, concat(format(rand()*100-50, 5), ',', format(rand()*100-50, 5)), floor(rand()*8000+40000), rand()*1500+500, '40300'),
    ('7540', 'El Salvador', 				rand()*45+5, concat(format(rand()*100-50, 5), ',', format(rand()*100-50, 5)), floor(rand()*8000+40000), rand()*1500+500, '40300'),
    ('7541', 'San Andrés', 					rand()*45+5, concat(format(rand()*100-50, 5), ',', format(rand()*100-50, 5)), floor(rand()*8000+40000), rand()*1500+500, '40300'),
    ('7542', 'Santa Eulalia', 				rand()*45+5, concat(format(rand()*100-50, 5), ',', format(rand()*100-50, 5)), floor(rand()*8000+40000), rand()*1500+500, '40300'),
	('7543', 'Alcazarén', 					rand()*45+5, concat(format(rand()*100-50, 5), ',', format(rand()*100-50, 5)), floor(rand()*8000+40000), rand()*1500+500, '47005'),
	('7544', 'Boecillo', 					rand()*45+5, concat(format(rand()*100-50, 5), ',', format(rand()*100-50, 5)), floor(rand()*8000+40000), rand()*1500+500, '47023'),
	('7545', 'Campaspero', 					rand()*45+5, concat(format(rand()*100-50, 5), ',', format(rand()*100-50, 5)), floor(rand()*8000+40000), rand()*1500+500, '47030'),
	('7546', 'Fompedraza', 					rand()*45+5, concat(format(rand()*100-50, 5), ',', format(rand()*100-50, 5)), floor(rand()*8000+40000), rand()*1500+500, '47063'),
	('7547', 'Fuente el sol', 				rand()*45+5, concat(format(rand()*100-50, 5), ',', format(rand()*100-50, 5)), floor(rand()*8000+40000), rand()*1500+500, '47067'),
	('7548', 'Íscar', 						rand()*45+5, concat(format(rand()*100-50, 5), ',', format(rand()*100-50, 5)), floor(rand()*8000+40000), rand()*1500+500, '47075'),
	('7549', 'Laguna de Duero', 			rand()*45+5, concat(format(rand()*100-50, 5), ',', format(rand()*100-50, 5)), floor(rand()*8000+40000), rand()*1500+500, '47076'),
	('7550', 'Torrelago', 					rand()*45+5, concat(format(rand()*100-50, 5), ',', format(rand()*100-50, 5)), floor(rand()*8000+40000), rand()*1500+500, '47076'),
	('7551', 'El Villar', 					rand()*45+5, concat(format(rand()*100-50, 5), ',', format(rand()*100-50, 5)), floor(rand()*8000+40000), rand()*1500+500, '47076'),
	('7552', 'Matapozuelos', 				rand()*45+5, concat(format(rand()*100-50, 5), ',', format(rand()*100-50, 5)), floor(rand()*8000+40000), rand()*1500+500, '47082'),
	('7553', 'Barrio del Colegio', 			rand()*45+5, concat(format(rand()*100-50, 5), ',', format(rand()*100-50, 5)), floor(rand()*8000+40000), rand()*1500+500, '47082'),
	('7554', 'Portillo', 					rand()*45+5, concat(format(rand()*100-50, 5), ',', format(rand()*100-50, 5)), floor(rand()*8000+40000), rand()*1500+500, '47122'),
	('7555', 'Arrabal de Portillo', 		rand()*45+5, concat(format(rand()*100-50, 5), ',', format(rand()*100-50, 5)), floor(rand()*8000+40000), rand()*1500+500, '47122'),
	('7556', 'Campo Grande', 				rand()*45+5, concat(format(rand()*100-50, 5), ',', format(rand()*100-50, 5)), floor(rand()*8000+40000), rand()*1500+500, '40200'),
	('7557', 'Delicias', 					rand()*45+5, concat(format(rand()*100-50, 5), ',', format(rand()*100-50, 5)), floor(rand()*8000+40000), rand()*1500+500, '40200'),
	('7558', 'Las Viudas', 					rand()*45+5, concat(format(rand()*100-50, 5), ',', format(rand()*100-50, 5)), floor(rand()*8000+40000), rand()*1500+500, '40200'),
	('7559', 'Universidad', 				rand()*45+5, concat(format(rand()*100-50, 5), ',', format(rand()*100-50, 5)), floor(rand()*8000+40000), rand()*1500+500, '40200'),
	('7560', 'Pajarillos', 					rand()*45+5, concat(format(rand()*100-50, 5), ',', format(rand()*100-50, 5)), floor(rand()*8000+40000), rand()*1500+500, '40200'),
	('7561', 'Las Flores', 					rand()*45+5, concat(format(rand()*100-50, 5), ',', format(rand()*100-50, 5)), floor(rand()*8000+40000), rand()*1500+500, '40200'),
	('7562', 'Los Viveros', 				rand()*45+5, concat(format(rand()*100-50, 5), ',', format(rand()*100-50, 5)), floor(rand()*8000+40000), rand()*1500+500, '40200'),
	('7563', 'Barrio España', 				rand()*45+5, concat(format(rand()*100-50, 5), ',', format(rand()*100-50, 5)), floor(rand()*8000+40000), rand()*1500+500, '40200'),
	('7564', 'San Pablo', 					rand()*45+5, concat(format(rand()*100-50, 5), ',', format(rand()*100-50, 5)), floor(rand()*8000+40000), rand()*1500+500, '40200'),
	('7565', 'Huerta del Rey', 				rand()*45+5, concat(format(rand()*100-50, 5), ',', format(rand()*100-50, 5)), floor(rand()*8000+40000), rand()*1500+500, '40200'),
	('7566', 'La Victoria', 				rand()*45+5, concat(format(rand()*100-50, 5), ',', format(rand()*100-50, 5)), floor(rand()*8000+40000), rand()*1500+500, '40200'),
	('7567', 'Girón', 						rand()*45+5, concat(format(rand()*100-50, 5), ',', format(rand()*100-50, 5)), floor(rand()*8000+40000), rand()*1500+500, '40200'),
	('7568', 'Arturo Eyries', 				rand()*45+5, concat(format(rand()*100-50, 5), ',', format(rand()*100-50, 5)), floor(rand()*8000+40000), rand()*1500+500, '40200'),
	('7569', 'Cuatro de Marzo', 			rand()*45+5, concat(format(rand()*100-50, 5), ',', format(rand()*100-50, 5)), floor(rand()*8000+40000), rand()*1500+500, '40200'),
	('7570', 'Pinar de Antequera', 			rand()*45+5, concat(format(rand()*100-50, 5), ',', format(rand()*100-50, 5)), floor(rand()*8000+40000), rand()*1500+500, '40200')
    ;

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
	('9001259 ZE7812S 2288 YY', 'Calle El Caldero', 12, '2 C', 90, 250000, '7519', '20039032Y'),
	('9110254 WS448O 3354 QW', 'Avda. Don Calero Martinez', 10, '2 B', 95, 220500, '7505', '41679701K'),
	('7445852 LP8524O 1119 ZX', 'Calle Sésamo Bravo', 11, '2 A', 83, 150000, '7512', '71297004V'),
	('7445852 HG2591T 0202 VN', 'Avda. Paco Casado', 3, '1 C', 350, 330000, '7507', '59804933B'),
	('8956211 VB6518F 0025 VV', 'Calle El Portal ', 15, NULL, 523, 452500, '7543', '20039032Y'),
	('1888254 CF4511R 9955 NB', 'Calle El Jorobado Danés', 10, '2 B', 122, 192300, '7534', '23310054Z'),
	('2255255 CC8858Y 0110 SA', 'calle Gaviota', 11, '3 B', 162, 126850, '7560', '73793158G'),
	('2255877 ZZ9523J 7751 MN', 'Avda. Punta Cuntera', 5, '5 A', 63, 115300, '7569', '44892211Y'),
	('9522624 YP4525P 0005 KK', 'Avda. La Sevillana Marena', 2, '1 D', 80, 175300, '7506', '94328497T'),
	('1388754 CX8466H 0666 PO', 'Avda. Palencia', 1, '1 A', 107, 107640, '7510', '64105041Q');

COMMIT;


-- -----------------------------------------------------
-- Data for table `AdminViviendas`.`Impuestos`
-- -----------------------------------------------------
START TRANSACTION;
USE `AdminViviendas`;
INSERT INTO `AdminViviendas`.`Impuestos` (`fechaInicio`, `fechaVencimiento`, `importe`, `fechaActualPago`, `idViviendas`, `dni`) VALUES 
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
