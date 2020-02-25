--LAB 9_3
--Backup - Restore
--Note: You may need to stop/start SQL server to DROP the sakila database.
--You may need to run these commands in a seperate query window to drop the database.

BACKUP DATABASE Sakila
	TO DISK='D:\Backups\9_3_lab.bak'
	WITH FORMAT;
GO

USE master;
GO

DROP DATABASE sakila;
GO

RESTORE DATABASE sakila
    FROM DISK = 'D:\Backups\9_3_lab.bak'
    WITH RECOVERY;
