use adminviviendas;



/*LISTADOS PARA LA CONSEJERÍA DE VIVIENDA Y URBANISMO
Primera consulta, listado de zonas urbanas con precio medio del m2, nombre, área coord. geográficas
municipio y provincia. Ordenado por provincia y municipio*/

SELECT b.avgM2price, b.nombre as nombreBarrio, b.area, b.coord, m.nombre as nombreMunicipio, p.nombre as nombreProvincia
FROM Barrios b, Municipios m, Provincias p
WHERE b.idMunicipio = m.idMunicipio AND m.codigoProvincia = p.codigoProvincia
ORDER BY p.nombre, m.nombre;



/*Segundo listado, igual pero ordenado por el precio del m2*/

SELECT b.avgM2price, b.nombre as nombreBarrio, b.area, b.coord, m.nombre as nombreMunicipio, p.nombre as nombreProvincia
FROM Barrios b, Municipios m, Provincias p
WHERE b.idMunicipio = m.idMunicipio AND m.codigoProvincia = p.codigoProvincia
ORDER BY b.avgM2price;



/*Tercer listado, viviendas vacias en cada zona urbana

W3C ~~~ SQL LEFT JOIN Keyword
The LEFT JOIN keyword returns all records from the left table (table1), and the matched records from the right table (table2).
The result is NULL from the right side, if there is no match.
*/

SELECT v.nºCatastro, calle, num, piso, b.nombre as nombreBarrio, m.nombre as nombreMunicipio
	FROM viviendas v, barrios b, municipios m
    WHERE v.idBarrios = b.idBarrios and b.idMunicipio = m.idMunicipio and v.nºCatastro in(
		SELECT viviendas.nºCatastro
			FROM viviendas
			LEFT JOIN ocupantes ON(viviendas.nºCatastro=ocupantes.nºCatastro)
			WHERE ocupantes.nºCatastro IS NULL
		)
    ORDER BY m.nombre, b.nombre, v.calle;



/*LISTADOS PARA LA CONSEJERÍA DE BIENESTAR SOCIAL
Cuarto listado, viviendas habitadas por una única persona de mas de 70 años */

SELECT DISTINCT v.nºCatastro, v.calle, v.num, v.piso, v.m2, v.precioTasacion, b.*
FROM Viviendas v, Ocupantes o, Barrios b
WHERE v.nºCatastro = o.nºCatastro AND v.idBarrios = b.idBarrios AND ((YEAR(CURRENT_TIME()) - YEAR(o.fNac)) - (DATE_FORMAT(CURRENT_TIME(), '00-%m-%d') < DATE_FORMAT(o.fNac, '00-%m-%d'))) >= 70
ORDER BY v.precioTasacion;



/*LISTADOS PARA LA CONSEJERÍA DE ECONOMÍA Y HACIENDA
Quinto listado, propietarios que no estan al corriente de pagos*/

SELECT p.dni, p.nombre, p.apellidos, p.calle, p.num, p.piso, b.nombre as nombreBarrio, m.nombre as nombreMunicipio
FROM Impuestos i, Propietarios p, Viviendas v, Municipios m, Barrios b
WHERE p.dni = i.dni AND i.nºCatastro = v.nºCatastro AND v.idBarrios = b.idBarrios AND b.idMunicipio = m.idMunicipio
	AND CURRENT_TIME() > fechaVencimiento AND fechaActualPago IS NULL
ORDER BY m.nombre, b.nombre;



/*SENTENCIAS DE INSERCIÓN DE TUPLAS
6-Inserción de una nueva provincia: Palencia*/

INSERT INTO `AdminViviendas`.`Provincias` (`codigoProvincia`, `nombre`) VALUES ('843319PAL', 'Palencia');



/*SENTENCIAS DE INSERCIÓN DE TUPLAS
7-Inserción de un nuevo municipio: Astudillo, ubicado en la provincia de Palencia*/

INSERT INTO `AdminViviendas`.`Municipios` (`idMunicipio`, `nombre`, `area`, `codigoProvincia`) VALUES ('47186', 'Astudillo', 122.95, '843319PAL');



/*SENTENCIAS DE INSERCIÓN DE TUPLAS
8-Inserción de un nuevo barrio: Palacios del Alcor, ubicado en el municipio de Astudillo*/

INSERT INTO `AdminViviendas`.`Barrios` (`idBarrios`, `nombre`, `area`, `coord`, `zipCode`, `avgM2price`, `idMunicipio`) VALUES ('7511', 'Palacios del Alcor', 7.4, '42.17845,4.37087', 34490, 620, '47186');



/*SENTENCIAS DE INSERCIÓN DE TUPLAS
9-Inserción de un nuevo propietario: Isabel*/

INSERT INTO `AdminViviendas`.`Propietarios` (`dni`, `nombre`, `apellidos`, `calle`, `num`, `piso`) VALUES ('96328499A', 'Isabel', 'Hernández Del Olmo', 'Calle Altozano', 4, NULL);



/*SENTENCIAS DE INSERCIÓN DE TUPLAS
10-Inserción de una nueva vivienda, propiedad de Isabel Hernández Del Olmo, ubicada en Palacios del Alcor*/

INSERT INTO `AdminViviendas`.`Viviendas` (`nºCatastro`, `calle`, `num`, `piso`, `m2`, `precioTasacion`, `idBarrios`, `dni`) VALUES ('7755877 JJ9577P 7782 QQ', 'Calle Altozano', 4, NULL, 53, 315800, '7511', '96328499A');



/*SENTENCIAS DE INSERCIÓN DE TUPLAS
11-Inserción de dos ocupantes a la vivienda reciencemente insertada, uno de esos ocupantes debe ser la propietaria de la vivienda*/

INSERT INTO `AdminViviendas`.`Ocupantes` (`dni`, `nombre`, `apellidos`, `fNac`, `nºCatastro`) VALUES ('96328499A', 'Isabel', 'Hernández Del Olmo', '1985-7-04', '7755877 JJ9577P 7782 QQ');
INSERT INTO `AdminViviendas`.`Ocupantes` (`dni`, `nombre`, `apellidos`, `fNac`, `nºCatastro`) VALUES ('44544434C', 'Inés', 'Arnaiz Llorente', '1981-10-24', '7755877 JJ9577P 7782 QQ');



/*SENTENCIAS DE MODIFICACIÓN O ACTUALIZACIÓN DE TUPLAS
12-Actualizar el nombre de la provincia Palencia a Salamanca*/

UPDATE Provincias
	SET nombre='Salamanca'
    WHERE codigoProvincia='843319PAL';









/*SENTENCIAS DE BORRADO DE TUPLAS
18-Borrar la provincia con codigoProvincia=843319PAL*/

DELETE FROM Provincias
	WHERE codigoProvincia='843319PAL';
    
    



/*Consultar cada tabla*/
SELECT * FROM Provincias;
SELECT * FROM Municipios;
SELECT * FROM Barrios;
SELECT * FROM Propietarios;
SELECT * FROM Viviendas;
SELECT * FROM Ocupantes;
SELECT * FROM Impuestos;