USE sakila;
GO
--#1
CREATE VIEW top_selling_r_rated_films
AS
SELECT TOP 10
film.title,
film.rating,
SUM(payment.amount) AS 'Rental Sales'
FROM film
JOIN inventory on inventory.film_id = film.film_id
JOIN rental on rental.inventory_id = inventory.inventory_id
JOIN payment on payment.rental_id = rental.rental_id
WHERE rating = 'R'
GROUP BY film.title, film.rating
ORDER By [Rental Sales] DESC;

GO
--Test the view.
SELECT *
FROM top_selling_r_rated_films;
GO

--#2
ALTER VIEW [dbo].[top_selling_r_rated_films]
AS
SELECT TOP 10
film.title,
film.rating,
SUM(payment.amount) AS 'Rental Sales',
film.length
FROM film
JOIN inventory on inventory.film_id = film.film_id
JOIN rental on rental.inventory_id = inventory.inventory_id
JOIN payment on payment.rental_id = rental.rental_id
WHERE rating = 'R'
GROUP BY film.title, film.rating, film.length
ORDER By [Rental Sales] DESC;
GO

SELECT *
FROM top_selling_r_rated_films;
GO

--3
CREATE VIEW best_selling_actors
AS
SELECT TOP 25
actor.first_name,
actor.last_name,
SUM(payment.amount) AS 'Rental Sales'
FROM actor
JOIN film_actor ON film_actor.actor_id = actor.actor_id
JOIN inventory on inventory.film_id = film_actor.film_id
JOIN rental on rental.inventory_id = inventory.inventory_id
JOIN payment on payment.rental_id = rental.rental_id
GROUP BY actor.first_name, actor.last_name
ORDER By [Rental Sales] DESC;
GO

SELECT * from best_selling_actors;
GO

--4 Total Drama films by Actor
CREATE VIEW actor_dramas
AS
SELECT 
actor.first_name,	
actor.last_name,
count(film_actor.film_id) 'Total Drama'
FROM film_actor
JOIN actor on actor.actor_id = film_actor.actor_id
JOIN film_category on film_category.film_id = film_actor.film_id
JOIN category on category.category_id = film_category.category_id
WHERE film_category.category_id = 7
GROUP BY actor.first_name, actor.last_name;
GO

SELECT * from actor_dramas;
GO

--5 Film Rentals By Actor
CREATE VIEW rentals_by_actor
as
SELECT 
actor.first_name,	
actor.last_name,
count(rental.inventory_id) 'Total Views'
FROM film_actor
JOIN actor on actor.actor_id = film_actor.actor_id
JOIN inventory on inventory.film_id = film_actor.film_id
JOIN rental on rental.inventory_id = inventory.inventory_id
GROUP BY actor.first_name, actor.last_name;
GO

SELECT *
FROM rentals_by_actor;
GO

--6 Film Rentals by Title
CREATE VIEW rentals_by_film
AS
SELECT 
film.title,	
count(rental.inventory_id) 'Total Views'
FROM film
JOIN inventory on inventory.film_id = film.film_id
JOIN rental on rental.inventory_id = inventory.inventory_id
GROUP BY film.title
GO
SELECT * FROM rentals_by_film
ORDER BY title DESC;
