-- TUGAS 1 - PERTEMUAN 9
-- DA_C_Muhammad Rafi Abhinaya

-- Database yang digunakan adalah Sakila Database.
use sakila;

-- SOAL

-- 1) Tampilkan 10 aktor yang paling banyak memerankan film dengan durasi lebih dari 60 menit, dan memiliki 'Behind The Scenes' special feature.
-- 	  Tampilkan kolom actor id, first name, genre film, dan jumlah film yang sudah ia perankan.

-- Jawaban 1
select 
	act.actor_id ,
	act.first_name ,
	ctg.name as genre,
	count(fil.film_id) as total_film_played_in
from
	sakila.film fil
join
	sakila.film_actor fa using (film_id)
join
	sakila.actor act using (actor_id)
join
	sakila.film_category filc using (film_id)
join
	sakila.category ctg using (category_id)
where 
	fil.`length` > 60
	and fil.special_features like '%Behind the scenes%'
group by
	1,2,3
order by 
	count(fil.film_id) desc,
	act.first_name 
limit 
	10
;

-- 2) Tampilkan 5 film yang paling laris dipinjam pada database ini, jika dilihat dari jumlah total salesnya (payment amount). 
-- 	  Tampilkan kolom film title, jumlah total salesnya, jumlah order nya, dan berapa customer yang sudah order film tersebut.

-- Jawaban 2

select 
	fil.title ,
	sum(pay.amount) as total_sales,
	count(rnt.rental_id) as total_order,
	count(distinct cus.customer_id) as customer_oredered
from
	sakila.payment pay
join
	sakila.rental rnt on rnt.rental_id = pay.rental_id 
join 
	sakila.inventory inv on inv.inventory_id = rnt.rental_id 
join 
	sakila.film fil on fil.film_id = inv.film_id
join 
	sakila.customer cus on cus.customer_id = rnt.customer_id 
group by 
	fil.title
order by 
	sum(pay.amount) desc
limit 
	5
;
-- NOTE
-- ada case dimana 1 customer order dua kali (contohnya ada di bagian TESTING)
-- sehingga saya pake count distinct agar customer yang sama dihitung sebagai 1 untuk kolom customer ordered
-- walaupun case ini sebenarnya tidak terjadi untuk top 5 film




-- -----------------------------------------------------------------




-- TESTING
-- 1)
-- buat ngetest sebelum nemu jawaban yang fix
select 
	fil.film_id ,
	act.actor_id ,
	act.first_name ,
	ctg.name as genre,
	fil.`length` ,
	fil.special_features ,
	count(fil.film_id) as total_film_played_in
from
	sakila.film fil
join
	sakila.film_actor fa using (film_id)
join
	sakila.actor act using (actor_id)
join
	sakila.film_category filc using (film_id)
join
	sakila.category ctg using (category_id)
where 
	fil.`length` > 60
	and fil.special_features like '%Behind the scenes%'
	and act.first_name = "grace"
group by
	1,2,3,4,5,6
order by 
	fil.`length` asc,
	count(fil.film_id) desc
;

-- 2)
-- buat ngetest uda bisa cari total salesnya ato belum
select 
	fil.title ,
	sum(pay.amount)
from
	sakila.payment pay
join
	sakila.rental rnt on rnt.rental_id = pay.rental_id 
join 
	sakila.inventory inv on inv.inventory_id = rnt.rental_id 
join 
	sakila.film fil on fil.film_id = inv.film_id
join 
	sakila.customer cus on cus.customer_id = rnt.customer_id 
where 
	fil.title = "swarm gold"
group by 
	1
;

-- buat ngetest apakah ada customer yang rental film yangg sama lebih dari 1 kali
-- konklusinya ada
select 
	cus.customer_id ,
	fil.title,
	count(fil.film_id)
from
	sakila.payment pay
join
	sakila.rental rnt on rnt.rental_id = pay.rental_id 
join 
	sakila.inventory inv on inv.inventory_id = rnt.rental_id 
join 
	sakila.film fil on fil.film_id = inv.film_id
join 
	sakila.customer cus on cus.customer_id = rnt.customer_id 
group by 
	1,2
having 
	count(fil.film_id) > 1
order by 
	rnt.customer_id 
;

-- dari query ini terlihat customer_id 148 order film 'NIGHTMARE CHILL' dua kali
select 
	cus.customer_id ,
	fil.title,
	rnt.rental_date 
from
	sakila.payment pay
join
	sakila.rental rnt on rnt.rental_id = pay.rental_id 
join 
	sakila.inventory inv on inv.inventory_id = rnt.rental_id 
join 
	sakila.film fil on fil.film_id = inv.film_id
join 
	sakila.customer cus on cus.customer_id = rnt.customer_id 
having 
	cus.customer_id = 148
order by 
	rnt.customer_id 
;

-- count distinct menghindari customer yang sama dihitung dua kali
select 
	fil.title ,
	count(rnt.rental_id) as total_order,
	count(distinct cus.customer_id) as customer_oredered
from
	sakila.payment pay
join
	sakila.rental rnt on rnt.rental_id = pay.rental_id 
join 
	sakila.inventory inv on inv.inventory_id = rnt.rental_id 
join 
	sakila.film fil on fil.film_id = inv.film_id
join 
	sakila.customer cus on cus.customer_id = rnt.customer_id 
where 
	fil.title = "nightmare chill"
group by 
	fil.title
order by 
	sum(pay.amount) desc
;












