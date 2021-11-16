SELECT CURRENT_DATE;
SELECT CURRENT_TIME;
SELECT CURRENT_TIMESTAMP;
SELECT LOCALTIME;
SELECT LOCALTIMESTAMP;

--ENTRADAS
SELECT current_date + '1-2'::interval;
SELECT current_date + '35 04:20:30'::interval;
SELECT '1 year 2 months 3 days 4 hours 5 minutes 6 seconds'::interval;
SELECT '1-2'::interval + '3 04:05:06'::interval;
--SALIDAS
SELECT CURRENT_DATE +1; --SUMA DÍAS, SE PUEDE SELECT Y EN EL WHERE.
SELECT CURRENT_DATE -1; --RESTA DÍAS.

SELECT CURRENT_DATE + '1 hour'::interval;  --SUMA 1 HORA
SELECT CURRENT_DATE '1 day'::interval + '1 day'::interval;

SELECT CURRENT_TIMESTAMP - '1 hour 15 minutes'::interval;
SELECT CURRENT_TIME + '3 04:40:40'::interval;
SELECT CURRENT_DATE - '1 day'::interval;

SELECT CURRENT_TIME - MAKE_TIME(8,0,0);
SELECT CURRENT_DATE - MAKE_DATE(1996,9,7); --POSITIVA
SELECT MAKE_DATE(1996,9,7) - CURRENT_DATE; --OPERACION NEGATIVA
SELECT CURRENT_TIMESTAMP -
		MAKE_TIMESTAMP(1996,9,7,0,0,0);
SELECT '1 sec'::interval * 900;
SELECT '1 day'::interval* 21.5;
SELECT '1 month 1 day'::interval * 2; --DOBLE DE DIAS
SELECT '1 month 1 day'::interval / 2; --MITAD DE DIAS
SELECT AGE(MAKE_TIMESTAMP(1996,9,7,0,0,0));
SELECT DATE_PART('year',AGE(MAKE_TIMESTAMP(1996,9,7,0,0,0))); --SACAR UN CACHO DE UNA FECHA
SELECT DATE_TRUNC('hour', timestamp '1996-02-16 20:38:40');
SELECT DATE_TRUNC('day', timestamp '1996-02-16 20:38:40');

SELECT EXTRACT (hour from CURRENT_TIMESTAMP); --SACA UNA PARTE Y LA DEVUELVE COMO UN NUMERO
SELECT EXTRACT (day from CURRENT_TIMESTAMP);
