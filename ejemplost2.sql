select *
from departments, employees;

select count (*)
from employees;

select count (*)
from departments;

select count (*)
from departments, employees;

SELECT department_name, first_name, last_name
FROM departments, employees;

SELECT department_name, first_name, last_name
FROM departments, employees
order by employees;

SELECT *
FROM departments, employees
WHERE departments.department_id =
		employees.department_id
order by employee_id;
--usar alias
SELECT department_name, first_name, last_name, salary
FROM departments d, employees e
WHERE d.department_id = e.department_id
  and salary > 5000
order by employee_id;

select department_name, e.first_name, 
		e.last_name, de.first_name, 
		de.last_name, relationship
from departments d, employees e, dependents de
where d.department_id = e.department_id
  and e.employee_id = de.employee_id
order by department_name, e.last_name;

SELECT *
from employees join departments using (departments_id)

--consultas con clave externa en la misma tabla (empleados a la izquierda, jefes a la derecha)
SELECT e1.employee_id, e1.first_name,
		e1.last_name, e1.manager_id,
		e2.employee_id, e2.first_name,
		e2.last_name
from employees e1 join employees e2 
				on (e1.manager_id = e2.employee_id);
--seleccionar el nombre del departamento,
-- el nombre y los apellidos de aquellos empleadps 
--cuyo nombre de departamento empieza por A

--Cuando la claves externas se llaman igual 
SELECT department_name, first_name, last_name
from departments JOIN employees USING (department_id)
where  department_name ILIKE '%A%';


--cuando las claves externas se llaman difeerente
SELECT department_name, first_name, last_name
from departments d JOIN employees e on (d.department_id = e.department_id)
where  department_name ILIKE '%A%';

--seleccion el nombre de la region,
-- el nombre y apellidos de cada emepleado

--mi intento
select region_name, first_name, last_name 
from regions join countries using (region_id);
--solucion
select region_name, first_name, last_name
from employees join departments using (department_id)
				join locations using (location_id)
				join countries using (country_id) 
				join regions using (region_id);
				
select *
from locations join countries using (country_id)
		join regions using (region_id);
		
select *
from regions using countries using (region_id)
		join locations using (country_id);

select *
from jobs;

select *
from departments;

select *
from employees;

--1
select first_name, last_name, email
from employees join departments using (department_id)
		join locations using (location_id)
		join countries using (country_id)
where country_name ILIKE 'united kingdom';

select department_name
from departments join employees using (department_id)
where hire_date::text ilike '1993%';



--Seleccionar la región de los empleados con un salario inferior a 10000$

select distinct region_name
from employees join departments using (job_id)
		join locations using (country)
		join region (region_id)
where min_salary <10000;

select distinct region_name
from regions join countries using (region_id)
			join locations using (country_id)
			join departments using (location_id)
			join employees using (department_id)
			join jobs using (job_id)
where salary <10000;
			
--select first_name, last_name 
--from employees  join dependents using (employee_id)
--where last_name ilike 'd%'
	--or last_name ilike 'h%'
	--or last_name ilike 's%';
	
select  e1.first_name, e1.last_name
from employees e1 join employees e2 on (e1.manager_id = e2.employee_id )
where (e2.last_name ilike 'd%'
	or e2.last_name ilike 'h%'
	or e2.last_name ilike 's%');
	
--por la izquierda salen todos los empleados aunque no tengan ninguna correspondencia. 
select first_name, last_name, coalesce (department_name, 'sin departamento')
from employees left outer join departments 
		using (department_id);
--por la derecha 
select first_name, last_name, coalesce (department_name, 'sin departamento')
from departments right outer join employees 
		using (department_id);
--full join es para que aparezcan las dos cosas
select first_name, last_name, coalesce (department_name, 'sin departamento')
from departments full join employees 
		using (department_id);
--empleados que lleven contratados menos tiempo que alexander cock
select *
from employees em1 cross join employees em2
where em2.first_name = 'Alexander'
   and em2.last_name = 'Khoo'
   and em1.hire_date < em2.hire_date;


