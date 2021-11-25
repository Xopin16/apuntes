--1.lunes de febrero o viernes de marzo

SELECT inmueble.*
FROM inmueble JOIN operacion USING (id_inmueble)
			JOIN vendedor USING (id_vendedor)
WHERE ((TO_CHAR (fecha_operacion, 'MM') = '02'
  AND TO_CHAR (fecha_operacion, 'ID') = '1')
   OR (TO_CHAR (fecha_operacion, 'MM') = '03'
  AND TO_CHAR (fecha_operacion, 'ID') = '5'))
  AND superficie > 200
  AND nombre ILIKE '%A%';
  
SELECT inmueble.*
FROM inmueble JOIN operacion USING (id_inmueble)
			JOIN vendedor USING (id_vendedor)
WHERE ((TO_CHAR (fecha_operacion, 'MM') = '02'
  AND TO_CHAR (fecha_operacion, 'ID') = '1')
   OR (TO_CHAR (fecha_operacion, 'MM') = '03'
  AND TO_CHAR (fecha_operacion, 'ID') = '5'))
  AND superficie > 200
  AND nombre ILIKE '%A%';

  
--Selecciona el precio medio por metro cuadrado de los alquileres de viviendas en 
--los meses de marzo y abril de cualquier año para 
--las provincias costeras de Andalucía.
SELECT DISTINCT nombre
from tipo;

SELECT AVG (precio_final/superficie)
FROM tipo JOIN inmueble ON (id_tipo = tipo_inmueble)
			JOIN operacion USING (id_inmueble)
WHERE EXTRACT (month from fecha_operacion) IN (3,4)
  AND provincia IN ('Huelva', 'Cádiz', 'Almería','Granada', 'Málaga')
  AND tipo_operacion = 'Alquiler'
  AND nombre IN ('Casa', 'Piso');
 
--¿Cuál es la media del porcentaje de diferencia entre el precio inicial (en la tabla inmueble) 
/*y el precio final (en la tabla operación) para aquellas operaciones de alquiler realizadas 
en enero de cualquier año, 
donde el tipo del inmueble es Oficina, Local o Suelo?*/

SELECT AVG(((precio / precio_final)*100)-100)
FROM tipo JOIN inmueble ON (tipo_inmueble = id_tipo)
		JOIN operacion USING (id_inmueble)
WHERE nombre IN ('Oficina', 'Local', 'Suelo')
  AND tipo_operacion = 'Alquiler'
  AND EXTRACT (month from fecha_operacion) = 1;
  
--Seleccionar el nombre de aquellos compradores de Casa o Piso en las provincias de Jaén 
--o Córdoba, donde el precio final de inmueble esté entre 150.000 y 200.000€, para aquellos 
--inmuebles que han tardado entre 3 y 4 meses en venderse.

SELECT co.nombre
FROM comprador co JOIN operacion USING (id_cliente)
			JOIN inmueble i USING (id_inmueble) 
			JOIN tipo ti ON (ti.id_tipo = i.tipo_inmueble)
WHERE ti.nombre IN ('Casa','Piso')
  AND provincia IN ('Jaén', 'Córdoba')
  AND precio_final BETWEEN 150000 AND 200000
  AND (fecha_operacion BETWEEN fecha_alta + '3 month'::interval
  						   AND fecha_alta + '4 month'::interval);

/*Selecciona la media del precio inicial (en la tabla inmueble),
del precio final (en la tabla operación) y de la diferencia en porcentaje entre ellas de aquellas 
viviendas (Casa o Piso) en alquiler que tengan menos de 
100 metros cuadrados y que hayan tardado un año o más en alquilarse.*/

SELECT AVG (precio) AS "media_precio_inicial",
		AVG (precio_final) AS "media_precio_final",
		AVG(((precio/ precio_final)*100)-100) AS "media_diferencia"
FROM inmueble i JOIN tipo ti ON (ti.id_tipo = i.tipo_inmueble)
				JOIN operacion USING (id_inmueble) 
WHERE ti.nombre IN ('Casa', 'Piso')
  AND superficie < 100
  AND tipo_operacion = 'Alquiler'
  AND fecha_operacion >= fecha_alta + '1 year'::interval; 
  
--6
SELECT *
FROM tipo ti JOIN inmueble ON (ti.id_tipo = tipo_inmueble)
    	JOIN operacion USING (id_inmueble)
WHERE tipo_operacion = 'Alquiler'
  AND ti.nombre in('Piso', 'Casa')
  AND EXTRACT (month from fecha_operacion) IN ('07', '08')
  AND provincia = 'Huelva'
ORDER BY precio_final desc
LIMIT 1;
