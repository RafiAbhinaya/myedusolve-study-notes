# Pertemuan 7

# join
# ke 1 table
select
	sakila.actor.actor_id ,
	sakila.actor.first_name ,
	sakila.actor.last_name ,
	sakila.film_actor.film_id 
from 
	sakila.actor
join sakila.film_actor on sakila.actor.actor_id = sakila.film_actor.actor_id
;

# with alias
select
	a.actor_id ,
	a.first_name ,
	a.last_name ,
	fa.film_id 
from 
	sakila.actor a
join 
	sakila.film_actor fa 
	on a.actor_id = fa.actor_id 
;

# nyoba sendiri
select 
	c.first_name ,
	c.last_name ,
	p.customer_id ,
	p.payment_id ,
	p.staff_id ,
	p.rental_id
from 
	sakila.payment p 
join
	sakila.customer c on p.customer_id = c.customer_id 
;
	
# join lebih 1 table (3 table)
select 
	act.first_name ,
	act.last_name ,
	flm.title ,
	flm.release_year 
from 
	sakila.actor act
join
	sakila.film_actor fa on fa.actor_id = act.actor_id 
join
	sakila.film flm on flm.film_id = fa.film_id 
	;

# join lebih 1 table (5 table)
select 
	flm.title as film_title ,
	c.name as category ,
	act.first_name as actor_first_name ,
	act.last_name ,
	l.name as language
from 
	sakila.actor act
join
	sakila.film_actor fa on fa.actor_id = act.actor_id 
join
	sakila.film flm on flm.film_id = fa.film_id 
join 
	sakila.film_category fc on fc.film_id = flm.film_id 
join
	sakila.category c on c.category_id = fc.category_id 
join 
	sakila.`language` l on l.language_id = flm.language_id 
;
# `language` pake tanda petik yg di top right keyboard









