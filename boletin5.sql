--Selecciona el top 3 de pisos vendidos más caros en Sevilla a lo largo 
--del año 2019 (puedes investigar el uso de LIMIT para hacerlo)
SELECT *
FROM tipo JOIN inmueble ON (id_tipo = tipo_inmueble)
		JOIN operacion USING (id_inmueble)
WHERE provincia = 'Sevilla'
  AND tipo_operacion = 'Venta'
  AND nombre = 'Piso'
  AND TO_CHAR (fecha_operacion, 'YYYY') = '2019'
 ORDER BY precio_final DESC
 LIMIT 3;
--Selecciona el precio medio de los alquileres en Málaga en los meses 
--de Julio y Agosto (da igual de qué año).
SELECT *
from inmueble;

SELECT AVG (precio_final) 
FROM inmueble JOIN operacion USING (id_inmueble)
WHERE TO_CHAR (fecha_operacion, 'MM') IN ('07','08')
  AND tipo_operacion = 'Alquiler'
  AND provincia = 'Málaga';
--Selecciona los inmuebles que se han vendido en Jaén y Córdoba 
--en los últimos 3 meses del año 2019 o 2020.

SELECT inmueble.*
FROM inmueble JOIN operacion USING (id_inmueble)
				
WHERE provincia IN ('Jaén', 'Córdoba')
  AND tipo_operacion = 'Venta'
  AND TO_CHAR (fecha_operacion, 'YYYY') IN ('2019','2020')
  AND TO_CHAR (fecha_operacion, 'MM') IN ('10','11','12');
 --Selecciona el precio medio de las ventas de Parking en la provincia
 --de Huelva para aquellas operaciones que se realizaran entre semana (de Lunes a Viernes).
 SELECT AVG (precio_final)
 FROM tipo ti JOIN inmueble i ON (id_tipo = tipo_inmueble)
 				JOIN operacion USING (id_inmueble)
 WHERE provincia = 'Huelva'
   AND nombre = 'Parking'
   AND tipo_operacion = 'Venta'
   AND TO_CHAR (fecha_operacion, 'D') BETWEEN '2' AND '6';
   
 --Selecciona aquellos pisos que 
 --han tardado en venderse entre 3 y 6 meses en la provincia de Granada.
 
SELECT *
FROM tipo JOIN inmueble ON (id_tipo = tipo_inmueble)
		JOIN operacion USING (id_inmueble)
WHERE (fecha_operacion BETWEEN fecha_alta + '3 month'::interval AND
		fecha_alta + '6 month'::interval)
  AND tipo_operacion = 'Venta'
  AND nombre = 'Piso'
  AND provincia = 'Granada';
  
--Selecciona el id_inmueble de los pisos donde la fecha de operacion sea 2020 o 2019
--para la provincia de Almería que cuyo tipo de operacion sea Venta. Ordena la salida
--aleatoriamente.

SELECT id_inmueble
FROM tipo JOIN inmueble ON (id_tipo = tipo_inmueble)
		JOIN operacion USING (id_inmueble)
WHERE provincia IN ('Almería')
  AND tipo_operacion = 'Venta'
  AND nombre = 'Piso'
  AND TO_CHAR (fecha_operacion, 'YYYY') IN ('2020', '2019')
ORDER BY random ();

   
 