--3_3 Code Examples
USE Chinook

--Let's see what the current data is for Artist and Albums in Chinook
SELECT * FROM Album;
SELECT * FROM Artist;


--Good Examples
USE Chinook
BEGIN TRAN
INSERT INTO Artist
VALUES (999, 'Jay-Z' ) ;
COMMIT TRAN

USE Chinook
BEGIN TRAN
INSERT INTO Artist (ArtistID, Name)
VALUES (1000, 'Kanye West' ) ;
COMMIT TRAN

USE Chinook
BEGIN TRAN
INSERT INTO Artist (Name, ArtistId)
VALUES ('Nick Cave and the Badseeds', 1001 ); 
COMMIT TRAN

--Bad Examples -- These will fail.
USE Chinook
BEGIN TRAN
INSERT INTO Artist (ArtistId, Name)
VALUES ('Imagine Dragons', 1001 ); 
COMMIT TRAN
--Wrong data type

USE Chinook
BEGIN TRAN
INSERT INTO Artist (Name)
VALUES ('The Beatles'); 
COMMIT TRAN
--ArtistID is required and not provided and can not be null

USE Chinook
BEGIN TRAN
INSERT INTO Artist (ArtistId, Name)
VALUES (1, 'Willie Nelson'); 
COMMIT TRAN
--The Value 1 is already assigned to another record in the artist table.


--SAMPLES
--Add a new Artist
BEGIN TRAN
INSERT INTO Artist (ArtistID, Name)
VALUES (276, 'Taylor Swift') ;
COMMIT TRAN


--Add a new album
BEGIN TRAN
INSERT INTO Album (AlbumId, Title, ArtistId)
VALUES (348, 'reputation', 276) ;
COMMIT TRAN

--Add another Artist
BEGIN TRAN
INSERT INTO Artist (ArtistId, Name)
VALUES (278, 'Slipknot') ;
COMMIT TRAN

--Add a new album
BEGIN TRAN
INSERT INTO Album (AlbumId, Title, ArtistId)
VALUES (349, 'We are not your kind', 278) ;
COMMIT TRAN


--Switch to Sakila
USE Sakila

--Success:
BEGIN TRAN
INSERT INTO actor (first_name, last_name)
VALUES ('BRAD', 'PITT');
COMMIT TRAN


--Failure:
BEGIN TRAN
INSERT INTO actor (actor_id, first_name, last_name)
VALUES (1000, 'CHRIS', 'PINE');
COMMIT TRAN
--This FAILS because actor table auto-creates the actor_id, therefore, do not provide one.

--Insert Many Records in one statement.
BEGIN TRAN
INSERT INTO actor (first_name, last_name)
VALUES ('CHRIS', 'PINE'), 
('WILLIAM','SHATNER'),
('LEONARD','NIMOY'),
('ROBERT','DE NIRO');
COMMIT TRAN


