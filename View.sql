--CREATE VIEW EXAMPLES
--Create a view that shows actors and the films they have been in
USE sakila
GO

CREATE VIEW ActorsAndFilms
AS
SELECT
actor.first_name,
actor.last_name,
film.title,
film.rental_rate
FROM film_actor
JOIN actor on actor.actor_id = film_actor.actor_id
JOIN film on  film.film_id = film_actor.film_id
GO

SELECT * FROM ActorsAndFilms;
GO

--Create a view of songs, albums, and the artist together
USE Chinook
GO

CREATE VIEW SongsAlbumsAndArtists
AS
SELECT
track.Name AS 'SongName',
album.Title,
artist.Name AS 'Artist'
FROM Track
JOIN album on album.AlbumId = Track.AlbumId
JOIN artist on artist.ArtistId = album.ArtistId
GO


SELECT * FROM SongsAlbumsAndArtists
ORDER BY Artist, title;
GO

--3. Create a Customer Address View

USE Sakila
GO

CREATE VIEW CustomerAddress
AS
SELECT
customer.first_name,
customer.last_name,
customer.email,
address.phone,
address.address,
address.address2,
city.city,
address.postal_code
FROM customer
JOIN address on address.address_id = customer.address_id
JOIN city on city.city_id = address.city_id;
GO


SELECT *
FROM CustomerAddress

SELECT 
first_name,
last_name,
email,
address,
city
FROM CustomerAddress
WHERE city like 'Z%'
ORDER BY last_name