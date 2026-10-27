-- create database 7days_sqlchallange;
-- use 7days_sqlchallange;

-- 1 customers
create table customers(
customer_id int primary key unique,
full_name varchar(40) not null,
email varchar(60) not null,
city varchar(30) not null,
signup_date date not null,
segment varchar(20) not null);

-- 2 product 
create table product(
product_id int primary key,
product_name varchar(40),
catagory varchar(30),
price decimal(10,2),
cost decimal(10,2));

-- 3 orders

create table orders(
order_id int primary key,
customer_id int not null,
order_date date not null,
statue varchar(30),
channel varchar(30),
foreign key (customer_id) references customers(customer_id)
); 

-- 4 orderitems

create table order_items(
order_item_id int primary key,
order_id int,
product_id int,
quality int not null,
unit_price decimal(10,2),
foreign key (order_id) references orders(order_id),
foreign key (product_id) references product(product_id)
); 

-- 5 payment

create table payment(
payment_id int primary key not null,
order_id int,
payment_method varchar(15),
payment_status varchar(30),
amount decimal(10,2),
foreign key(order_id) references orders(order_id));

-- 6 deliveries table

create table deliveries(
delivery_id int primary key,
order_id int,
dispatch_date date,
delivery_date date,
delivery_status varchar(30),
foreign key (order_id) references orders(order_id));