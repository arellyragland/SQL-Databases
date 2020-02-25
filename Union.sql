--4_2 Code Examples - Unions

USE Chinook
SELECT *
FROM track
JOIN genre ON genre.genreID = track.genreID
WHERE genre.name  = 'Rock'

UNION

SELECT *
FROM track
JOIN genre ON genre.genreID = track.genreID
WHERE genre.name  = 'Jazz'


SELECT * 
FROM Genre

UNION

SELECT * 
FROM Artist

USE Chinook
SELECT *
FROM track
JOIN genre ON genre.genreID = track.genreID
WHERE genre.name  IN( 'Rock', 'Jazz');

USE Chinook
SELECT *
FROM track
JOIN genre ON genre.genreID = track.genreID
WHERE genre.name  = 'Rock'
OR genre.name = 'Jazz';