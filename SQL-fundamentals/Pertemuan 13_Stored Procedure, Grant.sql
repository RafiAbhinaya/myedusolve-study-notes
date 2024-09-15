# Pertemuan 13 Stored Procedure, Grant

# contoh query yang inging di store
select
		act.actor_id ,
		act.first_name ,
		act.last_name 
	from
		sakila.actor act;

# created stored procedure
create procedure get_actor_name()
begin
	select
		act.actor_id,
		act.first_name,
		act.last_name 
	from
		sakila.actor act;
end;

# call procedure
call get_actor_name();

# procedure - input (in)
#contoh query
select
	act.actor_id ,
	act.first_name ,
	act.last_name 
from
	sakila.actor act
where 
	act.first_name = 'Nick'
;

#create stored procedure - in
create procedure get_actor_by_name (in actor_name varchar(100))
begin
	select
	act.actor_id ,
	act.first_name ,
	act.last_name 
from
	sakila.actor act
where 
	act.first_name = actor_name;
end

# call procedure - in
call get_actor_by_name ('nick');

#procedure - input dan output paramater (in and out)
#contoh query
select 
	sum(pay.amount) as total
from 
	sakila.payment pay
where 
	pay.customer_id = 1

# create stored procedure - in and out
create procedure get_payment_by_cust_id (in cust_id int, out total int)
begin 
	select 
	sum(pay.amount) into total
from 
	sakila.payment pay
where 
	pay.customer_id = cust_id;
end;

# call procedure
call get_payment_by_cust_id(26, @total) 

select @total;

drop procedure get_payment_by_cust_id;






