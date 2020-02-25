--JOIN #1
SELECT
customer.first_name,
customer.last_name,
customer.email,
address.address
FROM Customer
JOIN Address on Address.address_id = Customer.address_id


--JOIN 2
SELECT
customer.first_name,
customer.last_name,
customer.email,
address.address,
city.city
FROM Customer
JOIN Address on Address.address_id = Customer.address_id
JOIN city on city.city_id = address.city_id


--JOIN 3
SELECT
film.title,
film.description,
film.release_year,
film.rental_rate,
film.rating,
language.name
FROM film
JOIN language on language.language_id = film.language_id

--JOIN 4
SELECT
actor.first_name,
actor.last_name,
film.title,
film.description,
film.rating
FROM actor
JOIN film_actor on film_actor.actor_id = actor.actor_id
JOIN film on film.film_id = film_actor.film_id

--JOIN 5
SELECT
customer.first_name,
customer.last_name,
payment.amount,
film.title
FROM customer
JOIN payment on payment.customer_id = customer.customer_id
JOIN rental on rental.rental_id = payment.rental_id
JOIN inventory on inventory.inventory_id = rental.inventory_id
JOIN film on film.film_id = inventory.film_id

--SUB QUERY 1
SELECT *
FROM customer
WHERE customer_id IN (
	SELECT customer_id 
	FROM payment
	WHERE amount > 7
	)	

SELECT * 
FROM Film
JOIN film_actor on film_actor.film_id = film.film_id
WHERE film_actor.actor_id IN (
	SELECT actor_id
	FROM actor
	WHERE actor_id IN (22,32,68)
	)

--Subquery 3
SELECT * 
FROM Film
WHERE film_id in (
	SELECT film_id
	FROM inventory
	WHERE store_id = 2

)