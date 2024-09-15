# Pertemuan 11 Index dan View

use db_baru;
use sakila;

# clustered dan non clustered
# create table
create table seller(
	id int not null auto_increment,
	nama varchar(100),
	email varchar(100),
	primary key (id), #clustered
	index nama_index (nama) #non clusterer
);

# alter
# drop
alter table seller
	drop index nama_index;

# add
alter table seller 
	add index nama_index (nama);

# view
create view customer_order_count as
	select 
		cus.first_name,
		cus.last_name ,
		cus.email ,
		count(fil.film_id)
	from
		sakila.customer cus
	left join
		sakila.rental rnt on rnt.customer_id = cus.customer_id 
	left join 
		sakila.inventory inv on inv.inventory_id = rnt.inventory_id 
	left join 
		sakila.film fil on fil.film_id = inv.film_id 
	group by 
		1,2,3
	order by 
		4 desc 
	limit 
		10
;

# alter view
alter view customer_order_count as
	select 
		concat(cus.first_name," ",cus.last_name) as full_name,
		cus.email ,
		count(fil.film_id) as order_count
	from
		sakila.customer cus
	left join
		sakila.rental rnt on rnt.customer_id = cus.customer_id 
	left join 
		sakila.inventory inv on inv.inventory_id = rnt.inventory_id 
	left join 
		sakila.film fil on fil.film_id = inv.film_id 
	group by 
		1,2
	order by 
		3 desc 
	limit 
		10
	;

# drop view
drop view customer_order_count;









