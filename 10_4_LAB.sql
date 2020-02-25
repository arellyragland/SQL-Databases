--LAB 10_3


CREATE TABLE Salary(
salary_id		INT				PRIMARY KEY		IDENTITY,
employee_num	INT				NOT NULL,
Amount			NUMERIC(8,2)	NOT NULL,
EffectiveDate	DATETIME		NOT NULL
)

ALTER TABLE Salary
ADD CONSTRAINT fk_employee FOREIGN KEY (employee_num) REFERENCES Employees (employee_num);

BEGIN TRAN
INSERT INTO Salary
VALUES (1, 60000.00, '11/11/2019'),
(2, 50000.00, '11/11/2019'),
(3, 45000.00, '11/11/2019'),
(4, 55000.00, '11/11/2019'),
(5, 45000.50, '11/11/2019')
COMMIT TRAN