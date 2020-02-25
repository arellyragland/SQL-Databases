--9_2 USER MANAGEMENT

--Create a Logon and password so the person can log into the Server.
CREATE LOGIN myUser WITH PASSWORD='1234';

--Create a user account in Sakila for the user.
USE Sakila
CREATE USER myUser FOR LOGIN myUser;

--Finsh assigning rights to the database by using the GUI
--Databases > db name > Securtiy > user name > Properties > Membership