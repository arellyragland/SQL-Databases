USE sakila

SELECT * from actor

BEGIN TRAN
INSERT INTO actor (first_name, last_name, last_update)
VALUES ('Jack','Nicholson','2019-11-06 00:00:00.000'),
('Heath','Ledger','2019-11-06 00:00:00.000'),
('Joaquin','Phoenix','2019-11-06 00:00:00.000')
COMMIT TRAN


BEGIN TRAN
INSERT INTO address (address,address2,district,city_id,postal_code,phone,last_update) 
VALUES ('111 Main Street','Apt 12','My District',1,'12345','(111)123-1234',CURRENT_TIMESTAMP),
('123 Sunset Blvd','Apt 150','My District',2,'12345','(222)222-2222',CURRENT_TIMESTAMP)
COMMIT TRAN

BEGIN TRAN
INSERT INTO customer (
store_id,first_name,last_name,email,address_id,active,create_date,last_update)
VALUES (1,'Walter','White','ww@bb.com',1,1,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
(1,'Jessie','Pinkman','jp@bb.com',1,1,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP)
COMMIT TRAN