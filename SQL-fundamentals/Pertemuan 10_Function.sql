# Pertemuan 10 Function

# mathematical operator
# standalone
select 10+10 as adition;
select 10-1 as substraction;
select 10*2 as multiplication;
select 10/2 as division;
select 
	10/2 as division,
	10%2 as modulo;

#  dengan table
select
	pay.amount * 2 as amount_double,
	pay.amount / 2 as amount_split,
	pay.amount + pay.amount + 10 as amount2_plus_10
from
	sakila.payment pay;
	
# numeric function
# average, minimum, maximum, 
select 
	cus.customer_id ,
	cus.first_name ,
	min(pay.amount)	,
	max(pay.amount)	,
	avg(pay.amount)	,
	sum(pay.amount)	
from
	sakila.customer cus
left join
	sakila.payment pay on pay.customer_id = cus.customer_id 
group by 
	1
order by 
	6 desc 
limit 
	10
;

# power, square root
select 
	cus.customer_id ,
	cus.first_name ,
	pow(pay.amount,2) ,
	sqrt(pay.amount)		
from
	sakila.customer cus
left join
	sakila.payment pay on pay.customer_id = cus.customer_id 
limit 
	10
;

# string function
# concat, concat_ws
select concat("string1"," ", "string2") as concat_string;
select concat_ws("string1", "string2") as concat_string_ws;

# contoh dengan table
select
	a.first_name ,
	a.last_name ,
	concat(a.first_name," ",a.last_name) as full_name
from 
	sakila.actor a 
;

# lower, upper
select
	a.first_name ,
	lower(a.first_name) as lower_first_name
from 
	sakila.actor a 
;

select
	adr.district ,
	upper(adr.district) as upper_district
from
	sakila.address adr
;

# reverse, substring
	




