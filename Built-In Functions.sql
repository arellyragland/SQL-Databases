--5_3 Code Examples
--BUILT IN FUNCTIONS

USE sakila

--LEN examples
SELECT 
first_name,
LEN(first_name) AS 'length of firstname',
last_name,
LEN(last_name) AS 'length of lastname'
FROM actor;

USE world
SELECT
name,
LEN(name) AS 'lenght of country name'
FROM country;

--Examples of GETDATE and CURRENT_TIMESTAMP
SELECT
CURRENT_TIMESTAMP AS 'Now',
GETDATE() AS 'NOW2',
GETDATE()+1 AS 'Tomorrow',
GETDATE()-1 AS 'Yesterday';


--ROUND examples
USE WORLD
SELECT
LifeExpectancy,
ROUND(LifeExpectancy,0) AS 'rounded to 1 decimial'
FROM country;

USE Sakila
SELECT
rental_rate,
ROUND(rental_rate,0)
FROM film


SELECT ROUND(235.41599, 1) AS RoundValue;
SELECT ROUND(235.41599, 2) AS RoundValue;
SELECT ROUND(235.41599, 3) AS RoundValue;

--ABS examples
--Absolute Value always returns the postive value of a number.
SELECT ABS(-100) AS AbsoluteValue;
SELECT ABS(-654) AS AbsoluteValue;
SELECT ABS(20) AS AbsoluteValue;
SELECT ABS(-1) AS AbsoluteValue;


--Random number example
USE sakila
SELECT 
title,
RAND() AS 'Random number of people who like this film'
FROM film;

SELECT RAND() AS SomeRandomNumber


--LEFT, RIGHT, and RTRIM, LTRIM
SELECT 
'                     Some Text'
UNION aLL
SELECT
LTRIM('    Some Text')
UNION ALL
SELECT
'Some Text                      '
UNION ALL
SELECT
RTRIM('Some Text                      ');


SELECT
LEFT('abcdegh', 3),
LEFT('abcdegh', 4),
RIGHT('uvwxyz', 2);

--first initial, lastname using LEFT
USE sakila
SELECT LEFT(first_name, 1) + last_name
from ACTOR;

--REPLACE
SELECT
REPLACE('person$yahoo.com', '$', '@'),
REPLACE('person@yahoo.com', '.com', '.edu'),
REPLACE('person@yahoo.com', '@yahoo.com', '@gmail.com');


--CHARINDEX (character to search for, what to search, position to start at)
SELECT
CHARINDEX('@', 'person@yahoo.com',  0),
CHARINDEX( 'y', 'person@yahoo.com', 0),
CHARINDEX('.', 'person@yahoo.com',  0);

--UPPER
SELECT
UPPER('smalltext');

--LOWER
USE sakila
SELECT
LOWER(first_name),
LOWER(last_name)
FROM actor;

--SUBSTRING
USE sakila
SELECT top 10
first_name,
SUBSTRING(first_name, 1,2),
last_name,
SUBSTRING(last_name, 1, 3),
SUBSTRING(last_name, 3, 5)
FROM actor

--Using functions in a WHERE clause is allowed
--Select films with short titles (less then 10 characters)
USE sakila
SELECT 
title
FROM film
WHERE LEN(title) < 10;

--SELECT films with the substring "character" in the FIRST 22 letters of the desscription
USE sakila
SELECT 
title,
description,
SUBSTRING(description, 1, 22) As 'Short Description'  
FROM film
WHERE SUBSTRING(description, 1, 22) like '%Character%'
