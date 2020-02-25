--8_2 Lab

CREATE TABLE Invoice_Audit(
Invoice_audit_id INT PRIMARY KEY IDENTITY,
InvoiceId INT,
Username VARCHAR(50),
Date_Added DATETIME
)
GO

CREATE TRIGGER invoice_add
ON Invoice
AFTER INSERT
AS
INSERT INTO Invoice_Audit (InvoiceId, Username, Date_Added)
SELECT
inserted.InvoiceID,
SUSER_SNAME(),
CURRENT_TIMESTAMP
FROM inserted;
GO

--Test the Trigger
INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, Total)
VALUES(
641,
2,
'2019-02-14 00:00:00.000',
5.99
)

Select * from Invoice_Audit
GO

ALTER TABLE Invoice_audit
ADD UserAction VARCHAR(20)
GO

ALTER TRIGGER [dbo].[invoice_add]
ON [dbo].[Invoice]
AFTER INSERT
AS
INSERT INTO Invoice_Audit (InvoiceId, Username, Date_Added, UserAction)
SELECT
inserted.InvoiceID,
SUSER_SNAME(),
CURRENT_TIMESTAMP,
'INSERTED'
FROM inserted;
GO

CREATE TRIGGER invoice_delete
ON Invoice
AFTER DELETE
AS
INSERT INTO Invoice_Audit (InvoiceId, Username, Date_Added, UserAction)
SELECT
deleted.InvoiceID,
SUSER_SNAME(),
CURRENT_TIMESTAMP,
'DELETED'
FROM deleted;
GO


--Test the Trigger
DELETE FROM Invoice
WHERE invoiceId = 641;

SELECT * FROM Invoice_Audit