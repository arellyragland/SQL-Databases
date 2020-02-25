--9_1 Examples
--Database Management, Backup and Restore


--Make a fullBackup a database to a .bak file.
--Each time this command is ran, another COPY of the backup will be added to the file
--and the file will grow in size.

--The advantage to this approach is you could restore from older copies.
--The disadvantage is your backup files can become very large.
BACKUP DATABASE Sakila
TO DISK='D:\DBBackups\Sakila.bak';

--Backup only what has changed in the database since the LAST full backup. This requires a full backup first
BACKUP DATABASE Sakila
TO DISK='D:\DBBackups\Sakila.bak'
WITH DIFFERENTIAL;


--Make a full Backup the database and erase any previous copies .
BACKUP DATABASE Sakila
TO DISK='D:\DBBackups\Sakila.bak'
WITH FORMAT;


--Nuke the database. It's gone!
--DROP Database will delete everything, so you had better have a .bak file!
--If you get an error here, try restarting SQL server.
USE master;
GO
DROP DATABASE Sakila;

--Restore the database.  
--After the restore, mark the database as Recovered (this turn it online and make it available to users)
RESTORE DATABASE Sakila
FROM DISK='D:\DBBackups\Sakila.bak'
WITH RECOVERY;
GO

--Create a new blank database with nothing in it.
--Make sure you create a folder called dbs on D: drive FIRST.
CREATE DATABASE myNewDatabase
ON
(
	NAME = mydb_dat,
	FILENAME = 'D:\dbs\mydb.mdf'
)
LOG ON
(
	NAME = mydb_log,
	FILENAME = 'D:\dbs\mydb.log'
);
GO