--STORED PROCEDURES CODE EXAMPLES
USE [sakila]
GO

/*
Created:  10/18/2019
Created By: Andy Smith
Purpose:  Add new actors to the actor's table.
*/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddActor]
/*
Created:  10/18/2019
Created By: Andy Smith
Purpose:  Add new actors to the actor's table.
*/
@first_name VARCHAR(45),
@last_name VARCHAR(45),
@last_update DATETIME

AS
INSERT INTO Actor(first_name, last_name, last_update)
VALUES(@first_name, @last_name, @last_update)
GO

EXEC AddActor 'MARK', 'WALHBERG', '2019-10-18 00:00:00.000';
GO

SELECT * FROM actor
WHERE last_name = 'walhberg';
GO

/* Make an update to existing procedure to use the current system time for last update */
ALTER PROCEDURE [dbo].[AddActor]
@first_name VARCHAR(45),
@last_name VARCHAR(45)
AS
DECLARE @last_update DATETIME
SET @last_update = CURRENT_TIMESTAMP

INSERT INTO Actor(first_name, last_name, last_update)
VALUES(@first_name, @last_name, @last_update)
GO

EXEC AddActor 'JOHNNY', 'DEPP';
GO

SELECT * FROM actor
WHERE last_name = 'DEPP';
GO

/*
This procedure adds a new record to the rental table.
The return date is left null to indicate the rental is checked out.
Requires inventory id, customer id, and staff id who performed the checkout
*/

CREATE PROCEDURE Checkout_Rental
@inventory_id INT,
@customer_id INT,
@staff_id INT
AS

INSERT INTO rental(rental_date, inventory_id, customer_id, return_date, staff_id, last_update)
VALUES (CURRENT_TIMESTAMP, @inventory_id, @customer_id, NULL, @staff_id, CURRENT_TIMESTAMP);
GO;

--Testing the SP
EXEC Checkout_Rental 4581, 200, 2

GO;

/*
This procedure updates the rental table by stamping the return date, to indicate the rental is returned
*/

CREATE PROCEDURE Checkin_Rental
@inventory_id INT,
@customer_id INT
AS
UPDATE rental
SET return_date = CURRENT_TIMESTAMP	,
last_update = CURRENT_TIMESTAMP
WHERE inventory_id = @inventory_id
AND customer_id = @customer_id
AND return_date IS NULL;
GO

--Testing the SP
Checkin_Rental 4581, 200

SELECT * FROM rental