# Pertemuan 8

use sakila;

# inner join
select
	cus.customer_id as id,
	cus.first_name ,
	cus.last_name ,
	addr.address ,
	c.city ,
	coun.country 
from 
	sakila.customer cus
inner join
	sakila.address addr on addr.address_id = cus.address_id 
inner join
	sakila.city c on c.city_id = addr.city_id 
inner join 
	sakila.country coun on coun.country_id = c.country_id 
order by
	1,2,3 asc
;

# right join
select
	cus.customer_id as id,
	cus.first_name ,
	cus.last_name ,
	addr.address ,
	c.city ,
	coun.country 
from 
	sakila.customer cus
right join
	sakila.address addr on addr.address_id = cus.address_id 
right join
	sakila.city c on c.city_id = addr.city_id 
right join 
	sakila.country coun on coun.country_id = c.country_id 
order by
	1,2,3 asc
;
	
# left join

select
	cus.customer_id as id,
	cus.first_name ,
	cus.last_name ,
	addr.address ,
	c.city ,
	coun.country 
from 
	sakila.customer cus
left join
	sakila.address addr on addr.address_id = cus.address_id 
left join
	sakila.city c on c.city_id = addr.city_id 
left join 
	sakila.country coun on coun.country_id = c.country_id 
order by
	1,2,3 asc
;

# cross join
select 
	*
from
	sakila.city cit
cross join
	sakila.country coun
;

# join dengan using
select 
	*
from
	sakila.city cit
cross join
	sakila.country coun using (country_id)
;

# set operator
# union
select 
	first_name ,
	last_name 
from
	sakila.staff
union 
select
	first_name ,
	last_name 
from 	
	sakila.customer;
	
# union all
select 
	staff_id ,
	first_name ,
	last_name 
from
	sakila.staff
union all
select
	customer.customer_id as staff_id ,
	first_name ,
	last_name 
from 	
	sakila.customer;