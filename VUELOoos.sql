-- SELECCIONAR AQUELLOS VUELS CUYA DURACION HAYA SIDO D ENTRE 90 Y 110 MINUTOS

select *
from vuelos;

select vuelos.*, llegada-salida
FROM vuelos
WHERE llegada BETWEEN 
		salida + '90 min'::interval AND
		salida + '110 min'::interval;

SELECT vuelos.*, llegada-salida
FROM vuelos
WHERE llegada - salida BETWEEN 
		'90 min'::interval AND '110 min'::interval;
		
--SELECCIONAR LOS VUELOS QUJE SALIERON DE BERLIN O LLEGARON SEVILLA EN EL ULTIMO AÑO

SELECT *
from vuelos
WHERE salida >= (CURRENT_TIMESTAMP - '1 year'::interval)
  AND (desde ILIKE 'berlín'
   OR hasta ILIKE 'sevilla');
   
SELECT *
from vuelos
WHERE (salida >= CURRENT_TIMESTAMP
	  		- '1 year'::interval
	  		AND desde ILIKE 'sevilla')
		or (llegada >= CURRENT_TIMESTAMP
	  		- '1 year'::interval
	  		AND hasta ILIKE 'berlín');
			
SELECT TO_CHAR (CURRENT_TIMESTAMP, 'DD/MM/YYYY');
SELECT TO_TIMESTAMP ('18/09/1992 12:15:00', 'DD/MM/YYYY HH24:MI:SS');