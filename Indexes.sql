
--8_3 Code Examples
--Indexes
--Remember to turn 'Actual Execution Plan on first '
USE Sakila;
GO

CREATE NONCLUSTERED INDEX idx_film_title
ON film(title);
GO

SELECT title
FROM film;

CREATE NONCLUSTERED INDEX idx_film_myIndex
ON film(title, rating, length, release_year);
GO

SELECT title, rating FROM film
WHERE release_year = '2006'