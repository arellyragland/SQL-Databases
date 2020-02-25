--8_1 Code Examples Triggers
USE sakila;
GO

--Example 1 - CREATING AN LOG TABLE FOR UPDATES
--Let's create a table that will hold the changes made to the customer table.
CREATE TABLE customer_audit_log(
customer_audit_id	INT		PRIMARY KEY	IDENTITY,
customer_id		INT,
store_id	INT,
store_id_old INT,
first_name VARCHAR(45),
first_name_old VARCHAR(45),
last_name	VARCHAR(45),
last_name_old	VARCHAR(45),
email	VARCHAR(45),
email_old VARCHAR(45),
active	CHAR(1),
active_old CHAR(1),
updated_at		DATETIME	NOT NULL,
updated_by		VARCHAR(45)
)

GO


--Create a trigger to record what was inserted and deleted
CREATE TRIGGER customer_update
ON customer
AFTER UPDATE
AS
INSERT INTO customer_audit_log (customer_id	, store_id, store_id_old,
first_name, first_name_old, last_name, last_name_old,  email, email_old,
active, active_old, updated_at,updated_by)
SELECT 
i.customer_id,
i.store_id,
d.store_id,
i.first_name,
d.first_name,
i.last_name,
d.last_name,
i.email,
d.email,
i.active,
d.active,
CURRENT_TIMESTAMP,
SUSER_SNAME()
FROM customer c
join inserted as i on i.customer_id = c.customer_id
join deleted as d on d.customer_id = c.customer_id


--Test changing some records
BEGIN TRAN
UPDATE customer
SET first_name = 'MaryAnn',
last_name = 'Jones',
email = 'maryann.jones@sakilacustomer.com'
WHERE customer_id = 1
COMMIT TRAN

BEGIN TRAN
UPDATE customer
SET first_name = 'Mary',
last_name = 'Jones',
email = 'mary.jones@sakilacustomer.com'
WHERE customer_id = 1
COMMIT TRAN

BEGIN TRAN
UPDATE customer
SET first_name = 'Gary',
last_name = 'Johnson',
email = 'Gary.Johnson@hotmail.com'
WHERE customer_id = 2
COMMIT TRAN

BEGIN TRAN
UPDATE customer
SET first_name = 'Natalie',
last_name = 'Holland',
email = 'Natalie.Holland@hotmail.com',
active = 0
WHERE customer_id = 4
COMMIT TRAN

--Review the new log table to verify its working.
SELECT * FROM customer_audit_log
GO

--Example 2: CREATING A DELETE LOG 

--First, Let's create  table for holding log data on deleted items
CREATE TABLE rental_del_log(
log_id INT PRIMARY KEY IDENTITY,
rental_id INT,
rental_date DATETIME,
inventory_id INT,
customer_id INT,
return_date DATETIME,
staff_id TINYINT,
deleted_on DATETIME,
deleted_by VARCHAR(50)

)
GO
--Next, create an on DELETE trigger.
CREATE TRIGGER rental_delete
ON rental
AFTER DELETE
AS
INSERT INTO rental_del_log (rental_id, rental_date, inventory_id, customer_id, return_date, staff_id, deleted_on, deleted_by)
SELECT
deleted.rental_id,
deleted.rental_date,
deleted.inventory_id,
deleted.customer_id,
deleted.return_date,
deleted.staff_id,
CURRENT_TIMESTAMP,
SUSER_SNAME()
FROM deleted;
GO

--Test the Trigger

BEGIN TRAN
DELETE FROM  rental
WHERE rental_id <= 3;
COMMIT TRAN

SELECT * FROM rental_del_log