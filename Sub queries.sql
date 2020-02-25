--4_3 Sub Queries

USe Chinook
select * from track
select * from album
select * from artist

USE Chinook
select  * from track
where name like '%love%'

SELECT 
artist.name,
album.Title
FROM Album 
JOIN Artist on Artist.ArtistId = album.ArtistID 
WHERE AlbumId IN (
	SELECT AlbumId
	FROM track 
	WHERE  name like '%love%'
	);
--72 Results


SELECT 
artist.name,
album.Title,
track.Name
FROM Album 
JOIN Artist on Artist.ArtistId = album.ArtistID 
JOIN Track on Track.AlbumId = album.AlbumId
WHERE track.name like '%love%';
--114 Results

SELECT DISTINCT
artist.name,
album.Title
FROM Album 
JOIN Artist on Artist.ArtistId = album.ArtistID 
JOIN Track on Track.AlbumId = album.AlbumId
WHERE track.name like '%love%';
--72 Results
