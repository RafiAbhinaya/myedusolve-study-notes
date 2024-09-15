# Mini project latihan sendiri

# Mengetahui jumlah total film per kategori dan rating.
select 
	ctg.name ,
	fil.rating ,
	count(fil.film_id) as total_rent
from 
	sakila.film fil
join
	sakila.film_category fc using (film_id)
join
	sakila.category ctg using (category_id)
group by
	1,2
order by
	1,2
;

# Mengetahui film yang paling sering atau paling jarang disewa.
select 
	fil.title ,
	count(rnt.rental_id) as total_rent
from 
	sakila.film fil
join 
	sakila.inventory inv using (film_id)
join
	sakila.rental rnt using (inventory_id)
group by
	1
order by 
	2 desc #asc kalo nyari yg paling jarang disewa
;

# Rata-rata durasi penyewaan untuk setiap film.
select 
	fil.title ,
	concat(round(avg(datediff(rnt.return_date,rnt.rental_date)),0)," ","days") as average_rental_duration
from
	sakila.film fil
join 
	sakila.inventory inv using (film_id)
join
	sakila.rental rnt using (inventory_id)
group by
	1
;

# Mengidentifikasi film yang paling sering terlambat dikembalikan.
select 
	fil.title ,
	count(
		case 
		when datediff(rnt.return_date,rnt.rental_date) > fil.rental_duration then 1
		end) as total_late_return
from
	sakila.film fil
join 
	sakila.inventory inv using (film_id)
join
	sakila.rental rnt using (inventory_id)
group by
	1
order by 
	2 desc
;

# Membandingkan jumlah penyewaan setiap film dengan frekuensi keterlambatan.
select 
	fil.title ,
	count(rnt.rental_id) as total_rental ,
	count(
		case 
		when datediff(rnt.return_date,rnt.rental_date) > fil.rental_duration then 1
		end) as total_late_return
from
	sakila.film fil
join 
	sakila.inventory inv using (film_id)
join
	sakila.rental rnt using (inventory_id)
group by
	1
order by 
	1 
;

# Mengidentifikasi pola apakah kategori dan rating film tertentu lebih rentan terhadap keterlambatan pengembalian.
select 
	ctg.name as category ,
	fil.rating ,
	count(
		case 
		when datediff(rnt.return_date,rnt.rental_date) > fil.rental_duration then 1
		end) as total_late_return
from
	sakila.film fil
join 
	sakila.inventory inv using (film_id)
join
	sakila.rental rnt using (inventory_id)
join
	sakila.film_category fc using (film_id)
join
	sakila.category ctg using (category_id)
group by
	1,2
order by 
	3 desc
;






