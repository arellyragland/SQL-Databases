USE World

--1
SELECT * 
FROM City
WHERE CountryCode = 'BRA';

--2
SELECT * 
FROM City
WHERE Name LIKE 'Spring%';

--3
SELECT *
FROM country
where IndepYear > 1900;

--4
select * from countrylanguage
WHERE CountryCode = 'USA';

--5
SELECT * FROM city
where name between 'C' and 'R';


--6
SELECT * 
FROM country 
WHERE gnp < GNPOld;

--7
SELECT * 
FROM country 
WHERE IndepYear IS NULL;


--8
SELECT *
FROM Country
WHERE Continent = 'Africa'
AND population > 4000000;


--9
SELECT *
FROM Country
WHERE Continent = 'Africa'
OR  Continent = 'North America'
OR name = 'China';


--10
SELECT *
FROM country
WHERE NOT Continent = 'Asia'

--11
SELECT *
FROM country
WHERE Continent != 'Asia'