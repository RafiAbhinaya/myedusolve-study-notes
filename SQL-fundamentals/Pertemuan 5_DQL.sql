# Pertemuan 5

# use sakila
use sakila;

# select all
select * from actor;


# select few column
select 
	first_name,
	last_name 
from 
	actor;

# limit
select * 
from actor 
limit 20;

# where operator - numbers
select first_name ,last_name 
from actor
where actor_id = 10;

select first_name ,last_name 
from actor
where actor_id <= 10;

select actor_id, first_name , last_name 
from actor
where actor_id != 10;

# where operator - string
select first_name ,last_name 
from actor
where last_name = 'Berry' ;

# where (and / or)
# and
select *
from actor
where 
	last_name = 'berry'
	and first_name = 'karl';

# or
select *
from actor
where 
	last_name = 'berry'
	or first_name = 'sean';

# null
select 
	address_id, 
	address, 
	address2, 
	district
from 
	address
where
	address2 is null
	
# not null
select 
	address_id, 
	address, 
	address2, 
	district
from 
	address
where
	address2 is not null
limit 
	10;

# operator like (hanya untuk string)
select 
	actor_id ,
	first_name ,
	last_name 
from 
	actor
where 
	first_name like '%a'
order by 
	first_name desc # acsending (asc), descending (desc)
	;

# operator distinct, in, between

# distinct
select
	distinct last_name  
from 
	actor
order by 
	last_name asc 
;

# in (sama kaya or)
#in numbers
select
	*
from 
	actor
where 
	actor_id in (1,5,10)
;

#in string
select
	*
from 
	actor
where 
	first_name  in ('val','johnny','joe')
;

#	between
select
	*
from 
	actor
where 
	actor_id  between 12 and 26
;

#	alias (buat simplifying code aja ini)
select 
	first_name  as 	'Nama Depan'
from
	actor a 
;

# kalau proper nama databese, table, dan kolom diketik
# formatnya; [db[.[table].[column]

# without alias
select 
	sakila.actor .first_name 
from
	actor
;

# with alias
select 
	sakila.a.first_name 
from
	actor a
;


