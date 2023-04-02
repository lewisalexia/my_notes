-- Subqueries 

use employees;

-- Scalar Subqueries
SELECT emp_no, salary
FROM salaries
WHERE salary > 
	(SELECT AVG(salary) FROM salaries WHERE to_date > CURDATE())
AND to_date > CURDATE()
;

-- Column Subqueries
SELECT first_name, last_name, birth_date
FROM employees
WHERE emp_no IN (
    SELECT emp_no
    FROM dept_manager
)
LIMIT 10;

-- Row Subqueries
SELECT first_name, last_name, birth_date
FROM employees
WHERE emp_no = (
    SELECT emp_no
    FROM employees
    WHERE emp_no = 101010
);

-- Table Subqueries
SELECT g.first_name, g.last_name, salaries.salary
FROM
    (
        SELECT *
        FROM employees
        WHERE first_name like 'Geor%'
    ) as g
JOIN salaries ON g.emp_no = salaries.emp_no
WHERE to_date > CURDATE()
;


























-- 12. Bonus Who is the highest paid employee within each department.

-- MAIN TABLE
/* select *
from salaries
join employees on salaries.emp_no = employees.emp_no
join dept_emp on employees.emp_no = dept_emp.emp_no
join departments on dept_emp.dept_no = departments.dept_no
where salaries.to_date = '9999-01-01'
	and dept_emp.to_date = '9999-01-01'
;
*/ 

-- 1. display main table
-- 2. filter to see employee names
-- 3. filter to see salaries
-- 4. filter to see department
-- 5. group by ^^? select max(salary), employee name, dept

select *
from departments; -- dept_no, dept_name
select *
from salaries; -- emp_no, salary, to_date
select *
from dept_emp; -- emp_no, dept_no, to_date
select *
from employees; -- emp_no, first_name, last_name


-- 1. display main table
select *
from salaries
join employees on salaries.emp_no = employees.emp_no
join dept_emp on employees.emp_no = dept_emp.emp_no
join departments on dept_emp.dept_no = departments.dept_no
where salaries.to_date = '9999-01-01'
	and dept_emp.to_date = '9999-01-01'
;
-- 2. filter to see employee names
select a.employee

from (select CONCAT(employees.first_name,' ', employees.last_name) as employee
from salaries
join employees on salaries.emp_no = employees.emp_no
join dept_emp on employees.emp_no = dept_emp.emp_no
join departments on dept_emp.dept_no = departments.dept_no
where salaries.to_date = '9999-01-01'
	and dept_emp.to_date = '9999-01-01') as a
;
    
-- 3. filter to see salaries
select a.employee, a.emp_salary, a.employees_num

from (select CONCAT(employees.first_name,' ', employees.last_name) as employee, salaries.salary as emp_salary, employees.emp_no as employees_num
from salaries
join employees on salaries.emp_no = employees.emp_no
join dept_emp on employees.emp_no = dept_emp.emp_no
join departments on dept_emp.dept_no = departments.dept_no
where salaries.to_date = '9999-01-01'
	and dept_emp.to_date = '9999-01-01') as a

;

-- 4. filter to see department ** have to subquery again? REMOVED join departments and will join on seperate table?
-- departments table 
select *
from departments
join dept_emp on departments.dept_no = dept_emp.dept_no
;
   
   
select max(emp_salary), depts_name, employee
from
(select a.emp_salary, b.dept_name as depts_name, a.employee
from (select CONCAT(employees.first_name,' ', employees.last_name) as employee, salaries.salary as emp_salary, employees.emp_no
from salaries
join employees on salaries.emp_no = employees.emp_no
join dept_emp on employees.emp_no = dept_emp.emp_no
where salaries.to_date = '9999-01-01'
	and dept_emp.to_date = '9999-01-01') as a

join

(select departments.dept_no as dept_num, dept_emp.dept_no as dept_emp_no, departments.dept_name
from departments
join dept_emp on departments.dept_no = dept_emp.dept_no
where dept_emp.to_date = '9999-01-01') as b

on dept_num = dept_emp_no) as c
group by depts_name, employee
;

    
-- 5. group by ^^? select max(salary), employee name, dept
use employees;

select max(emp_salary), employee, depts_name
from

 (select a.employee, a.emp_salary, b.dept_num, b.dept_emp_no, a.emp_no as employ_num, b.dept_name as  depts_name
from (select CONCAT(employees.first_name,' ', employees.last_name) as employee, salaries.salary as emp_salary, employees.emp_no
from salaries
join employees on salaries.emp_no = employees.emp_no
join dept_emp on employees.emp_no = dept_emp.emp_no
where salaries.to_date = '9999-01-01'
	and dept_emp.to_date = '9999-01-01') as a

join

(select departments.dept_no as dept_num, dept_emp.dept_no as dept_emp_no, departments.dept_name
from departments
join dept_emp on departments.dept_no = dept_emp.dept_no
where dept_emp.to_date = '9999-01-01') as b

on dept_num = dept_emp_no) as c

group by employee, depts_name
;

select *
from departments;

select max(a.emp_salary), a.dept_name as depts_name, a.employee
from (select CONCAT(employees.first_name,' ', employees.last_name) as employee, salaries.salary as emp_salary, employees.emp_no, departments.dept_name
from salaries
join employees on salaries.emp_no = employees.emp_no
join dept_emp on employees.emp_no = dept_emp.emp_no
join departments on dept_emp.dept_no = departments.dept_no
where salaries.to_date = '9999-01-01'
	and dept_emp.to_date = '9999-01-01') as a
group by depts_name, a.employee
;

select *
from departments; -- dept_no, dept_name
select *
from salaries; -- emp_no, salary, to_date
select *
from dept_emp; -- emp_no, dept_no, to_date
select *
from employees; -- emp_no, first_name, last_name


select employee, max(salary), dept_name
from (

select d. dept_name as dept_name
from dept_emp as de
join departments as d on de.dept_no = d.dept_no
group by dept_name) as c
,

(select a.employee as employee, b.salary as salary
from
(select CONCAT(e.first_name,' ',e.last_name) as employee, e.emp_no as emps_num
from employees as e) as a

join

(select salary, salaries.emp_no as s_emps_num
from salaries
where to_date = '9999-01-01'
order by salary desc) as b

on emps_num = s_emps_num) as d

group by -- ????
;

-- 12. Bonus Who is the highest paid employee within each department.
select *
from departments; -- dept_no, dept_name
select *
from salaries; -- emp_no, salary, to_date
select *
from dept_emp; -- emp_no, dept_no, to_date
select *
from employees; -- emp_no, first_name, last_name

-- Department names and current managers

select concat(employees.first_name,' ',employees.last_name) as employee, departments.dept_name as dept_name
from dept_emp
join employees using (emp_no)
join departments using (dept_no)
where to_date = '9999-01-01'
;
