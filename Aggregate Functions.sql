--5_1 Code Examples
USE WORLD

--Total GNP By Continent
SELECT
SUM(GNP) AS 'Total GNP',
Continent
FROM Country
GROUP BY Continent;

select * from country

--Total GNP By Government, Sorted
SELECT
SUM(GNP) AS 'Total GNP',
GovernmentForm
FROM Country
GROUP BY GovernmentForm
ORDER BY [Total GNP] DESC; --order high to low

--Average Year of Independence By Region, Sorted
SELECT
AVG(IndepYear) AS 'Average Year of Indep',
Region
FROM country
GROUP BY Region
ORDER BY [Average Year of Indep] ASC; --order low to high

--Total SurfaceArea By Continent, Region
SELECT
SUM(SurfaceArea) as 'Total Surface',
Continent
FROM country
GROUP BY Continent
ORDER BY [Total Surface] DESC; -- order highest to lowest.


--Total SurfaceArea By Continent, Region
SELECT
SUM(SurfaceArea) as 'Total Surface',
Continent,
Region
FROM country
GROUP BY Continent, Region
ORDER BY [Total Surface] DESC; -- order highest to lowest.

--No Grouping here. This  just shows a table sorted by multiple columns
SELECT 
name,
Continent,
LifeExpectancy,
GNP,
Population
FROM country
ORDER By LifeExpectancy DESC, GNP DESC , Population DESC;
--Sort first by Life, then GNP, then Pop
--Switzerland/Sweden tie in Life Exp, so GNP sorts next.

--Average Lifespan by Continent, filtered by HAVING
SELECT
AVG(LifeExpectancy) AS 'Average Life',
Continent
FROM Country
GROUP By Continent
HAVING AVG(LifeExpectancy)> 70
ORDER BY [Average Life] DESC;

--Average Lifespan by Region
SELECT
AVG(LifeExpectancy) AS 'Average Life',
Region
FROM Country
GROUP By Region
ORDER BY [Average Life] DESC;

--how many countries are in each continent?
SELECT
COUNT(name) AS 'Count of Countries',
Continent
FROM country
GROUP By Continent

--What's the highest life expencany in the country table?
SELECT
MAX(lifeExpectancy) 'Highest Life Expectancy'
FROM country;

--What's the oldest date of independence for a country in europe?
SELECT
MIN(IndepYear) AS 'Oldest Year of Indep'
FROM country
WHERE Continent = 'Europe';

--hmmm, but which country is that?
SELECT 
Name,
IndepYear
FROM country
WHERE Continent = 'Europe'
AND IndepYear = (
	SELECT 
	MIN(IndepYear) AS 'Oldest Year of Indep'
	FROM country
	WHERE Continent = 'Europe');
--This is a more more tricky query.  This is called a sub-query. In the WHERE clause, we set the value equal to the results returned by 
--the sub query

--SAKILA Examples


USE Sakila
--Average length of films by rating
SELECT
AVG(length) AS 'Average Length (minutes)',
rating
FROM film
GROUP BY rating;


--PUTTING IT ALL TOGETHER
--This query uses joins and group by and order by to find which customer has spent the most money on movie rentals
SELECT 
customer.last_name,
customer.first_name,
SUM(payment.amount) AS 'Total Spent'
FROM payment
JOIN customer on customer.customer_id = payment.customer_id  --we need to join the customer tableto see customer info
GROUP BY customer.last_name, customer.first_name
ORDER BY [Total Spent] DESC;

--Which actor has appeared in the most films?
SELECT
actor.last_name,
actor.first_name,
count(film_id) as 'Number of Films' --we are counting the number of films
FROM film_actor --table has list of all films the actors have been in
JOIN actor on actor.actor_id = film_actor.actor_id --and joining actor to get actor info
GROUP BY actor.last_name, actor.first_name
ORDER By [Number of Films] DESC ;

--Which actor has appeared in the most films by their rating?
SELECT
actor.last_name,
actor.first_name,
film.rating,
count(film_actor.film_id) as 'Number of Films' --we are counting the number of films
FROM film_actor --table has list of all films the actors have been in
JOIN actor on actor.actor_id = film_actor.actor_id --and joining actor to get actor info
JOIN film on film.film_id = film_actor.film_id -- get film info as well
GROUP BY film.rating, actor.last_name, actor.first_name
ORDER By film.rating, [Number of Films] DESC ;

