set global log_bin_trust_function_creators = 1;
SET SQL_SAFE_UPDATES = 0;
use adminviviendas;
/* TRIGGERS, PROCEDIMIENTOS Y FUNCIONES */

/*------------------------------------- TRIGGERS ---------------------------------*/

/*1. Si el barrio crece el precio del m2 aumenta*/
delimiter //
CREATE TRIGGER valBarrio BEFORE UPDATE ON Barrios
FOR EACH ROW
BEGIN
	IF  NEW.area - OLD.area > 200 THEN
		SET NEW.avgM2price = OLD.avgM2price * 1.06;
	END IF;

END//

delimiter ;
drop trigger valBarrio;
select * from Barrios where idBarrios = 7500;
update Barrios set area = area + 250 where idBarrios=7500;


/*2. Rebaja del 10% en los nuevos impuestos en un Municipio ej. Cuellar*/
delimiter //
CREATE TRIGGER descZona BEFORE INSERT ON Impuestos
FOR EACH ROW
BEGIN
	DECLARE propViv VARCHAR(25);
    DECLARE eurM decimal(10, 3);
    SELECT m.nombre into propViv
    FROM Municipios m, Barrios b
    WHERE m.idMunicipio = b.idMunicipio AND idBarrios = (SELECT idBarrios FROM Viviendas v WHERE v.idViviendas = new.idViviendas);
	IF propViv = "Cuellar" THEN
		SELECT avgM2price into eurM FROM barrios WHERE idBarrios = (SELECT idBarrios FROM Viviendas v WHERE v.idViviendas = new.idViviendas);
		SET new.importe = new.importe * 0.90;
	END IF;
END//

delimiter ;
drop trigger descZona;
select * from impuestos;
insert into impuestos(fechaInicio, fechaVencimiento, importe, fechaActualPago, idViviendas, dni)
values(current_date(), date_add(current_date(), INTERVAL 2 MONTH), 500, null, 1, "73793158G");


/*3. Al mudarse un ocupante de una vivienda a una nueva vivienda el valor de esta vivienda disminuye un 3%*/
delimiter //
CREATE TRIGGER mudanza AFTER UPDATE ON Ocupantes
FOR EACH ROW
BEGIN
	if( new.idViviendas != old.idViviendas ) then
        UPDATE Viviendas v
        SET precioTasacion = precioTasacion - precioTasacion * 0.03
        WHERE v.idViviendas = new.idViviendas;
    end if;
END//

delimiter ;
drop trigger mudanza;
select * from viviendas where idViviendas = 1;
select * from ocupantes where dni = '04915024Q';
update Ocupantes set idViviendas = 1 where dni = '04915024Q';

/*4. Al insertar una nueva vivienda, si está en un barrio con un área menor que 40m2, su precio de tasación disminuye*/
delimiter //
CREATE TRIGGER depreciacionVivienda BEFORE INSERT ON Viviendas
FOR EACH ROW
BEGIN
	declare areaBarrio decimal(10,3);
	select area into areaBarrio
	from Barrios b
	where b.idBarrios = new.idBarrios;
	if(areaBarrio < 40) then
		set new.precioTasacion = new.precioTasacion - ( new.precioTasacion * 0.05 );
    end if;
END//

delimiter ;
DROP TRIGGER depreciacionVivienda;
select * from Barrios where area < 40;
select * from barrios where idBarrios = 7536;
INSERT INTO Viviendas (nºCatastro, calle, num, piso, m2, precioTasacion, idBarrios, dni)
values ('2688754 CY7466H 0666 IO', 'Avda. Ejemplo', 1, '1 A', 200, 200000, '7536', '64105041Q');
select * from viviendas where idBarrios = 7536;


/*5. Al actualizar los m2 de una vivienda, el precio de tasación se modifica en función de la diferencia de m2 */
delimiter //
CREATE TRIGGER cambioMetrosCuadrados BEFORE UPDATE ON Viviendas
FOR EACH ROW
BEGIN
    if( new.m2 > 0 ) then
		set new.precioTasacion = new.precioTasacion * new.m2 / old.m2;
	end if;
END//

delimiter ;
DROP TRIGGER cambioMetrosCuadrados;
select * from viviendas where idViviendas=1;
update Viviendas set m2 = 210 where idViviendas = 1;


-- 6.El plazo minimo para el pago de un impuesto son dos meses
DELIMITER //
CREATE TRIGGER plazoMinImpuesto BEFORE INSERT ON Impuestos
FOR EACH ROW
BEGIN
	IF datediff(NEW.fechaVencimiento, NEW.fechaInicio) < 60 THEN
		SET NEW.fechaVencimiento = date_add(NEW.fechaInicio, INTERVAL 2 MONTH);
	END IF;
END //

delimiter ;
DROP TRIGGER plazoMinImpuesto;
select * from impuestos;
insert into impuestos(fechaInicio, fechaVencimiento, importe, idViviendas, dni)
        VALUES(20190627, date_add(20190627, INTERVAL 1 MONTH), 500.99, 7, '59804933B');


/* ----------------------------- PROCEDIMIENTOS -------------------------------*/


-- 1. Calcula el numero de impuestos sin pagar vinculados a un dni
delimiter //
CREATE PROCEDURE numImpuestosDeuda(IN elDni VARCHAR(15) , OUT total integer)
begin
	SELECT COUNT(*) INTO total FROM Impuestos i, Propietarios p WHERE i.dni = p.dni AND p.dni = elDni AND i.fechaActualPago IS NULL;
end//

delimiter ;
drop procedure numImpuestosDeuda;
select * from impuestos where dni = '94328497T';
call numImpuestosDeuda('94328497T' , @total);
SELECT @total;


-- 2. Listar casas de un barrio
delimiter //
CREATE PROCEDURE listarCasas(IN  barrio VARCHAR(45))
begin
	SELECT v.nºCatastro, v.calle, v.num, v.piso, v.m2, v.precioTasacion, v.dni, p.nombre, p.apellidos
    FROM Viviendas v, Barrios b, Propietarios p
    WHERE b.nombre = barrio AND v.idBarrios = b.idBarrios AND v.dni = p.dni;
end//

delimiter ;
drop procedure listarCasas;
select * from viviendas;
select nombre from barrios where idBarrios = 7543;
call listarCasas('Alcazarén');


-- 3. Subir los impuestos a casas con mas de X m^2
delimiter //
CREATE PROCEDURE subirImpuestosM2(iN incremento DECIMAL(10,3), IN tamaño DECIMAL(10,3))
begin
	UPDATE Impuestos i, Viviendas v SET i.importe = (i.importe + incremento)
    WHERE i.idViviendas = v.idViviendas AND v.M2 >= tamaño;
end//

delimiter ;
drop procedure subirImpuestosM2;
select * from impuestos;
select * from viviendas where m2 > 150;
call subirImpuestosM2(30, 150);


-- 4. Encuentra las viviendas que pertenecen a un nombre y apellidos
delimiter //
CREATE PROCEDURE encuentraViviendas(IN nombreProp VARCHAR(20), IN apellidosProp VARCHAR(40))
begin
	SELECT v.nºCatastro, v.calle, v.num, v.piso, v.m2, v.precioTasacion, b.nombre
    FROM Viviendas v, Propietarios p, Barrios b
    WHERE v.dni = p.dni AND v.idBarrios = b.idBarrios AND p.nombre = nombreProp AND p.apellidos = apellidosProp;
end//

delimiter ;
drop procedure encuentraViviendas;
select * from viviendas;
select * from propietarios;
select * from barrios;
call encuentraViviendas('Pedro','Ramiro López');


-- 5. Aumenta en un porcentaje el precio de tasación de las viviendas ubicadas en un municipio
delimiter //
CREATE PROCEDURE incPrecioViviendasMunic(IN municipio varchar(45), IN porcentaje decimal)
begin
	update Municipios m, Barrios b, Viviendas v
    set precioTasacion = precioTasacion + precioTasacion * porcentaje/100
    where m.nombre = municipio and m.idMunicipio = b.idMunicipio and v.idBarrios = b.idBarrios;
end//

delimiter ;
drop procedure incPrecioViviendasMunic;
select * from municipios;
select * from barrios where idMunicipio = 40076;
select * from viviendas v, barrios b where idMunicipio = 40076 AND v.idBarrios = b.idBarrios;
call incPrecioViviendasMunic('El Espinar', 5);


-- 6. Listado de habitantes de un municipio con nombre apellido dni y ordenados afabéticamente
DELIMITER //
CREATE PROCEDURE listarHabitantesMunicipio(IN muni VARCHAR(25))
BEGIN
	SELECT o.nombre as nombre, o.apellidos as apellidos, o.dni as dni FROM ocupantes o, Viviendas v, Municipios m, Barrios b 
    WHERE v.idBarrios = b.idBarrios AND o.idViviendas = v.idViviendas AND b.idMunicipio = m.idMunicipio
    AND m.nombre = muni
    UNION
    SELECT p.nombre as nombre, p.apellidos as apellidos, p.dni as dni FROM propietarios p, Viviendas v, Municipios m, Barrios b 
    WHERE v.idBarrios = b.idBarrios AND p.dni = v.dni AND b.idMunicipio = m.idMunicipio
    AND m.nombre = muni
    ORDER BY nombre;
END//

delimiter ;
drop procedure listarHabitantesMunicipio;
select * from ocupantes;
select * from propietarios;
select * from barrios;
select * from municipios;
call listarHabitantesMunicipio('Valladolid');


/*-------------------------------- FUNCIONES --------------------------------*/


-- 1. Estima el valor económico de un barrio
delimiter //
CREATE FUNCTION valorBarrio(nombreBarrio VARCHAR(45)) RETURNS decimal(10,3)
begin
	DECLARE precioTotal decimal(10,3);
	SELECT SUM(precioTasacion) into precioTotal
    FROM viviendas v, barrios b
    WHERE v.idBarrios = b.idBarrios AND b.nombre = nombreBarrio;
    return precioTotal;
end//

delimiter ;
select * from barrios;
select * from viviendas where idBarrios = 7509;
select valorBarrio('Pajarillos');


-- 2. Calcular la recaudacion total de un año
delimiter //
CREATE FUNCTION recaudacionAnual( año INTEGER ) RETURNS DECIMAL(15, 4)
begin
	DECLARE recTotal decimal(15,3);
	SELECT SUM(importe) INTO recTotal FROM Impuestos WHERE (SELECT year(fechaActualPago)) = año;
    return recTotal;
end //

delimiter ;
drop function recaudacionAnual;
select * from impuestos;
select recaudacionAnual(2018);

-- 3. Calcular número de ocupantes que residen en un barrio
delimiter //
CREATE FUNCTION poblacionBarrio( nomBarrio VARCHAR(25) ) RETURNS INTEGER
begin
	DECLARE recuento INTEGER;
	SELECT count(*) INTO recuento FROM Barrios b, Ocupantes o, Viviendas v
    WHERE v.idViviendas = o.idViviendas AND b.nombre = nomBarrio;
    return recuento;
end //

delimiter ;
drop function poblacionBarrio;
select poblacionBarrio('Pajarillos');

-- 4. Buscar el dni del ocupante más mayor
delimiter //
CREATE FUNCTION dniOcupanteMasMayor() RETURNS char(9)
begin
	DECLARE dniOc char(9);
	SELECT dni INTO dniOc FROM Ocupantes WHERE fNac = (SELECT min(fNAc) FROM Ocupantes);
    return dniOc;
end //

delimiter ;
drop function dniOcupanteMasMayor;
select * from ocupantes order by fNac;
select dniOcupanteMasMayor();


-- 5. El área media de los municipios de una provincia
delimiter //
CREATE FUNCTION areaMediaMunicipios(prov varchar(45)) RETURNS decimal(10,2)
begin
	DECLARE areaMedia decimal(10,2);
	SELECT avg(area) INTO areaMedia
    FROM Municipios m, Provincias p
    WHERE p.nombre = prov AND m.codigoProvincia = p.codigoProvincia;
    return areaMedia;
end //

delimiter ;
drop function areaMediaMunicipios;
select areaMediaMunicipios('Valladolid');
