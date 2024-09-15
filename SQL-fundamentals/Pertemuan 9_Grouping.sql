# Pertemuan 9 Grouping

#group by
select 
	cus.customer_id ,	
	cus.first_name ,
	cus.last_name ,
	count(pay.payment_id) as rental_count ,
	sum(pay.amount) as total_rental_amount
from
	sakila.customer cus
left join
	sakila.payment pay on pay.customer_id = cus.customer_id 
group by 
	cus.customer_id 
;

# group by best practice
# ketika grouping, pake primary key di bagian "group by" biar ga repot
select 
	cus.customer_id ,
	cus.first_name ,
	cus.last_name ,
	cus.email ,
	count(fil.film_id)
from
	sakila.customer cus
left join
	sakila.rental ren on ren.customer_id = cus.customer_id 
left join 
	sakila.inventory inv on inv.inventory_id = ren.inventory_id 
left join 
	sakila.film fil on fil.film_id = inv.film_id 
group by
	1
order by 
	5
;

# having
select 
	cus.first_name ,
	cus.last_name ,
	cus.email ,
	count(fil.film_id)
from
	sakila.customer cus
left join
	sakila.rental ren on ren.customer_id = cus.customer_id 
left join 
	sakila.inventory inv on inv.inventory_id = ren.inventory_id 
left join 
	sakila.film fil on fil.film_id = inv.film_id 
group by
	1,2,3
having 
	count(fil.film_id) = 32 and cus.first_name = 'mary'
order by 
	4
;

# having where, ini sama2 kondisi
# having letaknya di akhir setelah group by, where itu sebelum group by
# having itu bisa filtering hasil agregasi (querynya), sementara where itu hanya pada table asli
	
	
	
	
	
	
	
