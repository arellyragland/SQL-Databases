--7_4 LAB
--Stored Procedures and User Defined Functions

--Customer Spending

USE Sakila;
GO

CREATE FUNCTION customer_spend (@customer_id INT) RETURNS INT
BEGIN
	DECLARE @total_spend INT

	SET @total_spend = (SELECT SUM(payment.amount)
		FROM payment
		WHERE customer_id = @customer_id
		)

	RETURN @total_spend
END
GO

--Test the UDF
SELECT dbo.customer_spend(5);
SELECT dbo.customer_spend(8);
GO

--Stored Procedure I
CREATE PROCEDURE update_customer_lastname
@customer_id INT,
@new_lastname VARCHAR(45)
AS
BEGIN TRAN
UPDATE customer
SET last_name = @new_lastname
WHERE customer_id = @customer_id
COMMIT TRAN
GO

--Test Stored Procedure
EXEC update_customer_lastname 5 , 'Adamson';

SELECT *
FROM customer where customer_id = 5;
GO


--Stored Procedure II
SELECT * From category
select * from film
GO

CREATE PROCEDURE get_films_by_category
@category_name VARCHAR(25)
AS
SELECT 
film.title,
film.description,
film.release_year,
film.length,
film.rental_rate,
film.rental_duration,
category.name
FROM film 
JOIN film_category ON film_category.film_id = film.film_id
JOIN category ON category.category_id = film_category.category_id
WHERE category.name = @category_name;
GO

EXEC get_films_by_category 'Action'
GO

--Chinook Procedure 
USE Chinook
GO
CREATE PROCEDURE get_invoice_totals_by_customer
@customerId INT
AS
SELECT
customer.FirstName,
customer.LastName,
customer.Email,
SUM(invoice.total) AS 'Total Invoices'
FROM customer
JOIN invoice ON invoice.CustomerId = Customer.CustomerId
WHERE invoice.CustomerId = @customerId
GROUP BY customer.FirstName, Customer.LastName, Customer.Email
GO

--Test the Procedure
EXEC get_invoice_totals_by_customer 2;
EXEC get_invoice_totals_by_customer 26;
GO

CREATE PROCEDURE get_tracks_by_genre
@genre_name VARCHAR(120)
AS
SELECT
track.Name,
track.UnitPrice,
genre.name
FROM track
JOIN genre ON genre.GenreId = track.GenreId
WHERE genre.name = @genre_name
GO

--Test Procedure
EXEC get_tracks_by_genre 'World'
EXEC get_tracks_by_genre 'Jazz'

GO

ALTER PROCEDURE [dbo].[get_tracks_by_genre]
@genre_name VARCHAR(120)
AS
SELECT
track.Name,
track.UnitPrice,
genre.name
FROM track
JOIN genre ON genre.GenreId = track.GenreId
WHERE genre.name = @genre_name
ORDER By track.Name 
GO

--Test the updated SP.
EXEC get_tracks_by_genre 'World'
