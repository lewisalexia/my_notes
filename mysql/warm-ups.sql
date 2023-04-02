-- using the chipotle database,
-- find how many times someone ordered a chicken or veggie bowl
-- with a quantity greater than 1

use chipotle;
select database();

show tables;

select *
from orders;

select quantity, item_name
from orders
where item_name in ('Chicken Bowl', 'Veggie Bowl')
	and quantity > 1
;
-- 35 rows

-- find all unique items with chicken
select distinct item_name
from orders
where item_name like '%chicken%'
;

select item_name -- cannot use * without providing an additional aggregate function, [think rectangle output]
from orders
where item_name like '%chicken%'
group by item_name
;

-- can group by multiple variables
-- find all unique combinations of items with chicken and their quantity
select item_name, quantity -- have to match
from orders
where item_name like '%chicken%'
group by item_name, quantity -- have to match
order by item_name
;

-- count & how many chicken bowls have been ordered?
select count(*), item_name
from orders
where item_name = 'Chicken Bowl'
;

-- for each chicken item, how many times was it ordered?
select distinct item_name, count(*)
from orders
where item_name like '%chicken%'
group by item_name
;

-- for each chicken item, how many items were actually sold?
select distinct item_name, sum(quantity)
from orders
where item_name like '%chicken%'
group by item_name
;

-- for each chicken item, what is the minimum, maximum, rounded average, sum, and count of order quantity
select distinct item_name, min(quantity), max(quantity), round(avg(quantity),1), sum(quantity), count(*)
from orders
where item_name like '%chicken%'
group by item_name
;

-- find all order items that have been ordered over 100 times
-- 1. group all items 2. get the count of each item_name 3. filter by counts greater than 100(having) 4. limit to top 5
select item_name, sum(quantity) as total_orders
from orders
group by item_name
having total_orders > 100
order by total_orders desc
limit 5
;

use employees;
select *
from employees;

show create table employees;

/* 'CREATE TABLE `employees` (
  `emp_no` int NOT NULL,
  `birth_date` date NOT NULL,
  `first_name` varchar(14) NOT NULL,
  `last_name` varchar(16) NOT NULL,
  `gender` enum(''M'',''F'') NOT NULL,
  `hire_date` date NOT NULL,
  PRIMARY KEY (`emp_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1' */

use salaries;
show create table salaries;

/*'CREATE TABLE `salaries` (
  `emp_no` int NOT NULL,
  `salary` int NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  PRIMARY KEY (`emp_no`,`from_date`),
  CONSTRAINT `salaries_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=latin1' */

describe titles;
show create table titles;

/* 
'CREATE TABLE `titles` (
  `emp_no` int NOT NULL,
  `title` varchar(50) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date DEFAULT NULL,
  PRIMARY KEY (`emp_no`,`title`,`from_date`),
  CONSTRAINT `titles_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=latin1'
*/

show create table dept_manager;

/* 'CREATE TABLE `dept_manager` (
  `emp_no` int NOT NULL,
  `dept_no` char(4) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  PRIMARY KEY (`emp_no`,`dept_no`),
  KEY `dept_no` (`dept_no`),
  CONSTRAINT `dept_manager_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `dept_manager_ibfk_2` FOREIGN KEY (`dept_no`) REFERENCES `departments` (`dept_no`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=latin1' */

show create table departments;

/* 'CREATE TABLE `departments` (
  `dept_no` char(4) NOT NULL,
  `dept_name` varchar(40) NOT NULL,
  PRIMARY KEY (`dept_no`),
  UNIQUE KEY `dept_name` (`dept_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1' */

show create table authors;

/* 'CREATE TABLE `authors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `first_name` (`first_name`,`last_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1' */

show create table dept_emp;

/* CREATE TABLE `dept_emp` (
  `emp_no` int NOT NULL,
  `dept_no` char(4) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  PRIMARY KEY (`emp_no`,`dept_no`),
  KEY `dept_no` (`dept_no`),
  CONSTRAINT `dept_emp_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `dept_emp_ibfk_2` FOREIGN KEY (`dept_no`) REFERENCES `departments` (`dept_no`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=latin1 */ 

-- HAS: dept_emp, dept_manager, employees, salaries, and titkes
-- DOES NOT HAS: authors, departments, and quotes

describe authors; -- pri and mul
describe departments; -- pri and uni
describe dept_emp; -- two pri
describe dept_manager; -- two pri
describe employees; -- pri
describe quotes; -- pri and uni
describe salaries; -- two pri
describe titles; -- 3 pri

ALTER TABLE quotes
ADD UNIQUE (identifier);

select database();

-- JOINING TABLES
select *
from employees
join dept_emp on employees.emp_no = dept_emp.emp_no; -- emp.no CAN be a different name in the other table but must be same value
-- I'm selecting everything from employees and I want to (inner)join this table on the dept_emp
-- table ON emp_no (what is the thing in common) is the same to the dept_emp.emp_no
-- left join returns everything in "from" and only matches in the right, vice-versa

select *
from departments;
select *
from dept_emp;
-- cannot have multiple emp_no but can have multiple employees in the same dept
-- known as one to many or many to one
-- one employee can only work in one dept (one-one)
-- many employees can work in the same department (many-one)
-- actors to movies (many-many)

-- Joining on multiple tables
select *
from employees
join dept_emp on employees.emp_no = dept_emp.emp_no
join departments on dept_emp.dept_no = departments.dept_no
;

-- selecting certain things from the tables
select employees.first_name,
		employees.last_name,
		departments.dept_name
from employees
join dept_emp on employees.emp_no = dept_emp.emp_no
join departments on dept_emp.dept_no = departments.dept_no
;

-- shorthand on joining multiple tables and selecting specific values AS ALIAS'S
select e.first_name,
		e.last_name,
		d.dept_name
from employees as e
join dept_emp as de on e.emp_no = de.emp_no
join departments as d on de.dept_no = d.dept_no
;

-- Aliasing using WHERE clause
select e.first_name,
		e.last_name,
		d.dept_name
from employees as e
join dept_emp as de on e.emp_no = de.emp_no
join departments as d on de.dept_no = d.dept_no
where e.gender = 'F' -- if you alias in one place you are going to have to alias throughout UNLESS it is totally unique
;

-- If they both share the same primary key as in physical name use below (more breakable)
select e.first_name,
		e.last_name,
		d.dept_name
from employees as e
join dept_emp as de using(emp_no)
join departments as d on de.dept_no = d.dept_no
;

-- JOINING, more

use join_example_db;
select *
from roles;

select *
from users
join roles on users.role_id = roles.id
;

select *
from users
left join roles on users.role_id = roles.id
;

select roles.name as role_name, count(users.name) as number_of_employees
from users
right join roles on users.role_id = roles.id
group by role_name
;

use employees;

-- warmup
-- Using the customer table from sakila database,
-- find the number of active and inactive users

use sakila;
show tables from sakila;
select *
from customer; -- cust_id, store_id, first and last name, active, create and last_update

select count(*)
from customer
where active = 1
; -- 584

select count(*)
from customer
where active = 0
; -- 15

select distinct email
from customer
where active = 1
;

select count(active)
from customers;


use sakila;
-- use the actor, film_actor, and film table
-- find all movies that 'Zero Cage' has been in
-- and make a new column that says if the movie
-- is rate R or not

show tables;

select *
from actor; -- actor_id, first and last, update date
select *
from film_actor; -- actor_id, film_id update date
select *
from film; -- film_id, title, desc, release_yr, language_id, rental_rate, legth, update date

select *, if(rating = 'R', 'Yes', 'Not Rated R') as is_rated_r
from(
select concat(actor.first_name,' ',actor.last_name) as fullname, title, rating
from actor
join film_actor using (actor_id)
join film using (film_id)
where actor.first_name = 'Zero'
	and actor.last_name = 'Cage'
) as cage_actor
;
-- rating r, filter

use employees;
show tables;

-- Find all employees who are current managers and make more than one 
-- standard deviation over the companies salary average.

select *
from departments; -- dept_no, dept_name
select *
from dept_emp; -- emp_no, dept_no, from and to_date
select *
from dept_manager; -- emp_no, dept_no, from and to_date
select *
from employees; -- emp_no, birth and hire_date, first and last_name, gender
select *
from salaries; -- emp_no, salary, from and to_date
select *
from titles; -- emp_no, title, from and to_date

# current managers
select e.emp_no, concat(e.first_name,' ',e.last_name) full_name
from dept_manager d
join employees e on e.emp_no = d.emp_no
where d.to_date > curdate()
;

# std salary
select round(std(salary),0)
from salaries
where to_date>curdate()
;

# table
select *
from dept_manager d
join employees e on e.emp_no = d.emp_no
join salaries s on s.emp_no = d.emp_no
where d.to_date > curdate()
	and s.to_date > curdate()
    and s.salary >= (s.salary - '17310')
;

# historical company average
select sum(salary)
from salaries
;

-- Andrew's Walk Through
select *
from employees
;

select *
from dept_manager
;

select *
from salaries
;

# current managers with current salary
select e.first_name, e.last_name, s.salary
from employees e
join salaries s using (emp_no)
where e.emp_no in (select emp_no from dept_manager where dept_manager.to_date > curdate())
	and s.to_date > curdate()
    and s.salary > (select avg(salary) + std(salary) from salaries)
; -- 3

# historical average
select avg(salary)
from salaries; -- 63810.7448

# salary within 1 std
select avg(salary) + std(salary)
from salaries
; -- 80715.5731

-- Using the telco_churn DB, give me all the customers who pay over the company monthly average
-- BONUS: give me the PERCENTAGE of people who pay over the company monthly average

use telco_churn;
show tables;
# customers is the 'main' table

select *
from customers
; # customer_id, tenure, internet_service_type, contract_type_id, monthly_charges, total_charges, churn
select *
from customer_contracts
; # customer_id, contract_type_id, paperless_billing
select *
from contract_types
; # contract_type_id, contract_type
select *
from customer_details
; # customer_id, gender, senior_citizen, partner, dependents
select *
from customer_payments
; # customer_id, payment_type_id, monthly_charges, total_charges

select avg_bill / num_cust
from(
select round(sum(cp.monthly_charges),2) avg_bill, count(c.customer_id) num_cust
from customer_payments cp
join customers c using (customer_id)
where contract_type_id = 1
) as a
; # 257,294.15 monthly charges # avg_bill = 66.40

select count(customer_id)
from customers
where monthly_charges > (select avg_bill / num_cust
						from(
						select round(sum(cp.monthly_charges),2) avg_bill, count(c.customer_id) num_cust
						from customer_payments cp
						join customers c using (customer_id)
						where contract_type_id = 1
						) as a)
; # 3824

select count(*)
from customers
where contract_type_id = 1
; # 3875

select (select count(customer_id)
				from customers
				where monthly_charges > (select avg_bill / num_cust
						from(
						select round(sum(cp.monthly_charges),2) avg_bill, count(c.customer_id) num_cust
						from customer_payments cp
						join customers c using (customer_id)
						where contract_type_id = 1
						) as a)) 
                        
                        / 

						(select count(*)
						from customers
						where contract_type_id = 1) * 100 as prct_cust
; # 98.68%

# Andrew's walkthrough!! So simple! 55%
select count(customer_id) / (select count(customer_id)
							from customers) * 100
from customers
where monthly_charges > (select avg(monthly_charges) from customers)
; # 3923

select count(customer_id)
from customers
where monthly_charges < (select avg(monthly_charges) from customers)
; #3 3120