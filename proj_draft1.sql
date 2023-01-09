create table customer(
customer_id serial primary key,
first_name VARCHAR,
last_name VARCHAR,
email VARCHAR,
phone VARCHAR,
address VARCHAR
);

select *
from customer c;

create table car(
car_id serial primary key,
new_or_used VARCHAR,
model VARCHAR,
make VARCHAR,
"year" integer, 
miles integer,
purchase_cost integer,
sale_price integer,
internal_external_purchase VARCHAR
);

select *
from car;


create table salesperson(
salesperson_id serial primary key,
first_name VARCHAR,
last_name VARCHAR,
phone numeric (10),
email VARCHAR,
address VARCHAR
);

select *
from salesperson s;

create table invoice(
invoice_id serial primary key,
customer_id integer,
foreign key (customer_id) references customer (customer_id),
car_id INTEGER,
foreign key (car_id) references car (car_id),
salesperson_id integer, 
foreign key (salesperson_id) references salesperson (salesperson_id),
price integer
);

drop table if exists service_mechanic cascade;

select *
from invoice i;

create table service(
service_id serial primary key,
car_id INTEGER not null, 
foreign key (car_id) references car (car_id),
fee INTEGER,
service_history VARCHAR
);

drop table if exists services;

drop table if exists mechanic;

create table mechanic(
mechanic_id serial primary key,
first_name varchar,
last_name varchar, 
email VARCHAR,
phone VARCHAR,
address VARCHAR
);

drop table if exists service_mechanic;

create table service_mechanic( 
service_id integer,
foreign key (service_id) references service (service_id),
mechanic_id integer,
foreign key (mechanic_id) references mechanic (mechanic_id)
);



--DML

--insert customer

create or replace procedure add_customer(first_name varchar, last_name varchar, 
email varchar, phone varchar, address varchar)
language plpgsql
as $$
begin 
	insert into customer (first_name, last_name, email, phone, address)
	values (first_name, last_name, email, phone, address);
end;
$$;

call add_customer (
'Detlemph',
'Jordan',
'detlemphforpres@canditate.com',
'8888888888',
'88 Eigth St, Elmhurst, Vic, Australia'
);

call add_customer (
'Mariah',
'Twain',
'cantcomplain@mariahtwain.com',
'1234567890',
'12 Tree St, Gumble, Brockenhurst'
);

select * 
from customer;

--insert mechanic-------------------------

create or replace procedure add_mechanic(first_name varchar, last_name varchar, 
email varchar, phone varchar, address varchar)
language plpgsql
as $$
begin
	insert into mechanic (first_name, last_name, email, phone, address)
	values (first_name, last_name, 
	email, phone, address);
end;
$$;


call add_mechanic('Melvin', 'Watts', 'melvinpwatts@gmail.com', 
'3333333333', '23 Peel St, West Rosemont, Virginia'); 

call add_mechanic ('Sylvia', 'Watts', 'sylviespalace@gmail.com', '4444444444',
'23 Peel St, West Rosemont, Virginia');

--insert car------------------------------

insert into car (
new_or_used,
model,
make,
"year",
miles,
purchase_cost,
sale_price,
internal_external_purchase
)values(
'new',
'toyota',
'hilux',
2022,
3,
35000,
40000,
'internal'
);

insert into car (
new_or_used,
model,
make,
"year",
miles,
purchase_cost,
sale_price,
internal_external_purchase
)values(
'used',
'landrover',
'discovery',
2001,
100000,
2500,
4000,
'internal'
);

insert into car (
new_or_used,
model,
make,
"year",
miles,
purchase_cost,
sale_price,
internal_external_purchase
)values(
null,
'subaru',
'wrx',
2000,
110000,
null,
null,
'external'
);

--insert salesperson--------------------

insert into salesperson (
first_name,
last_name,
phone,
email,
address
) values (
'Kevin',
'Andrews',
1436953859,
'kandrews@email.com',
'321 fun st, walderton, east gippsland'
), (
'Marina', 
'Cortina',
9874569872,
'marinaheight@hi.com',
'89 feelinfine st, Dublin');

---insert invoice --------------------------

insert into invoice (customer_id, car_id, salesperson_id) values (2,3,2);

--insert into service---------- 

insert into service (car_id, fee, service_history) values (2, $200, 
'Initial service' );

insert into service (car_id, fee, service_history) values (1, $200, 
'regular checkup' );


select *
from service s ;

--insert service_mechanic

insert into service_mechanic (service_id, mechanic_id) values (2, 3);
insert into service_mechanic (service_id, mechanic_id) values (2, 2);

select *
from service_mechanic sm ;

drop procedure add_mechanic(first_name varchar, last_name varchar, 
email varchar, phone integer, address varchar);

select * from invoice i; 

select * from mechanic m ; 

insert into invoice (customer_id, car_id, salesperson_id, price) values (2,3,2, 45000);
insert into invoice (customer_id, car_id, salesperson_id, price) values (1,2,1, 40000);

create or replace procedure add_mechanic(first_name varchar, last_name varchar, 
email varchar, phone varchar, address varchar)
language plpgsql
as $$
begin
	insert into mechanic (first_name, last_name, email, phone, address)
	values (first_name, last_name, 
	email, phone, address);
end;
$$;


call add_mechanic('Melvin', 'Watts', 'melvinpwatts@gmail.com', 
'3333333333', '23 Peel St, West Rosemont, Virginia'); 

call add_mechanic ('Sylvia', 'Watts', 'sylviespalace@gmail.com', '4444444444',
'23 Peel St, West Rosemont, Virginia');

create or replace procedure add_customer(first_name varchar, last_name varchar, 
email varchar, phone varchar, address varchar)
language plpgsql
as $$
begin 
	insert into customer (first_name, last_name, email, phone, address)
	values (first_name, last_name, email, phone, address);
end;
$$;

call add_customer (
'Detlemph',
'Jordan',
'detlemphforpres@canditate.com',
'8888888888',
'88 Eigth St, Elmhurst, Vic, Australia'
);

call add_customer (
'Mariah',
'Twain',
'cantcomplain@mariahtwain.com',
'1234567890',
'12 Tree St, Gumble, Brockenhurst'
);

select * 
from car;

select * 
from customer;

select * 
from invoice;

select * 
from mechanic m ;

select * 
from salesperson s ;

select * 
from service s ;

select * 
from service_mechanic sm; 
