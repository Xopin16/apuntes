/*S1eleccionar el COMPANY_NAME y CONTACT_NAME de aquellos CUSTOMERS que hayan hecho pedidos (ORDERS).
2Seleccionar el número de pedidos que hemos enviado en la década de los 90 con las empresas Federal Shiping o United Package.
3Seleccionar el nombre de aquellos productos que han sido solicitados en algún pedido.
4Seleccionar la suma de los importes "cobrados" en todos los pedidos realizados en el año 96.
5Seleccionar el nombre de contacto del cliente y el del empleado para aquellos clientes y 
empleados que han participado en pedidos donde la diferencia entre la fecha de envío y la fecha 
de requisito sea menos de 20 días*/

SELECT *
FROM products, order_details;

SELECT *
FROm products;

SELECT *
FROM employee_territories;

SELECT *
FROM order_details, orders;

SELECT company_name, contact_name
FROM customers JOIN orders o USING (customer_id)
			join shippers s on (o.ship_via = s.shipper_id)
WHERE order_id IS NOT NULL;

SELECT *
FROM shippers s JOIN orders o ON (s.shipper_id = o.ship_via)
				JOIN customers cu ON (s.company_name = cu.company_name);

SELECT count (order_id)
FROM shippers s JOIN orders o ON (s.shipper_id = o.ship_via)
WHERE company_name IN ('United Package', 'Federal Shipping')
  and EXTRACT (year from shipped_date) IN (1990,1991,1992,1993,1994,1995,1996,1997,1998,1999);

SELECT count (order_id)
FROM shippers s JOIN orders o ON (s.shipper_id = o.ship_via)
WHERE company_name IN ('United Package', 'Federal Shipping')
  and shipped_date::text ILIKE '199%';

SELECT DISTINCT product_name
FROM products JOIN order_details USING (product_id)
			JOIN orders USING (order_id)
WHERE units_on_order > 0;

SELECT SUM (unit_price*quantity*(1-discount))
FROM order_details JOIN orders USING (order_id)
WHERE extract(year from order_date) IN (1996);

SELECT first_name, last_name, contact_name, required_date, shipped_date
FROM employees JOIN orders USING (employee_id)
				JOIN customers USING (customer_id)
WHERE required_date - shipped_date < 20;

SELECT first_name, shipped_date, territory_id
FROM shippers s JOIN orders o ON  (s.shipper_id = o.ship_via)
				JOIN employees USING (employee_id)
				JOIN employee_territories USING (employee_id)
WHERE first_name ILIKE '_a%'
  AND extract (days from shipped_date) IN (7)
  and (territory_id ILIKE '45%'
   or territory_id ILIKE '44%')
ORDER BY random();

SELECT first_name, shipped_date, territory_id
FROM shippers s JOIN orders o ON  (s.shipper_id = o.ship_via)
				JOIN employees USING (employee_id)
				JOIN employee_territories USING (employee_id)
WHERE first_name ILIKE '_a%' 
  AND extract (days from shipped_date) IN (7)
  and (territory_id ILIKE '45%'
   or territory_id ILIKE '44%')
ORDER BY random();




