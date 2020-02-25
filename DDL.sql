--10_1 Examples
--Make sure you ran CREATE DATABASE myNewDatabase in the previous lesson.

USE myNewDatabase

--Create a table about cats.
CREATE TABLE cats (
cat_id	INT	PRIMARY KEY	IDENTITY,
name  VARCHAR(30),
color VARCHAR(20),
born DATETIME,
breed VARCHAR(20),
owner_id INT
);

--Create  a table about cat owners.
CREATE TABLE Owners(
owner_id INT PRIMARY KEY IDENTITY,
firstname VARCHAR(35),
lastname VARCHAR(35)
);

--Create a relationship between cats and their owners.
ALTER TABLE cats
ADD CONSTRAINT FK_owner
FOREIGN KEY (owner_id) REFERENCES Owners;

--Let's create a table to record where owner's live

CREATE TABLE Address(
address_ID INT PRIMARY KEY IDENTITY,
street_adr1 VARCHAR(60),
street_adr2 VARCHAR(30),
city VARCHAR(40),
state CHAR(2),
zip INT
);

--Let's update Owners by adding a column for address
--You can add new columns and relationships with ALTER TABLE.

ALTER TABLE owners
ADD address_ID INT;

ALTER TABLE owners
ADD CONSTRAINT FK_addres
FOREIGN KEY (address_ID) REFERENCES Address;