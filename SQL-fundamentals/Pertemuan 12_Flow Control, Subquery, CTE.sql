# Pertemuan 12 Flow Control dan Subquery / CTE

# if

# case

select 
	fil.title ,
	fil.rental_rate ,
	fil.`length` as film_length,
	if(fil.rental_rate > 2.00, 'Expensive', 'Average')
from
	sakila.film fil
;

select 
	adr.address_id ,
	adr.address ,
	adr.address2 ,
	ifnull(adr.address2,adr.address) as address2_fixed
from
	sakila.address adr
limit
	10
;

# case
select 
	fil.title ,
	fil.rental_rate ,
	fil.`length` as film_length,
	case
		when fil.rental_rate < 1.00 then 'Cheap'
		when fil.rental_rate between 1.01 and 1.00 then 'Average'
		when fil.rental_rate between 2.01 and 3.00 then 'Above Average'
		else 'Expensive'
	end
from
	sakila.film fil
;

# subquery
select 
	fil.film_id ,
	fil.title ,
	fil.`length` as film_duration
from
	sakila.film fil #ini mainquery
where 
	fil.`length` > (
					select
						avg(fil.`length`) 
					from
						sakila.film fil
					) #ini subquery
	and fil.title like 'B%'
limit 
	10
;

# CTE
with 
cte_actor as (
		select 
		act.actor_id,	
		act.first_name ,
		act.last_name 
		from
			sakila.actor act
)
select
	cte_actor.actor_id,
	cte_actor.first_name,
	cte_actor.last_name,
	fil.title ,
	fil.release_year 
from
	cte_actor
join
	sakila.film_actor fa using (actor_id)
join
	sakila.film fil using (film_id)

# CTE bertingkat
with cte1 as (
	select 
		pay.payment_id ,
		pay.customer_id ,
		pay.amount
	from
		sakila.payment pay
), cte2 as (
	select
		cus.customer_id,
		cus.first_name,
		cus.last_name
	from 
		sakila.customer cus
), cte3 as (
	select
		cte2.first_name,
		cte2.last_name,
		sum(cte1.amount) as total_amount
	from 
		cte1
	join
		cte2 using (customer_id)
	group by
		1,2
	order by 
		3 desc 
	limit 
		10
)
select * from cte3;
	
select 
 	cus.first_name ,
 	cus.last_name ,
 	sum(pay.amount) as total_amount
from 
	sakila.payment pay
join
	sakila.customer cus using (customer_id)
group by
	1,2
order by 
	3 desc 
limit
	10
;







