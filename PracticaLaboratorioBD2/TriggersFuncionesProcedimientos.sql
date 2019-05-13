/*Triggers Funciones y Procedimientos*/


-- TRIGGERS


-- Si el precio del metro cuadrado de un barrio varia, 
-- el precio de tasacion de las viviendas varia 
delimiter //
CREATE TRIGGER revalorizacion BEFORE UPDATE ON barrios
FOR EACH ROW
BEGIN
IF (NEW.avgM2price - avgM2price) > 0 THEN
	UPDATE viviendas v SET precioTasacion = precioTasacion + 0.8*new.avgM2price*m2 WHERE v.idBarrios = new.idBarrios;
ELSEIF (NEW.avgM2price - avgM2price) < 0 THEN
	UPDATE viviendas v SET precioTasacion = precioTasacion - new.avgM2price*m2 WHERE v.idBarrios = new.idBarrios;
END IF;
end//



-- FUNCIONES




-- PROCEDIMIENTOS