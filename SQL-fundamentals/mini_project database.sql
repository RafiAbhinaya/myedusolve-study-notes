# mini project

create database mini_project;

use sakila;

# Membandingkan jumlah penyewaan setiap film dengan frekuensi keterlambatan.

# query in sakila (revisi di bawah)
select 
	rnt.rental_id , fil.film_id ,
	fil.title , fil.rental_duration ,
	rnt.return_date, rnt.rental_date 
from
	sakila.rental rnt
join
	sakila.inventory inv using (inventory_id)
join
	sakila.film fil using (film_id);

# query in sakila (yang bener)
select 
	fil.film_id ,
	fil.title as film_title,
	fil.rental_duration as film_rental_duration,
	fil.rating as film_rating,
	cat.name as category_name,
	ren.rental_id ,
	ren.rental_date ,
	ren.return_date 
from
	sakila.film fil
left join
	sakila.film_category fc on fc.film_id = fil.film_id 
left join
	sakila.category cat on cat.category_id = fc.category_id
left join
	sakila.inventory inv on inv.film_id = fil.film_id
left join 
	sakila.rental ren on ren.inventory_id = inv.inventory_id;
	


# export then use mini_project
use mini_project;

select 
	*
from 
	`2b` b ;

alter table case2 
rename case2_old;

# Comparing the number of rentals for each film with the frequency of delays
select 
	 title ,
	 count(rental_id) as total_rental,
	 sum(
 		case 
	 	when datediff(return_date,rental_date) > rental_duration then 1
 		else 0
 		end) as total_delayed_return
from
	mini_project.case2 cs
group by
	1;

# alternative answer try 1 FAIL
select 
	 cs.title title ,
	 cs.rental_duration ,
	 count(cs.rental_id) as total_rental,
	 count(r.difference)
from
	mini_project.case2 cs
join
	(
	select
		rental_id ,
		datediff(return_date,rental_date) as difference 
	from 
		mini_project.case2 
	) as r using (rental_id)
group by
	1,2
having 
	count(r.difference) > cs.rental_duration ;

# Comparing the number of rentals for each film with the frequency of delays
select 
	 cs.film_title title ,
	 count(cs.rental_id) as total_rental,
	 count(
 		case 
	 	when datediff(cs.return_date,cs.rental_date) > cs.film_rental_duration then 1
	 	end) as total_delayed_return
from
	mini_project.case2 cs
group by
	1;



select 
	title ,
	rental_duration ,
	rental_date ,
	return_date 
from
	mini_project.case2 
where 
	title = 'ace goldfinger'
order by 
	1
;


select 
	b.rental_id,
	b.rental_duration,
	case datediff(return_date,rental_date)
		when (datediff(return_date,rental_date) < b.rental_duration) then 'not late'
		when (datediff(return_date,rental_date) > b.rental_duration) then 'late'
		else 'null'
		end as late_or_not,
	b.rental_date ,
	b.return_date
	end 
from 
	mini_project.case2 b 
order by
	1;


