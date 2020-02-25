--3_1 Code Examples

USE Chinook

--Record before update
SELECT * 
FROM Employee

--Update Command
BEGIN TRAN
UPDATE Employee
SET LastName = 'Jordan'
WHERE EmployeeId = 2
COMMIT TRAN

--Record after update
SELECT 
Firstname, Lastname
FROM Employee


--Bad Update Example
BEGIN TRAN
UPDATE Employee
SET LastName = 'Opps!!!'

ROLLBACK TRAN

