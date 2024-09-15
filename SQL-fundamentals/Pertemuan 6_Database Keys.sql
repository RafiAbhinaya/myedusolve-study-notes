# Pertemuan 6 Database Keys


# use db_baru
use db_baru;

# primary key

# create
create table product2(
	product_id int not null auto_increment,
	nama varchar(100) not null,
	price int,
	quantity int,
	primary key(product_id)
);

# alter
alter table	table_baru2 
	add primary key (id_baru)
;

# foreign key
# create
create table product_description
(
	id int not null auto_increment,
	product_id int not null,
	description text,
	primary key (id),
	constraint fk_product_description_product2
		foreign key (product_id) references product2(id)
);

# alter - drop
alter table product_description
	drop constraint fk_product_description_product2;

# alter - drop constraint
alter table product_description
	add constraint fk_product_description_product2
		foreign key(product_id) references product2 (id)
;

# composite key (dua primary)
# create
create table product3
(
	id int not null,
	nama varchar(100),
	nama2 varchar(100),
	price int,
	quantity int,
	primary key (nama,nama2)
);

# alter
alter table product3 
	drop primary key
;

alter table product3 
	add primary key (nama,nama2)
;












