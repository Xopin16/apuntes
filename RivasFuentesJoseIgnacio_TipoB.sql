
--1
SELECT ROUND (AVG (racha_viento),2) AS "racha_media"
FROM climatologia
WHERE provincia IN ('A Coruña', 'Ourense', 'Lugo', 'Pontevedra')
  AND racha_viento >50
  AND fecha::text ILIKE '2019-05%';
--2
SELECT climatologia.*, (temperatura_maxima+temperatura_minima/2) AS "temperatura_media_calculada"
FROM climatologia
WHERE (estacion ILIKE '%Á%'
   OR estacion ILIKE '%É%'
   OR estacion ILIKE '%Í%'
   OR estacion ILIKE '%Ó%'
   OR estacion ILIKE '%Ü%')
 AND fecha::text ILIKE '2019-01%';
--3
SELECT *
FROM climatologia
WHERE estacion ILIKE '%ón'
  AND (precipitacion_total BETWEEN 10 AND 20)
  AND (temperatura_minima < 10)
  AND (fecha::text ILIKE '2019-02%'
   OR fecha::text ILIKE '2019-03%')
ORDER BY random();
--4
SELECT estacion, provincia, fecha, temperatura_maxima, 
	CASE 
		WHEN temperatura_maxima >30 AND temperatura_maxima <35 THEN 'Caluroso'
		WHEN temperatura_maxima >=35 AND temperatura_maxima <38 THEN 'Muy caluroso'
		WHEN temperatura_maxima >=38 THEN 'Extremadamente caluroso'
	END AS "descripcion_temperatura"
FROM climatologia
WHERE temperatura_maxima > 30
  AND hora_temperatura_maxima ILIKE '17:00'
  AND (fecha::text ILIKE '2019-06%'
  OR fecha::text ILIKE '2019-07%')
ORDER BY temperatura_maxima DESC;
--5
SELECT provincia, estacion, fecha, velocidad_maxima_viento, racha_viento,
((racha_viento*velocidad_maxima_viento)/100) AS "Racha comparada viento"
FROM climatologia
WHERE velocidad_maxima_viento >= 60
 AND ( ((racha_viento*velocidad_maxima_viento)/100) 
 BETWEEN ((racha_viento*velocidad_maxima_viento)/100)*0.80
 AND ((racha_viento*velocidad_maxima_viento)/100)*0.60 )
ORDER BY provincia ASC, estacion ASC, fecha DESC;


