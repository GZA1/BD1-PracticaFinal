-- Admninistrador de la organización tiene todos los permisos 
-- sobre todas las tablas del esquema Admin Viviendas

CREATE USER orgAdmin
IDENTIFIED BY '12341234' 
PASSWORD EXPIRE INTERVAL 365 DAY;

GRANT ALL PRIVILEGES ON adminviviendas.* TO orgAdmin
WITH GRANT OPTION;

Show grants for 'orgAdmin';


-- Usuario empleado o para un programa el cual solo necesite consultar datos del SGBD

CREATE USER 'emp2'@'localhost'
IDENTIFIED BY '1234' 
PASSWORD EXPIRE INTERVAL 60 DAY;

GRANT SELECT ON adminviviendas.*
TO 'emp1'@'localhost';

-- Usuario encargado de administrar la adicción o eliminación de datos del sistema 

CREATE USER 'dataEditor1'@'localhost'
IDENTIFIED BY '1111' 
PASSWORD EXPIRE INTERVAL 60 DAY;

GRANT INSERT, UPDATE, DELETE, SELECT
ON adminviviendas.* 
TO 'dataEditor1'@'localhost';

-- Usuario destinado a ser usado por una aplicacion web

CREATE USER 'webAppUser'@'localhost'
IDENTIFIED BY '1111'
REQUIRE SSL;

GRANT INSERT, SELECT, UPDATE 
ON adminviviendas.* 
TO 'webAppUser'@'localhost';



