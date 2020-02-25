USE LAB10
CREATE TABLE Address(
address_id		INT		PRIMARY KEY	IDENTITY,
employee_num	INT		FOREIGN KEY	REFERENCES employees (employee_num),
address_line1	VARCHAR(60) NOT NULL,
address_line2	VARCHAR(30)	NOT NULL,
city			VARCHAR(30) NOT NULL,
state			CHAR(2)		NOT NULL,
zip				INT		NOT NULL
)

CREATE TABLE employee_type(
employe_type	INT		PRIMARY KEY	IDENTITY,
description		VARCHAR(40)
)

BEGIN TRAN
INSERT INTO employee_type
VALUES ('Salary'),
('Hourly'),
('Freelance')
COMMIT TRAN

ALTER TABLE employees
ADD employee_type INT FOREIGN KEY REFERENCES employee_type (employe_type)

CREATE TABLE timeclock (
punch_id	INT	PRIMARY KEY	IDENTITY,
employee_num	INT		FOREIGN KEY	REFERENCES employees (employee_num),
ClockOn		DATETIME,
ClockOff	DATETIME
)