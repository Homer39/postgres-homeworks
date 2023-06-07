-- SQL-команды для создания таблиц
CREATE TABLE customers
(
	customer_id char(5) PRIMARY KEY,
	company_name varchar(100),
	contact_name varchar(100)
);

CREATE TABLE employees
(
	employee_id int PRIMARY KEY,
	first_name varchar(20),
	last_name varchar(20),
	title varchar(100),
	birth_date date,
	notes text
);

CREATE TABLE orders
(
	order_id int PRIMARY KEY,
	customer_id char(5) REFERENCES customers,
	employee_id int REFERENCES employees,
	order_date date,
	ship_city varchar(50)
)