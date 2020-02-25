USE Sakila
BACKUP DATABASE sakila
TO DISK= 'D:\Backups\3_6lab.bak'

SELECT * 
FROM rental
WHERE rental_id IN (10,11,12,13,14,15);

DELETE FROM rental
WHERE rental_id IN (10,11,12,13,14,15);

SELECT * 
FROM payment
WHERE customer_id = 2;

DELETE FROM rental
WHERE customer_id = 2;