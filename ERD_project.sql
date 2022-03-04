create table Salesperson(
	sales_id serial primary key,
	first_name varchar(50) not null,
	last_name varchar (50) not null 
	
);

select * from Salesperson;

create table mechanic(
	mech_id serial primary key,
	first_name varchar(50) not null,
	last_name varchar(50) not null
);

create table parts_inventory(
	part_id serial primary key,
	part_name varchar(150),
	part_brand varchar(150),
	part_price numeric(8, 2)
);

create table car(
	car_id serial primary key,
	make varchar(50) not null,
	model varchar(50) not null,
	color varchar(25),
	car_year integer
);

select * from car;

create table sales_invoice(
	invoice_id serial primary key,
	invoice_date date default current_date,
	price numeric(8, 2),
	car_id integer,
		foreign key(car_id) references car(car_id),
	sales_id integer,
		foreign key(sales_id) references Salesperson(sales_id)
);

create table customer(
	customer_id serial primary key,
	first_name varchar(50),
	last_name varchar(50),
	address varchar(150),
	email varchar(100),
	phone varchar(25),
	car_id integer,
		foreign key(car_id) references car(car_id)
);

create table service_ticket(
	service_id serial primary key,
	service_date date default current_date,
	description varchar(250),
	price numeric(7, 2),
	car_id integer,
		foreign key(car_id) references car(car_id),
	part_id integer,
		foreign key (part_id) references parts_inventory(part_id)
);

create table mechanic_service(
	service_id integer,
		foreign key(service_id) references service_ticket(service_id),
	mech_id integer,
		foreign key(mech_id) references mechanic(mech_id)
);

create table parts_service(
	service_id integer,
		foreign key(service_id) references service_ticket(service_id),
	part_id integer,
		foreign key(part_id) references parts_inventory(part_id)
);


-- Now that we have all of the tables, let's put some test data in there using
--insert commands
--syntax = insert into <table>(<specific columns>)
insert into erd_customer(first_name, last_name, address, billing_info)
values('Bill', 'Smith', '1234 nowhere RD, blah blah', 'poor'), , , , ,;

select * from erd_customer;

-- multiple inserts of the same structure:

insert into customer(first_name, last_name, address, email, phone)
values 
('Jon', 'Bonham', '1979 Redditch, Worcestershire, UK', 'bonzo@lz.org', '2-999-888-1979'),
('Keith', 'Moon', 'Alperton, Middlesex, UK', 'banger@who.com', '13-456-7891'),
('Dimebag', 'Darrell', 'Arlington, TX, USA', 'ripper@newhere.com', '321-644-987987'),
('Scott', 'Weiland', 'Ohio, Cali, USA', 'childsupport@collect.com', '515-244-2277'),
('Amy', 'Winehouse', 'Gordon Hill, Enfield, UK', 'frequentguest@rehab.com', '515-244-2277');

insert into car(make, model, color, car_year)
values 
('Chevy', 'Nova', 'Black', 1978),
('Bentley', 'Mark-something', 'Blue', 2005),
('Pontiac', 'Grand-Prix', 'Silver', 2003),
('Honda', 'Civic', 'Brown', 1989);

insert into car(make, model, color, car_year)
values 
('Toyota', 'Tacoma', 'Yellow', 2022),
('Nissan', 'Maxima', 'Blue', 2023),
('Kia', 'Telluride', 'Grey', 2022),
('Scion', 'XB', 'Green', 2020);

insert into Salesperson(first_name, last_name)
values
('Tony', 'Robbins'),
('Sheila', 'Robinson'),
('Amber', 'Hearst'),
('George', 'Hartley'),
('Trent', 'Reznor');

insert into mechanic(first_name, last_name)
values 
('Janis', 'Joplin'),
('Jimi', 'Hendrix'),
('Jim', 'Morrison'),
('Kurt', 'Cobain');

insert into parts_inventory(part_name, part_brand, part_price)
values
('Oil filter', 'Fram', 13.00),
('Transmission', 'OEM', 2500.00),
('W Wiper Blades', 'Bosch', 22.99),
('AT Tire set', 'GoodYear', 946.55);

insert into sales_invoice(price, car_id, sales_id)
values 
(35000.00, 5, 1),
(31500.99, 6, 3),
(15000.0, 8, 5);

insert into service_ticket(description, price, car_id, part_id)
values 
('oil change', 55.99, 1, 1),
('tranny-swap', 3000, 3, 2),
('new wipers', 90.00, 2, 3);

service_id serial primary key,
	service_date date default current_date,
	description varchar(250),
	price numeric(7, 2),
	car_id integer,
		foreign key(car_id) references car(car_id),
	part_id integer,
		foreign key (part_id) references parts_inventory(part_id)


select * from car;
select * from parts_inventory;


