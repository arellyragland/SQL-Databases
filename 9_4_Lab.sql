--9_4 LAB
--User Account Creation and Permissions
--Note: Use the Graphic User Interface to assign the permissions to these users 

USE master;
CREATE LOGIN user1 WITH PASSWORD =  'Password1'

USE world;
CREATE USER user1 FROM LOGIN user1;

USE master;
CREATE LOGIN user2 WITH PASSWORD =  'Password2'

USE sakila;
CREATE USER user2 FROM LOGIN user2;

USE master;
CREATE LOGIN user3 WITH PASSWORD =  'Password3'

USE world;
CREATE USER user3 FROM LOGIN user3;