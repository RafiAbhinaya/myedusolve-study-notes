# Pertemuan 3 DDL

# DDL - create

# create database baru
create database db_baru;

# drop databse
drop database db_baru;

# akses database baru
use db_baru;

# create table baru
create table table_baru (
	id_baru int,
	nama_baru varchar(20)
);

# drop table
drop table table_baru;

#create table baru
create table table_baru2 (
	id_baru int,
	nama_baru varchar(20)
);

#alter table (add)
alter table table_baru2 
	add column kolom_baru varchar(20);

# alter table (add) multiple lines
alter table table_baru2
	add column kolom_baru2 varchar(20),
	add column kolom_baru3 varchar(20),
	add column kolom_baru4 varchar(20);
	
# alter table (drop) multiple lines
alter table table_baru2
	drop column kolom_baru2,
	drop column kolom_baru3;

# alter table (rename) multiple lines
alter table table_baru2
	rename column kolom_baru to kolom_baru5,
	rename column kolom_baru4 to kolom_baru6;

# alter table (modify)
alter table table_baru2 
	modify nama_baru varchar (100),
	modify kolom_baru5 varchar (100);

alter table table_baru2
	modify nama_baru varchar(20) after kolom_baru5;

alter table table_baru2 
	modify kolom_baru5 varchar(20) after kolom_baru6;

alter table table_baru2 
	modify kolom_baru6 varchar(20)first;

alter table table_baru2 
	modify id_baru int first;

alter table table_baru2
	modify nama_baru varchar(20) after id_baru;

alter table table_baru2 
	modify kolom_baru5 varchar(20) after nama_baru;


# NOTE
#	buat nama pastiin gapake spasi, pakenya "_"
#	gabisa alter the same column that you're about to add on the same command



