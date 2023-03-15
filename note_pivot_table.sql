-- PIVOT TABLE (not on quiz, BONUS)

### pivot table

select * from orders;

-- lets find all the chicken orders

select distinct item_name 
from orders 
where item_name like '%chicken%';


-- look at chicken orders and quantity

select quantity, item_name 
from orders 
where item_name like '%chicken%';


-- building all the columns 

select quantity, item_name,
	case when item_name = 'Chicken Bowl' then item_name end as 'Chicken Bowl', -- each separate case statements which make their own columns
	case when item_name = 'Chicken Crispy Tacos' then item_name end as 'Chicken Crispy Tacos',
	case when item_name = 'Chicken Soft Tacos' then item_name end as 'Chicken Soft Tacos',
	case when item_name = 'Chicken Burrito' then item_name end as 'Chicken Burrito',
	case when item_name = 'Chicken Salad Bowl' then item_name end as 'Chicken Salad Bowl',
	case when item_name = 'Chicken Salad' then item_name end as 'Chicken Salad'
from orders 
where item_name like '%chicken%';


-- adding groupby and count

select quantity,
	count(case when item_name = 'Chicken Bowl' then item_name end) as 'Chicken Bowl',
	count(case when item_name = 'Chicken Crispy Tacos' then item_name end) as 'Chicken Crispy Tacos',
	count(case when item_name = 'Chicken Soft Tacos' then item_name end) as 'Chicken Soft Tacos',
	count(case when item_name = 'Chicken Burrito' then item_name end) as 'Chicken Burrito',
	count(case when item_name = 'Chicken Salad Bowl' then item_name end) as 'Chicken Salad Bowl',
	count(case when item_name = 'Chicken Salad' then item_name end) as 'Chicken Salad'
from orders 
where item_name like '%chicken%'
group by quantity
order by quantity
;


