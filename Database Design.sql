USE master
CREATE DATABASE OnlineShopping;

USE OnlineShopping

CREATE TABLE Customers(
customer_id INT PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
phone_number VARCHAR(12) NOT NULL,
email_address VARCHAR(100),
birthday DATETIME
)

--Orders can only be created after customers because it has a foreign key to customers.
CREATE TABLE Orders(
order_number INT PRIMARY KEY,
order_date DateTime,
customer_id INT FOREIGN KEY REFERENCES Customers(customer_id)
)

CREATE TABLE Items(
item_id INT PRIMARY KEY,
item_name VARCHAR(MAX),
item_price NUMERIC(8,2)
)

CREATE TABLE ShoppingCart(
order_number INT FOREIGN KEY REFERENCES Orders(order_number),
item_id INT FOREIGN KEY REFERENCES Items(item_id),
quantity INT NOT NULL

--When spreading a primary key across multiple columns, we add it with the code below
CONSTRAINT ShoppingCart_PK PRIMARY KEY
(order_number, item_id)
)

BEGIN TRAN
INSERT INTO Customers
VALUES(1,'John','White','123-456-1234','john.white@gmail.com','02/13/1970')
COMMIT TRAN

BEGIN TRAN
INSERT INTO Customers
VALUES(2,'Peggy','Black','222-222-1234','peggy.black@gmail.com','07/28/1984')
COMMIT TRAN

SELECT * FROM Customers

--We can insert multiple records in one statement
BEGIN TRAN
INSERT INTO Orders
VALUES (1,'02/05/2019',1), (2,'04/20/2019',1), (3,'05/12/2019',2)
COMMIT TRAN

SELECT * FROM Orders

--Our orders are empty right now. Let's create some items to add to the order's shopping cart
BEGIN TRAN
INSERT INTO Items
VALUES (1,'Apple',1.99), (2,'Grapes',2.99), (3,'Bananas',0.99)
COMMIT TRAN

SELECT * FROM Items

--Now start adding items to the shopping cart table

--Order 1
BEGIN TRAN
INSERT INTO ShoppingCart
VALUES (1,2,5) --Order 1, Item 2, Quantity 5
COMMIT TRAN


BEGIN TRAN
INSERT INTO ShoppingCart
VALUES (2,1,6), (2,2,5),(2,3,4) --Order 2, Item 1, Quantity 6..and so on....
COMMIT TRAN

BEGIN TRAN
INSERT INTO ShoppingCart
VALUES (3,2,10), (3,1,2) --Order 3, Item 2, Quantity 10..and so on....
COMMIT TRAN

--Now Let write a select statement to see all of the orders data

SELECT *
FROM Orders
JOIN Customers on Customers.customer_id = Orders.customer_id
JOIN ShoppingCart on ShoppingCart.order_number = orders.order_number
JOIN Items on Items.item_id = ShoppingCart.item_id


--Let's clean it up to only show the information we want.
SELECT 
Orders.order_number,
Orders.order_date,
Customers.first_name,
Customers.last_name,
Customers.phone_number,
Items.item_name,
Items.item_price,
ShoppingCart.quantity
FROM Orders
JOIN Customers on Customers.customer_id = Orders.customer_id
JOIN ShoppingCart on ShoppingCart.order_number = orders.order_number
JOIN Items on Items.item_id = ShoppingCart.item_id