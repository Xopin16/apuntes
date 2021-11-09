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
  