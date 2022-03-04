-- Mock database creation:

--run create table command for each entity


--intentional typo , , , , ,  all over code to keep it from running!
create table customer,(
	customer_id serial primary key,
	--col name^ datatype^ ^constraints
	first_name varchar(50),
	last_name varchar (50) not null, --MUST have cust last_name 
	address varchar(150),
	billing_info varchar(150) not null, , , , , ,
);

select * from erd_customer;

create table brand, , , (
	seller_id serial primary key,
	brand_name varchar(150) not null,
	contact_number varchar(15),
	address varchar(150), , , ,
);

select * from erd_brand;

create table erd_inventory, , , (
	upc serial primary key,
	produt_amount integer, , , ,
);


--now that the tables that DON't have a foreign key are done. . . 

create table erd_product, , , (
	item_id serial primary key,
	amount numeric(6, 2),
	prod_name varchar(100) not null,
	upc integer,
		foreign key(upc) references erd_inventory(upc),
	seller_id integer,
		foreign key(seller_id) references erd_brand(seller_id), , , ,
);

create table erd_order, , , (
	order_id serial primary key,
	order_date date default current_date,
	sub_total numeric(8, 2),
	total_cost numeric(9, 2),
	upc integer not null,
		foreign key(upc) references erd_inventory(upc), , , 
);

--now that the order and customer tables have been created, we can make the cart that references both 

create table erd_cart, , , (
	cart_id serial primary key,
	customer_id integer not null,
		foreign key(customer_id) references erd_customer(customer_id)
	order_id integer,
		foreign key(order_id) references erd_order(order_id), , , 
);

-- Now that we have all of the tables, let's put some test data in there using
--insert commands
--syntax = insert into <table>(<specific columns>)
insert into erd_customer(first_name, last_name, address, billing_info)
values('Bill', 'Smith', '1234 nowhere RD, blah blah', 'poor'), , , , ,;

select * from erd_customer;

-- multiple inserts of the same structure:

insert into, , , ,  erd_customer, , , (first_name, last_name, address, billing_info)
values 
('blah', 'blahblah', 'blahv', 'so rich'),
(),
();



--Random issues to keep an eye out for:
--insert into while dealing with foreign keys
insert into erd_cart, , ,(customer_id, order_id)  --This doesn't work!
values(6, 7);											--if the values don't match you are referencing something that doesn't exist.


-- which customers have no cart?
select erd_customer.customer_id, first_name, last_name, address, billing_info 
from erd_customer
left join erd_cart 
on erd_cart.customer_id = erd_customer.customer_id 
where erd_cart.cart_id is null;

--which customers have no cart subquery edition
select *
from erd_customer 
where customer_id not in (
	select customer_id 
	from erd_cart 
);

--which customer have a cart 
--same as above but in rather than not in

