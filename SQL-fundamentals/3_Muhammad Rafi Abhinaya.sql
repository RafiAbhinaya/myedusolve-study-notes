-- DATABASE TUGAS 1

use sakila;

-- 1. Buat table dengan nama film_review dengan kolom-kolom berikut:
-- ● review_id (auto-increment primary key)
-- ● film_title (varchar dengan batas 255 karakter)
-- ● review_text (text)
-- ● movie_text (varchar dengan batas 255 karakter)

create table film_review
(
	review_id int not null auto_increment,
	film_title varchar(255),
	review_text text,
	movie_text varchar(255),
	primary key (review_id)
);
	
-- 2. Drop kolom movie_text, lalu tambahkan kolom berikut pada table film_review:
-- ● film_year (integer)
-- ● rating (float)

alter table sakila.film_review
	drop column movie_text
;

alter table film_review
	add column film_year int,
	add column rating float
;

-- 3. Insert data baru ke dalam table `movie_review` dengan kriteria berikut:
-- 		film_title film_year rating review_text
-- 		Inception 2010 8.8 Inception is a movie that will keep you captivated
-- 		Logan 2017 8.1 Logan really has stakes that feel real
-- 		Ant-Man 2015 7.3 Ant-Man is a superhero film worth seeing
-- 		The Flash 2023 6.9 Enjoyable film with some really good performances
-- 		Aquaman 2018 6.8 Incredibly fun and entertaining action film

insert into film_review (film_title,film_year,rating,review_text)
	values
	("Inception",2010,8.8,"inception is a movie that will keep you captivated"),
	("Logan",2017,8.1,"Logan really has stakes that feel real"),
	("Ant-Man",2015,7.3,"Ant-Man is a superhero film worth seing"),
	("The Flash",2023,6.9,"Enjoyable film with some really good performances"),
	("Aquaman",2018,6.8,"Incredibly fun and entertaining action film")
;

-- 4. Update semua film pada table `film` dengan rating 'PG' untuk memiliki `rental_rate`
-- sebesar $1.99.

update 
	film 
set 
	rental_rate = 1.99
where 
	rating = "PG"
;

-- 5. Tampilkan 10 aktor yang paling banyak memerankan film dengan durasi lebih dari 60
-- menit, dan memiliki special feature 'Behind The Scenes'.
-- Tampilkan kolom actor id, nama depan, nama belakang, genre film, dan berapa jumlah
-- film yang sudah diperankan.

select 
	act.actor_id ,
	act.first_name ,
	act.last_name ,
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
	1,2,3,4
order by 
	count(fil.film_id) desc
limit 
	10
;

-- 6. Tampilkan 5 film yang paling laris dipinjam jika dilihat dari jumlah salesnya (amount).
-- Tampilkan nama film, jumlah sales, jumlah order, dan berapa customer yang sudah
-- order film tersebut.

select 
	fil.title ,
	sum(pay.amount) as total_sales,
	count(rnt.rental_id) as total_order,
	count(distinct cus.customer_id) as customer_oredered
from
	sakila.film fil
join
	sakila.inventory inv using (film_id)
join
	sakila.rental rnt using (inventory_id)
join
	sakila.payment pay using (rental_id)
join
	sakila.customer cus on cus.customer_id = rnt.customer_id 
group by 
	1
order by
	2 desc
limit 
	5
;

-- 7. Tampilkan seluruh customer yang sudah meminjam lebih dari 2 kali pada film dengan
-- kategori: 'Drama', 'Comedy', 'Horror'.
-- Tampilkan nama depan, nama belakang, email, alamat, genre, dan berapa jumlah order
-- nya.

-- customer, rental, inventory, film, film category, category

select 
	cus.first_name ,
	cus.last_name , 
	cus.email ,
	adr.address ,
	cat.name as genre,
	count(rnt.rental_id) as total_order
from
	sakila.customer cus
join
	sakila.address adr using (address_id)
join
	sakila.rental rnt using (customer_id)
join
	sakila.inventory inv using (inventory_id)
join
	sakila.film fil using (film_id)
join
	sakila.film_category fc using (film_id)
join
	sakila.category cat using (category_id)
where 
	cat.name = "drama"
	or cat.name = "comedy" 
	or cat.name = "horror" 
group by
	1,2,3,4,5
having 
	count(rnt.rental_id) > 2	
order by 
	cat.name ,
	cus.first_name 
;















