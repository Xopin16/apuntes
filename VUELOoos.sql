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

SELECT *
FROM vuelos
WHERE salida > now();

--intervalo de salida del vuelo se solape
SELECT *
FROM vuelos;
WHERE ('2021-02-01'::date, '2021-06-30'::date)
		OVERLAPS
		(salida,llegada);
--SELECT o WHERE OVERLAPS para base de datos que tengan un par de fechas
--Inicio fin de intervalo e inicio fin de intervalo

SELECT id, TO_CHAR (salida, 'DD/MM/YYYY HH24:MI:SS'),
		desde, TO_CHAR (llegada, 'DD/MM/YYYY HH24:MI:SS'),
		hasta
FROM vuelos;
--seleccionar los vuelos q salieron en la 4 semana del año
SELECT *
FROM vuelos
WHERE TO_NUMBER
(TO_CHAR (salida,'IW')'99')= 4;
-- "" "" "" el dia del informatico =256
SELECT *
FROM vuelos 
WHERE TO_CHAR (salida, 'DDD') = '256';
--ABRIL MAYO O JUNIO
SELECT *
FROM vuelos
WHERE TO_CHAR (salida, 'MM') IN ('04','05','06');