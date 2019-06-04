use adminviviendas;
drop database adminviviendas;
show tables;
select * from barrios;
select * from impuestos;
select * from municipios;
select * from ocupantes;
select * from propietarios;
select * from provincias;
select * from viviendas;



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
Quinto listado, propietarios que no estan al corriente de pagos por zona urbana y municipio.*/

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



/*Desactivar safe_update*/
SET SQL_SAFE_UPDATES = 0;
/*SENTENCIAS DE MODIFICACIÓN O ACTUALIZACIÓN DE TUPLAS
12-Actualizar el nombre de la provincia Palencia a Salamanca y su código a 475611SAL*/

UPDATE Provincias p
	SET p.nombre='Salamanca', p.codigoProvincia='475611SAL'
    WHERE p.nombre='Palencia';



/*SENTENCIAS DE MODIFICACIÓN O ACTUALIZACIÓN DE TUPLAS
13-Actualizar el nombre del municipio de Astudillo a Béjar, municipio de Salamanca, y del barrio de Palacios del Alcor a Fuentebuena,
 barrio de Béjar con código 7520*/

UPDATE Provincias p, Municipios m, Barrios b 
	SET m.nombre='Béjar', m.codigoProvincia=p.codigoProvincia, b.nombre='Fuentebuena', b.idMunicipio=m.idMunicipio, b.idBarrios='7520'
    WHERE p.nombre='Salamanca' AND m.nombre='Astudillo' AND b.nombre='Palacios del Alcor';



/*SENTENCIAS DE MODIFICACIÓN O ACTUALIZACIÓN DE TUPLAS
14-Hubo un error en la estimación del área de los barrios de la provincia de Segovia, se estimó un 10% de más; se debe actualizar este valor
reduciéndolo en un 10% para todos ellos*/

UPDATE Provincias p, Municipios m, Barrios b
	SET b.area=b.area-b.area*0.1
    WHERE p.nombre='Segovia' AND p.codigoProvincia=m.codigoProvincia AND m.idMunicipio=b.idMunicipio;



/*SENTENCIAS DE MODIFICACIÓN O ACTUALIZACIÓN DE TUPLAS
15-El ocupantes con dni='68496613Z' se muda de su vivienda a otra con nºcatastral='1888254 CF4511R 9955 NB'*/

UPDATE Ocupantes
	SET nºCatastro='1888254 CF4511R 9955 NB'
    WHERE dni='68496613Z';



/*SENTENCIAS DE MODIFICACIÓN O ACTUALIZACIÓN DE TUPLAS
16-Raúl Migua Otero ha adquirido una vivienda del barrio de Caballeros, del municipio de Cuéllar en Segovia.
La vivienda está en la calle Calle Lorenzo Gonzalez número 2, piso 2 A y al adquirirla su precio de tasación ha
aumentado un 8%*/

UPDATE Provincias p,
    Municipios m,
    Barrios b,
    Viviendas v,
    Propietarios prop 
SET 
    v.dni = prop.dni,
    v.precioTasacion = v.precioTasacion + 0.08 * v.precioTasacion
WHERE
    p.nombre = 'Segovia'
        AND m.nombre = 'Cuéllar'
        AND b.nombre = 'Caballeros'
        AND v.calle = 'Calle Lorenzo Gonzalez'
        AND v.num = '2'
        AND v.piso = '2 A'
        AND prop.nombre = 'Raúl'
        AND prop.apellidos = 'Migua Otero';



/*SENTENCIAS DE MODIFICACION DE TUPLAS O ACTUALIZACIÓN DE TUPLAS
17- Si el propietario ha excedido la fecha de vencimiento del impuesto se le aplica un 25% sobre el importe total.*/    

UPDATE Impuestos i
SET i.importe = i.importe * 1.25
WHERE CURRENT_TIME() > i.fechaVencimiento AND i.fechaActualPago IS NULL;



/*SENTENCIAS DE BORRADO DE TUPLAS
18-Borrar la provincia con codigoProvincia=475611SAL*/

DELETE FROM Provincias
	WHERE codigoProvincia='475611SAL';



/*SENTENCIAS DE BORRADO DE TUPLAS
19-Borrar a los ocupantes nacidos antes de 1980*/

DELETE FROM Ocupantes
	WHERE year(Ocupantes.fNac)<1980;
 


/*SENTENCIAS DE BORRADO DE TUPLAS
20-Borrar los impuestos relacionados a propietarios con dnis que contengan dos ceros juntos*/

DELETE FROM Impuestos
	WHERE dni LIKE '%00%';
 
/*SENTENCIAS DE BORRADO DE TUPLAS
21- Los ocupantes con dni 69790544B y 90095607S fallecieron*/

DELETE FROM Ocupantes
	WHERE dni = '69790544B' OR dni = '90095607S';
    
    
    
/*SENTENCIAS DE BORRADO DE TUPLAS
22- Para aligerar la carga de la base de datos, se borrarán los impuestos cuya fecha de vencimiento sea anterior a comienzo de año y ya
se haya pagado el importe del impuesto*/

DELETE FROM Impuestos
	WHERE fechaVencimiento < '2019/01/01' AND fechaActualPago IS NOT NULL;



/*SENTENCIAS ALTER TABLE 
23- Cambiar el nombre de la columna zipCode de la tabla Barrios por codigoPostal, también un entero*/

ALTER TABLE Barrios
CHANGE zipCode codigoPostal int;



/*Consultar cada tabla*/
SELECT * FROM Provincias;
SELECT * FROM Municipios
	ORDER BY nombre;
SELECT * FROM Barrios;
SELECT * FROM Propietarios;
SELECT * FROM Viviendas;
SELECT * FROM Ocupantes;
SELECT * FROM Impuestos;
