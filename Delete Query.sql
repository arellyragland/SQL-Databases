--3_5 Code Examples

--Using World Database
USE WORLD

--Before
SELECT * FROM City;

--Delete
BEGIN TRAN
DELETE FROM City
WHERE Name = 'Amsterdam'
COMMIT TRAN;

--After
SELECT * FROM City;

--Example of Delete blocked by database rules
USE Chinook
BEGIN TRAN
DELETE FROM Artist
WHERE Name = 'Miles Davis';
COMMIT TRAN

--Chinook database is difficult to delete from due to the rules setupso ,lets switch back to World
USE World

--World database is missing the delete rules, so it's easy to run delete statments
USE World
BEGIN TRAN
--Delete Rwanda by name
DELETE FROM country
WHERE Name = 'Rwanda'
--Delete Senegal by Country Code
DELETE FROM country
WHERE code = 'SEN'
COMMIT TRAN

BEGIN TRAN
--Wow! Delete all countries by continent! Removes 55 records from the database!
DELETE FROM country
WHERE Continent = 'Africa'
COMMIT TRAN

