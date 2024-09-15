# Pertemuan 4 DML

# DML - insert, update, delete

# insert ke semua kolom
insert into table_baru2 values(1,'ABC','DEF','GHI'); 

# insert ke beberapa kolom
insert into table_baru2 (id_baru,nama_baru,kolom_baru5)
	values (2,'JKL','MNO');
	
# not null dan auto-increment
create table product (
	id_product int not null auto_increment,
	nama varchar (200),
	price int not null,
	quantity int not null default 0,
	primary key (id_product)
);

# nyoba nyoba
alter table product 
	modify column id_product varchar(100);

# insert values pada table dengan auto increment, not null, dan default
insert into product (nama, price)
	values ('Snack', 10000);
	
insert into product (price, quantity)
	values (5000,10);
	
#  update
update product 
	set nama = 'Soft Drink'
	where id_product = 2;

update product 
	set quantity = 5
	where id_product = 1;

# update multiple
update product 
	set nama = 'Snack2',
		price = 15000
	where id_product = 1;

# insert row buat nyoba delete
insert into product (nama, price)
	values ('Snack3', 10000); 

#delete
delete from product 
	where id_product = 3;






