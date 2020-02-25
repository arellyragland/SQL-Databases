--3_2 LAB
USE sakila;

BEGIN TRAN
UPDATE actor
SET first_name = 'Julia',
last_name = 'Roberts'
WHERE actor_id = 1
COMMIT TRAN

BEGIN TRAN
UPDATE actor
SET first_name = 'Will',
last_name = 'Smith'
WHERE actor_id = 2
COMMIT TRAN

BEGIN TRAN
UPDATE actor
SET first_name = 'Arnold',
last_name = 'Schwarzenegger'
WHERE actor_id = 3
COMMIT TRAN

BEGIN TRAN
UPDATE film
SET title = 'Beverly Hills Cop',
rental_rate = 5.99
WHERE film_id = 1
COMMIT TRAN

BEGIN TRAN
UPDATE film
SET title = 'Star Wars',
rental_rate = 5.99
WHERE film_id = 2
COMMIT TRAN

BEGIN TRAN
UPDATE film
SET title = 'The Godfather',
rental_rate = 5.99
WHERE film_id = 3
COMMIT TRAN

BEGIN TRAN
UPDATE Address
SET postal_code = 11111
WHERE address_id = 1
COMMIT TRAN

BEGIN TRAN
UPDATE Address
SET postal_code = 12345
WHERE address_id = 2
COMMIT TRAN


BEGIN TRAN
UPDATE Address
SET postal_code = 99999
WHERE address_id = 3
COMMIT TRAN