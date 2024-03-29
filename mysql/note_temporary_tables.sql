-- TEMPORARY TABLES
show databases;
use pagel_2182;
show tables from pagel_2182;

/* In this lesson, we will change the data in rows in a table, drop rows from a table, 
and change the structure of a table. This can be useful for the temporary tables that we create. 
However, you generally do not want to do this on actual production database tables. 

TEMP TABLES WILL NOT SHOW UP IN YOUR LIST OF TABLES!

When we USE THIS:
	querying an obscene amount of data, can use to essentially copy a table to perform two different actions
	will be deleted if crashed or closed out...

*/

-- create a temp table called my_numbers with two columns n & name

create temporary table my_numbers
	(			-- > columns are contained in paran
	n int unsigned not null, -- > first column
    name varchar(20) not null -- > second column
	)
;

-- view created table
select *
from my_numbers
; -- n and name

-- insert values
insert into my_numbers (n, name) 
values (1, 'a'), (2, 'b'), (3, 'c'), (4, 'd')
;

-- update values
update my_numbers 
SET name = 'BIG'
where n >= 4;

-- delete values
delete
from my_numbers
where n = 2
;

-- create temp table from query
use employees;

-- query: find all current employees in customer service with current salary
select *
from employees
	join dept_emp using (emp_no)
    join salaries using (emp_no)
    join departments using (dept_no)
where salaries.to_date > now()
    and dept_emp.to_date > now()
    and dept_name = 'Customer Service'
;

-- create a temp table from above query
create temporary table pagel_2182.curr_emp -- > have to write to your db
(
select employees.*, salary, dept_name
from employees
	join dept_emp using (emp_no)
    join salaries using (emp_no)
    join departments using (dept_no)
where salaries.to_date > now()
    and dept_emp.to_date > now()
    and dept_name = 'Customer Service'
)
; -- > Error Code: 1060. Duplicate column name 'from_date'

-- to address ^^ select employees.*, salary, dept_name ?? How and why did that work ??

select *
from pagel_2182.curr_emp
; -- > calling your temp table from your db

select *
from pagel_2182.curr_emp
; -- > works

select avg(salary)
from pagel_2182.curr_emp
; -- > Error Code: 1146. Table 'employees.curr_emp' doesn't exist

-- Add a new column for avg salary in temp table
ALTER TABLE pagel_2182.curr_emp -- adding a new column to temp table
add avg_dept_salary float -- specifiying the datatype
;

-- Update table and hard code a value in
UPDATE pagel_2182.curr_emp
SET avg_dept_salary = '67285.2302' -- have to hard code this value
;

-- Deleting table
DROP table pagel_2182.curr_emp;

-- VERIFY drop
select * from pagel_2182.curr_emp;


-- current average pay per dept
select rd avg_salary, d.dept_name dept_name
from
(select round(avg(salary),0) as rd, dept_no
from	(select emp_no, salary, dept_no
		from (select emp_no, salary, to_Date
				from salaries s
				where to_date >= curdate()
				) as a
		join dept_emp de using (emp_no)
		where de.to_date >= curdate()
		) as b
group by dept_no
) as c
join departments d using (dept_no)
group by dept_no
;

-- current pay at company
select emp_no, salary
from salaries
where to_date > now()
;

-- avg and std
select avg(salary), std(salary)
from salaries
where to_date > now()
;

-- z-score
-- Returns the current z-scores for each salary
-- Notice that there are 2 separate scalar subqueries involved
SELECT salary, d.departments
	(salary - (SELECT AVG(salary) FROM salaries where to_date > now()))
	/
	(SELECT stddev(salary) FROM salaries where to_date > now()) AS zscore
FROM salaries
join dept_emp using (emp_no)
join departments d using (dept_no)
WHERE to_date > now()
;

use employees;
create temporary table pagel_2182.zscores2
(SELECT departments.*, salary,
        (salary - (SELECT AVG(salary) FROM salaries where to_date > now()))
        /
        (SELECT stddev(salary) FROM salaries where to_date > now()) AS zscore
    FROM salaries
    join dept_emp using (emp_no)
    join departments using (dept_no)
    WHERE salaries.to_date > now()
)
;
/*Error Code: 1370. execute command denied to user 'pagel_2182'@'%' for routine 'employees.dept_name'
	fixed */
select * from pagel_2182.zscores2;
select * from pagel_2182.zscores2
order by zscore desc;
select * from pagel_2182.zscores2
order by zscore;
-- The best dept is Sales
select avg(salary), dept_name, max(zscore), min(zscore)
from (select * from pagel_2182.zscores2) as b
group by dept_name
order by max(zscore)
;
-- The worst dept is Human Resources NOT production! 
select avg(salary), dept_name, max(zscore), min(zscore)
from (select * from pagel_2182.zscores2) as b
group by dept_name
order by min(zscore)
;

-- CAN USE 'DROP TABLE IF EXISTS <TABLE_NAME>' AND JUST RECREATE THE TABLE USING THE UPDATEC INFORMATION INSTEAD OF UPDATING THE TABLE

