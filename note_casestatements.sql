-- IF function
-- check this condition, 
	-- if this condition is true, do this, 
    -- if not, do that
    
    
-- EVERYTHING IS SQL AND PYTHON IS HAPPENING ON A ROW BY ROW BASIS

    
/* 
FORMAT: IF(condition, value_if_true, value_if_false)
**Generally best for T/F statements**
**These hang out in the SELECT statement (manipulating our output data)
*/

use chipotle;

select *
from orders;

select distinct item_name, if(item_name = 'Chicken Bowl', 'Yes', 'No') as is_chicken_bowl
from orders;

select distinct item_name, if(item_name = 'Chicken Bowl', '1', '0') as is_chicken_bowl
from orders;

select distinct item_name, if(item_name = 'Chicken Bowl', 'TRUE', 'FALSE') as is_chicken_bowl
from orders;

-- RECOGNIZED AS BOOLEAN, DOESN'T STORE AS BOOLEAN -- WILL CHANGE TO 1 AND 0
select distinct item_name, if(item_name = 'Chicken Bowl', TRUE, FALSE) as is_chicken_bowl
from orders;

select distinct item_name, if(item_name LIKE '%Chicken Bowl%', 'YES', 'NO') as HAS_CHCIKEN
from orders;

select *, if(item_name LIKE '%Chicken Bowl%', 'YES', 'NO') as IS_CHICKEN_BOWL
from orders;

-- extra
-- write subquery to count chicken items returns the DISTINCT chicken items
select sum(has_chicken)
from
(select distinct item_name, 
	if(item_name like '%Chicken%', TRUE, FALSE) as has_chicken 
from orders) as chicken
; -- uses first query as a table so you can access the column that you just made

-- using group by returns chicken for every single row-- NOT what the question is asking
select
	if(item_name LIKE '%Chicken%', 'YES', 'NO') as has_chicken, count(*)
from orders
group by has_chicken
;

-- CASE STATEMENTS
-- 2 options
-- OPTION 1:
	-- single out a single column
    -- check if it EQUALS something, if it does, perform an action and exit
    -- check if it EQUALS a second thing, if it does, perform that sction instead and exit
    -- if it doesnt qual any of the above values, perform an anction for whatever is left and exit
    
/* FORMAT:
	CASE [column_name_that_we_named]
		WHEN [condition_a] THEN [output_value_a]
		WHEN [condition_b] THEN [output_value_b]
		ELSE [output_value_c]
	END as [new_column_name]
*/
	-- we are only checking ONE COLUMN
    -- we are only checking for EQUALITY
		-- no greater than, no likes
	-- but we can check for more than TRUE and FALSE
    -- RUNS PER ROW IN DISTINCT COLUMN NOT PER COLUMN

select distinct item_name
from orders
; -- lets find the bowls, add case statement in select statement as a new column using a comma

select distinct item_name, 
	CASE item_name -- this is the column I'm checking
		when 'Chicken Bowl' then 'Yes_Chicken'
        when 'Steak Bowl' then 'Yes_Steak'
        when 'Izze' then 'Yes_Izze'
        when '%Burrito%' then 'Yes_Burrito' -- > Forgot to put LIKE
	ELSE 'Other'
    END as 'Chicken, Steak, Izze, Burrito?'
from orders
;

select distinct item_name, 
	CASE item_name -- this is the column I'm checking
		when 'Chicken Bowl' then 'Yes_Chicken'
        when 'Steak Bowl' then 'Yes_Steak'
        when 'Izze' then 'Yes_Izze'
        when LIKE '%Burrito%' then 'Yes_Burrito' -- > CANNOT USE LIKE OR WILDCARDS B/C IT CHECKS FOR EQUALITY
	ELSE 'Other'
    END as 'Chicken, Steak, Izze, Burrito?'
from orders
;

-- WHEN you alias in the select statement you cannot alias it again, you would have to make a subquery
-- because you can't call back aliases in your select statement WITHOUT a subquery -- you can't access that table until you 
-- exit and go back in

-- OPTION 2:
	-- check for a condition, if true, perform and exit
    -- check for another condition, if true, perform and exit
		-- can search multiple columns, more flexibility
        -- can use different operators than EQUALS
        -- ORDER MATTERS HERE
        -- In general, this is the preferred format
    
/* FORMAT:
	CASE
		WHEN [column_a_condition_a] THEN [output_value_a]
		WHEN [column_b_condition_b] THEN [output_value_b]
		ELSE [value_c
	END as [new_column_name]
*/

-- lets find bowls again

select *,
	CASE
		WHEN item_name = 'Chicken Bowl' then 'Yes_Chicken' -- > CHECK FIRST, IF TRUE -> PERFORM, EXIT TO NEXT
        WHEN item_name like '%Bowl%' then 'Other_Bowl' -- > Didn't count chicken bowl because it already counted chicken bowls 1st
        ELSE "not_chicken_or_other_bowl"
        END 'find_bowls' -- > WE HAVE NULLS B/C THERE IS NO ELSE STATEMENT
from orders
;

-- CAN look at other fields
select *,
	CASE
		WHEN item_name = 'Chicken Bowl' then 'Yes_Chicken'
        WHEN item_name like '%Bowl%' then 'Other_Bowl' 
        WHEN order_id < 4 then 'small_order' -- > can check other columns
        ELSE "not_chicken_or_other_bowl"
        END 'find_bowls', 
	CASE
		WHEN choice_description like '%tomato%' then 'DANGER'
        WHEN choice_description not like '%tomato%' then 'no_tomato'
        END 'ALLERGIC'
from orders
;


-- LOOKING AT PRICE COLUMN
select distinct item_price
from orders
order by item_price
; -- > DOES NOT RECOGNIZE THESE AS NUMBERS, it sees them as strings because of the $

/* BREAK BREAK
*/

-- lets group by quantites
select quantity, count(*)
from orders
group by quantity
;

-- create categories for how many times a person ordere a specific item order
select distinct quantity
from orders
;
-- THEN BUILD CASE STATEMENT
select distinct quantity,
	CASE
		when quantity >= 5 then 'big_order'
        when quantity >= 2 then 'medium_order'
        else 'single_order'
	END 'order_size'
from orders
;
-- WE HAVE MADE THE CATEGORIES NOW FIND OUT HOW MANY TIMES PEPOPLE ACTUALLY ORDERED THE DIFFERENT CATEGORIES
select order_size, count(*) -- > ORDER doesn't matter here, it's just the display of columns. Start with WHAT you are grouping by
	from (
	select id, quantity,
		CASE
			when quantity >= 5 then 'big_order'
			when quantity >= 2 then 'medium_order'
			else 'single_order'
		END 'order_size'
	from orders) as orders
group by order_size -- > to summarize individual categories by column
;




