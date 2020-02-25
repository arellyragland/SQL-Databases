USE world;

--first query
SELECT *
FROM country;


--where region is caribbean
SELECT *
FROM country
WHERE Region = 'Caribbean';

--where population is greater than 1,000,000
SELECT *
FROM country
WHERE Population  > 1000000;

--where continent is europe or asia
SELECT *
FROM country
WHERE continent = 'Europe' 
OR continent = 'Asia';

--where continent is south america or indepYear is > 1950
SELECT * 
FROM country
WHERE continent = 'South America'
OR IndepYear > 1950;

--where continent is south america and governemnt is republic 
SELECT * 
FROM country
WHERE continent = 'South America'
AND GovernmentForm = 'Republic';

--...And the indepence year is 1811
SELECT * 
FROM country
WHERE continent = 'South America'
AND GovernmentForm = 'Republic'
AND IndepYear = 1811;


--Practice 'Between'
SELECT *
FROM country
WHERE Population between 6000000 and 12000000;


SELECT *
FROM country
WHERE LifeExpectancy between 62 and 72;

--Practice Like

SELECT * 
FROM country
WHERE Name like 'B%';

SELECT * 
FROM country
WHERE Name like 'Bu%';

SELECT * 
FROM country
WHERE Name like 'Cr%';

SELECT * 
FROM country
WHERE Name like '%An%';

--Practice IN

SELECT * 
FROM country
WHERE Name IN ('Spain', 'Brazil', 'United Kingdom');

SELECT * 
FROM country
WHERE Continent IN ('Europe' , 'South America'); 


--Practice column selection
SELECT
name,
continent,
gnp,
LocalName
FROM country;

--columns can appear in any order.
SELECT
LocalName,
gnp,
Continent,
name
FROM country;

--columns can repeat

SELECT
name,
name,
name,
continent
FROM country;


--columns can be given a different name for the query. 
--the real column name of the table doesn't change
SELECT
name AS 'Country Name',
continent
FROM country;