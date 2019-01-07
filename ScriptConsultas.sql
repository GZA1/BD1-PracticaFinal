-- Consultas a realizar

-- Un listado con las viviendas vacías en cada zona urbana y municipio.
select v.nºCatastro, calle, num, piso, b.nombre as nombreBarrio, m.nombre as nombreMunicipio
	from viviendas v, barrios b, municipios m
    where v.idBarrios = b.idBarrios and b.idMunicipio = m.idMunicipio and v.nºCatastro in(
		select viviendas.nºCatastro
			from viviendas
			left join ocupantes on(viviendas.nºCatastro=ocupantes.nºCatastro)
			where ocupantes.nºCatastro is null 
		)
    order by m.nombre, b.nombre, v.calle;

-- Listado de las viviendas habitadas por una única persona de más de 70 años y los datos del barrio donde se ubican.
select o.nºCatastro, calle, num, piso, b.idBarrios, b.nombre as nombreBarrio, area as areaBarrio, coord as coordenadasBarrio,
zipCode as codigoPostalBarrio, avgM2price as mediaCosteMetroCuadrado 
	from viviendas v, barrios b, ocupantes o
    where v.idBarrios = b.idBarrios and o.nºCatastro = v.nºCatastro and ( year(now()) - year(o.fNac) > 70 );
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- Borrador -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
show databases;
use adminviviendas;
show tables;
select year(now());
select * from ocupantes;
select * from viviendas;
select * from propietarios;
select * from barrios;
select * from municipios;
select * 
	from ocupantes
    where nºCatastro='9110254 WS448O 3354 QW'; -- Tiene dos ocupantes esta casa
select p.dni
	from propietarios p, ocupantes o
    where p.dni = o.dni;
select *
	from viviendas
    left join ocupantes on(viviendas.nºCatastro=ocupantes.nºCatastro)
    where ocupantes.nºCatastro is null;