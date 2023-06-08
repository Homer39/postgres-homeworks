-- SQL-команды для создания таблиц
CREATE TABLE IF NOT EXISTS customers
(
	customer_id char(5) PRIMARY KEY,
	company_name varchar(100),
	contact_name varchar(100)
);

CREATE TABLE IF NOT EXISTS employees
(
	employee_id int PRIMARY KEY,
	first_name varchar(20),
	last_name varchar(20),
	title varchar(100),
	birth_date date,
	notes text
);

CREATE TABLE IF NOT EXISTS orders
(
	order_id int PRIMARY KEY,
	customer_id char(5) REFERENCES customers ON DELETE CASCADE,
	employee_id int REFERENCES employees ON DELETE CASCADE,
	order_date date,
	ship_city varchar(50)
)