set global log_bin_trust_function_creators = 1;
/* TRIGGERS, PROCEDIMIENTOS Y FUNCIONES */

/*------------------------------------- TRIGGERS ---------------------------------*/

/*1. Si el barrio crece el precio del m2 aumenta*/
delimiter //
CREATE TRIGGER valBarrio AFTER UPDATE ON Barrios
FOR EACH ROW
BEGIN
	IF  NEW.area - area > 200 THEN 
		UPDATE Barrios SET avgM2price = avgM2price * 1.06;
	END IF;
 
END//



/*2. Rebaja del 10% en los nuevos impuestos en un Municipio ej. Cuellar*/
delimiter //
CREATE TRIGGER descZona BEFORE UPDATE ON Impuestos
FOR EACH ROW
BEGIN
	DECLARE propViv VARCHAR(25);
    SELECT nombre INTO propViv 
    FROM Municipios 
    WHERE idMunicipio = (SELECT idMunicipio FROM Municipios m, Barrios b WHERE b.idMunicipio = m.idMunicipio 
    AND idBarrios = (SELECT idBarrios FROM Viviendas v, Impuestos i WHERE v.nºCatastro = i.nºCatastro));
    
	IF propViv = "Cuellar" THEN 
		UPDATE NEW.Impuestos SET importe = avgM2price * 0.90;
	END IF; 
END//

drop trigger descZona;




/*3. Impuesto multa de X cantidad si se paga un impuesto fuera de plazo*/
delimiter //
CREATE TRIGGER multa AFTER UPDATE ON Impuestos
FOR EACH ROW
BEGIN
	if( new.fechaActualPago > fechaVencimiento ) then
		
        INSERT INTO impuestos(fechaInicio, fechaVencimiento, importe, nºCatastro, dni) 
        VALUES(current_date(), date_add(current_time(), INTERVAL 1 MONTH), 500.99, nºCatastro, dni);
    end if;
END//

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
select * from viviendas;
select * from barrios;
INSERT INTO `AdminViviendas`.`Viviendas` (`nºCatastro`, `calle`, `num`, `piso`, `m2`, `precioTasacion`, `idBarrios`, `dni`)
values ('2688754 CY7466H 0666 IO', 'Avda. Ejemplo', 1, '1 A', 200, 200000, '7536', '64105041Q');


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
select * from viviendas;
DROP TRIGGER cambioMetrosCuadrados;
update Viviendas set m2 = 200 where idViviendas = 1;
update Viviendas set precioTasacion = 200000 where idViviendas = 1;

-- 6.El plazo minimo para el pago de un impuesto son dos meses
DELIMITER //
CREATE TRIGGER plazoMinImpuesto BEFORE INSERT ON Impuestos
FOR EACH ROW
BEGIN 
	IF datediff(d, NEW.fechaVencimiento, NEW.fechaInicio) < 60 THEN
		SET NEW.fechaVencimiento = date_add(NEW.fechaInicio, INTERVAL 2 MONTH);
	END IF;
END //
delimiter ;
select * from impuestos;
DROP TRIGGER plazoMinImpuesto;
insert into impuestos(fechaInicio, fechaVencimiento, importe, nºCatastro, dni) 
        VALUES(20190627, date_add(20190627, INTERVAL 1 MONTH), 500.99, 7, '59804933B');


/* ----------------------------- PROCEDIMIENTOS -------------------------------*/


-- 1. Calcula el numero de impuestos sin pagar vinculados a un dni 
delimiter //
CREATE PROCEDURE numImpuestosDeuda(iN elDni VARCHAR(15) , OUT total integer)
begin
	SELECT COUNT(*) INTO total FROM Impuestos i, Propietarios p WHERE i.dni = p.dni AND p.dni = elDni AND i.fechaActualPago = null;
end//

-- 2. Listar casas de un barrio
delimiter //
CREATE PROCEDURE listarCasas(iN  barrio VARCHAR(45))
begin
	SELECT v.nºCatastro, v.calle, v.num, v.piso, v.m2, v.precioTasacion, v.dni, p.nombre, p.apellidos
    FROM Viviendas v, Barrios b, Propietarios p 
    WHERE b.nombre = barrio AND v.idBarrios = b.idBarrios AND v.dni = p.dni;
end//

-- 3. Subir los impuestos a casas con mas de X m^2
delimiter //
CREATE PROCEDURE subirImpuestosM2(iN incremento DECIMAL(10,3), IN tamaño DECIMAL(10,3))
begin
	UPDATE Impuestos i, Viviendas v SET i.importe = (i.importe+incremento)
    WHERE i.nºCatastro = v.nºCatastro AND v.M2 >= tamaño;
end//

-- 4. Encuentra las viviendas que pertenecen a un nombre y apellidos
delimiter //
CREATE PROCEDURE encuentraViviendas(iN nombreProp VARCHAR(20), IN apellidosProp VARCHAR(40))
begin
	SELECT * FROM Viviendas v, Propietarios p WHERE v.dni = p.dni AND p.nombre = nombreProp AND p.apellidos = apellidosProp;
end//

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
select * from viviendas;
select * from municipios;
select * from barrios;
call incPrecioViviendasMunic('El Espinar', 5);
update Viviendas set precioTasacion = 250000 where idViviendas = 4;

-- 6. Listado de habitantes de un municipio con nombre apellido dni y ordenados afabéticamente
DELIMITER //
CREATE PROCEDURE listarHabitantesMunicipio(IN muni VARCHAR(25))
BEGIN
	SELECT nombre, apellidos, dni FROM ocupantes o, propietarios p, VIviendas v, Municipios m, Barios b 
    WHERE v.idBarrios = b.idBarrios AND o.idViviendas = v.idViviendas AND p.dni = v.dni AND b.idMunicipio = m.idMunicipio
    AND m.idMunicipio = muni
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


-- 1. Estima el valor economico de un barrio
delimiter //
CREATE FUNCTION valorBarrio(nombreBarrio VARCHAR(45)) RETURNS decimal(10,3)
begin
	DECLARE precioTotal decimal(10,3);
	SELECT SUM(precioTasacion) into precioTotal
    FROM viviendas v, barrios b
    WHERE v.idBarrios = b.idBarrios AND b.nombre = nombreBarrio;
    return precioTotal;
end//

-- 2. Calcular la recaudacion total de un año
delimiter //
CREATE FUNCTION recaudacionAnual( año INTEGER ) RETURNS DECIMAL(15, 4)
begin
	DECLARE recTotal decimal(15,3);
	SELECT SUM(importe) INTO recTotal FROM Impuestos WHERE (SELECT year(fechaCreacion)) = año;
    return recTotal;
end //


-- 3. Calcular número de ocupantes que residen en un barrio
delimiter //
CREATE FUNCTION poblacionBarrio( nomBarrio VARCHAR(25) ) RETURNS INTEGER
begin
	DECLARE recuento INTEGER;
	SELECT count(*) INTO recuento FROM Barrios b, Ocupantes o, Viviendas v WHERE b.idBarrios = v.idBarrios
    AND v.nºCatastro = o.nºCatastro AND b.nombre = nomBarrio;
    return recuento;
end //

-- 4. Buscar el dni del ocupante más mayor
delimiter //
CREATE FUNCTION dniOcupanteMasMayor() RETURNS char(9)
begin
	DECLARE dniOc char(9);
	SELECT dni INTO dniOc FROM Ocupantes WHERE fNac = (SELECT min(fNAc) FROM Ocupantes);
    return dniOc;
end //

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
select areaMediaMunicipios('Valladolid');

-- 6 