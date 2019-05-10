/* TRIGGERS, PROCEDIMIENTOS Y FUNCIONES */


/*Si el barrio crece el precio del m2 aumenta*/
delimiter //
CREATE TRIGGER valBarrio AFTER UPDATE ON Barrios
FOR EACH ROW
BEGIN
	IF  NEW.area - area > 200 THEN 
		UPDATE Barrios SET avgM2price = avgM2price * 1.06;
	END IF;
 
END//
