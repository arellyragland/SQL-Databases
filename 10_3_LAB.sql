--LAB 10_3 Database Design

USE master;
CREATE DATABASE LAB10
ON 
(NAME = 'Lab10_data', FILENAME = 'D:\dbs\lab10.mdf')
LOG ON
(NAME = 'Lab10_log', FILENAME = 'D:\dbs\lab10.ldf');
GO

USE LAB10
CREATE TABLE employees(
employee_num	INT				PRIMARY KEY IDENTITY,
first_name		VARCHAR(30)		NOT NULL,
lastname		VARCHAR(30)		NOT NULL,
birth_date		DATETIME		NOT NULL,
hire_date		DATETIME		NOT NULL,
status_id		INT				NOT NULL,
job_id			INT				NOT NULL,
department_ID	INT				NOT NULL
)

CREATE TABLE employee_status(
status_id		INT			PRIMARY KEY		IDENTITY,
description		VARCHAR(50)	NOT NULL
)

CREATE TABLE job(
job_id			INT			PRIMARY KEY		IDENTITY,
title			VARCHAR(100)	NOT NULL
)

CREATE TABLE department(
department_ID	INT		PRIMARY KEY	IDENTITY,
name			VARCHAR(50),
)


ALTER TABLE employees
ADD CONSTRAINT FK_status FOREIGN KEY (status_id) REFERENCES employee_status (status_id)

ALTER TABLE employees
ADD CONSTRAINT FK_job FOREIGN KEY (job_id) REFERENCES job (job_id)

ALTER TABLE employees
ADD CONSTRAINT FK_dept FOREIGN KEY (department_id) REFERENCES department (department_id)

BEGIN TRAN
INSERT INTO employee_status
VALUES ('Active'),
('No Longer Employeed'),
('Leave of Absence')
COMMIT TRAN

BEGIN TRAN
INSERT INTO job
VALUES ('CEO'),
('Office Worker'),
('Receptionist'),
('Web Admin'),
('Accountant')
COMMIT TRAN

BEGIN TRAN
INSERT INTO department
VALUES ('Accounting/Finance'),
('Sales'),
('Technical'),
('Administration')
COMMIT TRAN

BEGIN TRAN
INSERT INTO employees
VALUES ('Bob', 'Jones', '06/04/1974', '3/15/1999', 1,1,4)
COMMIT TRAN

BEGIN TRAN
INSERT INTO employees
VALUES ('Sarah', 'Robinson', '08/03/1983', '7/5/2011', 1,2,2),
('Matthew', 'Little', '04/16/1985', '2/12/2017', 1,3,2),
('Erik', 'Tanner', '03/12/1967', '7/18/2018', 1,4,3),
('Samuel', 'Davis', '05/25/1988', '3/28/2015', 1,2,4)
COMMIT TRAN
GO

CREATE VIEW employee_details
AS
SELECT
employees.employee_num,
employees.first_name,
employees.lastname,
employees.birth_date,
employees.hire_date,
employee_status.description,
job.title,
department.name
FROM employees
JOIN employee_status on employee_status.status_id = employees.status_id
JOIN job on job.job_id = employees.job_id
JOIN department on department.department_ID = employees.department_ID;
GO

SELECT * FROM employee_details

select * from department	

select * from employees