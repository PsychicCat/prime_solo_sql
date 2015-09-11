-- create tables for customers and insert customer values
CREATE TABLE customers (
	CustomerID SERIAL PRIMARY KEY NOT NULL,
	LastName varchar(255),
	FirstName varchar(255),
	Address varchar(255),
	City varchar(255),
	Zip int
);

INSERT INTO customers (LastName, FirstName, Address, City, Zip)
	VALUES
		('Hernandez', 'Linda', '2902 Red Dog Road', 'Charlotte', '28202'),
		('Howell', 'Tobias', '1108 Ash Avenue', 'Saint Louis', '63146'),
		('Newhall', 'Glen', '1111 Whitman Court', 'North Haven', '06473'),
		('Morgan', 'Anna', '1712 Stone Lane', 'Pottstown', '19464'),
		('Lovejoy', 'Florence', '3367 Trainer Avenue', 'Peoria', '61602');


--create table for products and insert product values 
CREATE TABLE products (
	ProductID SERIAL PRIMARY KEY NOT NULL,
	Name varchar(255) NOT NULL,
	Price numeric(5,2) NOT NULL,
	Stock int
);

INSERT INTO products (Name, Price, Stock)
	VALUES
		('Legos', 50.00, 20),
		('1992 Toyota Corolla', 999.00, 1),
		('720ml junmai daiginjo sake', 20.00, 50),
		('1 oz Mr. Nice', 300.00, 4),
		('Roland Juno-106', '500.00', 2);


--create table for orders and insert 10 orders
CREATE TABLE orders (
	OrderID SERIAL PRIMARY KEY,
	Date date NOT NULL DEFAULT NOW(),
	CustomerID int,
	CONSTRAINT fk_customer_id FOREIGN KEY (CustomerID) REFERENCES customers(CustomerID)
);

INSERT INTO orders (CustomerID)
	VALUES
		(1),(2),(3),(4),(5),(5),(4),(3),(3),(2);

-- create table for order items and insert order items
CREATE TABLE order_items (
	OrderID int,
	ProductID int,
	Quantity int,
	FOREIGN KEY (OrderID) REFERENCES orders(OrderID),
	FOREIGN KEY (ProductID) REFERENCES products(ProductID)
);

INSERT INTO order_items (OrderID, ProductID, Quantity)
	VALUES
		(1, 5, 1),
		(2, 3, 5),
		(3, 3, 5),
		(4, 4, 2),
		(5, 1, 2),
		(6, 1, 3),
		(7, 2, 1),
		(8, 3, 20),
		(9, 4, 1),
		(10, 1, 10);