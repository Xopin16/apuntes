/*Seleccionar los nombres de los productos que hayan sido solicitados en pedidos que 
hayan sido enviados por la empresa United Package.
Seleccionar el nombre del producto y el de su categoría que se hayan incluido en 
algún pedido, para todos aquellos pedidos solicitados en un día de Agosto
Seleccionar el nombre de todas las empresas que sean clientes, hayan realizado pedidos o no.
Seleccionar el nombre de los empleados que han atendido pedidos realizados por clientes de 
Brasil (Brazil).
Seleccionar el nombre de la categoría y los productos que se han pedido en aquellos pedidos 
que han sido atendidos por Janet Leverling (EMPLOYEE).*/
--1
SELECT DISTINCT product_name
FROM products JOIN order_details USING (product_id)
			JOIN orders o USING (order_id)
			JOIN shippers s ON (o.ship_via = s.shipper_id)
WHERE company_name ILIKE 'united package'
  AND units_on_order > 0;
--2 Seleccionar el nombre del producto y el de su categoría que se hayan incluido en 
--algún pedido, para todos aquellos pedidos solicitados en un día de Agosto
SELECT DISTINCT product_name, category_name
FROM categories JOIN products USING (category_id)
				JOIN order_details USING (product_id)
				JOIN orders USING (order_id)
WHERE TO_CHAR (order_date, 'MM') = '08'
  AND units_on_order > 0;
--Seleccionar el nombre de todas las empresas que sean clientes, hayan realizado pedidos o no.
SELECT DISTINCT company_name
FROM customers JOIN orders USING (customer_id)
			JOIN order_details USING (order_id)
			JOIN products USING (product_id)
WHERE units_on_order >= 0;
--Seleccionar el nombre de los empleados que han atendido pedidos realizados por clientes de 
--Brasil (Brazil)
SELECT DISTINCT first_name , last_name
FROM employees e JOIN orders USING (employee_id)
				JOIN customers cu USING (customer_id)
WHERE cu.country = 'Brazil';
--Seleccionar el nombre de la categoría y los productos que se han pedido en aquellos pedidos 
--que han sido atendidos por Janet Leverling (EMPLOYEE)
SELECT DISTINCT product_name, category_name
FROM categories JOIN products USING (category_id)
				JOIN order_details USING (product_id)
			JOIN orders USING (order_id)
			JOIN employees USING (employee_id)		
WHERE (first_name = 'Janet'
  AND last_name = 'Leverling')
  AND units_on_order > 0;

Selecciona el telefono de shipper, el numero de envio, la fecha de envio y la region donde el
telefono contenga el número 199, este entre en los numeros de envio 1 y 3 y la fecha de envio este en
Noviembre

SELECT s.phone, o.ship_via, o.order_date, cu.region
FROM shippers s JOIN orders o ON (s.shipper_id = o.ship_via)
			    RIGHT JOIN customers cu USING (customer_id)
WHERE s.phone ILIKE '%199%'
  AND o.ship_via IN ('1','2','3')
  AND TO_CHAR (order_date, 'MM') = '11'
ORDER BY random();