--5_2 Date Types, CAST and CONVERT

USE World
--CAST & CONVERT Examples
--changing an INT to BIGINT
SELECT
SUM(CAST(population AS BIGINT))
FROM Country;

SELECT
SUM(CONVERT(BIGINT, Population))
FROM Country;

--Cast a decimal to an integer example
SELECT 
CAST(LifeExpectancy AS INT) AS 'LifeExpectancy_int'
FROM Country;


--Convert a date and time to only a date
USE sakila
SELECT 
first_name,
last_name,
CONVERT(DATE, last_update) AS 'last_update_date'
FROM ACTOR;

--Casting a decimal to an integer. Notice it rounds down.
SELECT 
title,
CAST(replacement_cost AS INT) AS 'replacement_cost_integer',
replacement_cost
FROM film