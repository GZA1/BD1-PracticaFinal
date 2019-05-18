/* TRIGGERS, PROCEDIMIENTOS Y FUNCIONES */

/*------------------------------------- TRIGGERS ---------------------------------*/

/*Si el barrio crece el precio del m2 aumenta*/
delimiter //
CREATE TRIGGER valBarrio AFTER UPDATE ON Barrios
FOR EACH ROW
BEGIN
	IF  NEW.area - area > 200 THEN 
		UPDATE Barrios SET avgM2price = avgM2price * 1.06;
	END IF;
 
END//



/*Rebaja del 10% en los nuevos impuestos en un Municipio ej. Segovia*/
delimiter //
CREATE TRIGGER descZona BEFORE UPDATE ON Impuestos
FOR EACH ROW
BEGIN
	DECLARE propViv VARCHAR(25);
    SELECT nombre INTO propViv 
    FROM Municipios 
    WHERE idMunicipio = (SELECT idMunicipio FROM Municipios m, Barrios b WHERE b.idMunicipio = m.idMunicipio 
    AND idBarrios = (SELECT idBarrios FROM Viviendas v, Impuestos i WHERE v.nºCatastro = i.nºCatastro));
    
	IF propViv = "Segovia" THEN 
		UPDATE NEW.Impuestos SET importe = avgM2price * 0.90;
	END IF;
 
END//




/* ----------------------------- PROCEDIMIENTOS -------------------------------*/

delimiter //
CREATE PROCEDURE whatever(iN a integer)
begin

end//

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

-- 4. 
delimiter //
CREATE PROCEDURE whatever(iN a integer)
begin

end//

-- 5. 
delimiter //
CREATE PROCEDURE whatever(iN a integer)
begin

end//






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

-- Calcular la recaudacion total de un año
delimiter //
CREATE FUNCTION recaudacionAnual( año INTEGER ) RETURNS DECIMAL(15, 4)
begin
	DECLARE recTotal decimal(15,3);
	SELECT SUM(importe) INTO recTotal FROM Impuestos WHERE (SELECT year(fechaCreacion)) = año;
    return recTotal;
end //
