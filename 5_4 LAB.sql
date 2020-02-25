--1
USE Sakila
SELECT 
customer.first_name,
customer.last_name,
SUM(payment.amount) AS 'Total Payments'
FROM customer
JOIN payment on payment.customer_id = customer.customer_id
GROUP BY customer.first_name, customer.last_name
ORDER By [Total Payments] DESC;

--2
SELECT
film.rating,
count(*) AS 'Film Count'
FROM film
GROUP BY film.rating
ORDER BY film.rating;

--3
USE WORLD
SELECT
country.Continent,
AVG(country.LifeExpectancy) AS 'Average Life Expectancy'
FROM country
GROUP BY country.Continent
ORDER BY Continent ASC

--4 
SELECT
country.name,
count(*) 'Count of Cities'
from city
JOIN country on country.Code = city.CountryCode
GROUP BY country.name
ORDER By Country.Name

--5
USE sakila
SELECT 
Title,
Length
from film
WHERE length = (SELECT MAX(length) FROM film);

--6
USE sakila
SELECT 
Title,
Length
from film
WHERE length = (SELECT MIN(length) FROM film);

--7
SELECT
Rating,
AVG(length) AS  'Average Length'
FROM film
GROUP BY rating


--8
SELECT
title,
LEN(title) 'Letters'
FROM film
ORDER BY [Letters] DESC

--9
SELECT
lower(title) AS 'Title Lowercased'
FROM film

--10
BEGIN TRAN
UPDATE film
SET title = lower(title)
COMMIT TRAN

--11
SELECT * 
FROM film
WHERE title like '%bird%'

--12
SELECT
REPLACE(title, 'bird','dog') as 'New Title'
FROM film
WHERE title like '%bird%'

--13
BEGIN TRAN
UPDATE film
SET title = REPLACE(title, 'bird', 'dog')
FROM film
WHERE title like '%bird%'
COMMIT TRAN