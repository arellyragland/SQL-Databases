--4_1 Code Examples -- JOINS
USE Sakila

--Basic Join Example
SELECT * 
FROM ADDRESS
JOIN CITY ON CITY.CITY_ID = ADDRESS.CITY_ID


--Joining all customers to their payments
SELECT *
FROM customer 
JOIN payment on payment.customer_id = customer.customer_id


--Joining all customers to their payments, with No Locks
SELECT *
FROM customer WITH (NOLOCK)
JOIN payment WITH (NOLOCK) on payment.customer_id = customer.customer_id


--Limiting the columns to be nice and clean
SELECT 
customer.first_name,
customer.last_name,
customer.email,
payment.amount,
payment.payment_date
FROM customer WITH (NOLOCK)
JOIN payment WITH (NOLOCK) on payment.customer_id = customer.customer_id


--Joining Actors to the films they appear in through 'film_actors table'
SELECT 
actor.first_name,
actor.last_name,
film.title,
film.rating
FROM actor WITH (NOLOCK)
JOIN film_actor WITH (NOLOCK) on film_actor.actor_id = actor.actor_id
JOIN film WITH (NOLOCK) on film.film_id = film_actor.film_id

--WHERE Clauses work the same as before
SELECT 
actor.first_name,
actor.last_name,
film.title,
film.rating
FROM actor WITH (NOLOCK)
JOIN film_actor WITH (NOLOCK) on film_actor.actor_id = actor.actor_id
JOIN film WITH (NOLOCK) on film.film_id = film_actor.film_id
WHERE actor.first_name = 'Nick'
OR film.title like 'Dinosaur%';


--Four table join example
USE Chinook
SELECT
artist.Name,
album.Title,
track.Name,
genre.Name
FROM Artist WITH (NOLOCK) 
JOIN album  WITH (NOLOCK) on album.ArtistId = artist.ArtistId
JOIN track  WITH (NOLOCK) on track.AlbumId = album.AlbumId 
JOIN genre  WITH (NOLOCK) on genre.GenreId = track.GenreId
WHERE genre.name = 'Metal'
ORDER By Artist.Name

--the same query as above with table aliases.. artist table is called "jelly" in the query.
USE Chinook
SELECT
jelly.Name,
peanutbutter.Title,
ham.Name,
spam.Name
FROM Artist jelly WITH (NOLOCK) 
JOIN album  peanutbutter  WITH (NOLOCK) on peanutbutter.ArtistId = jelly.ArtistId
JOIN track  ham WITH (NOLOCK) on ham.AlbumId = peanutbutter.AlbumId 
JOIN genre  spam WITH (NOLOCK) on spam.GenreId = ham.GenreId
WHERE spam.name = 'Metal'
ORDER By jelly.Name


--Cartesian Product, Cartesian Join Example
--Returns 220,220 rows!!
--1001 records in film table * 220 records in the actor table

use sakila
Select
film.title,
film.description,
actor.first_name,
actor.last_name
from film, actor
--Notice there is no JOIN used here.
