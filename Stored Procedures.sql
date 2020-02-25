--STORED PROCEDURES CODE EXAMPLE
USE [sakila]
GO

/****** Object:  StoredProcedure [dbo].[Search_Customer_Address_By_LastName]    Script Date: 10/31/2019 1:20:29 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[Search_Customer_Address_By_LastName]
@lastname VARCHAR(20)
AS
SELECT 
c.first_name,
c.last_name,
c.email,
a.phone,
a.address,
a.address2,
cty.city,
a.postal_code
FROM customer c
JOIN address a on a.address_id = c.address_id
JOIN city cty on cty.city_id = a.city_id
WHERE c.last_name like @lastname + '%';
GO


EXEC Search_Customer_Address_By_LastName 'Ch';
GO


--Film In Stock SP
--Get the total number of items that are in stock by film/store

CREATE PROCEDURE film_in_stock(@film_id INT, @store_id INT)
AS
    DECLARE @film_count int
    
	SET @film_count = (SELECT count(inventory_id)
    FROM inventory
    WHERE film_id = @film_id
    AND store_id = @store_id
    AND dbo.inventory_in_stock(inventory_id) = 1) --this requires the inventory_in_stock User-Defined function

	SELECT @film_count AS 'Film Count In Stock';


EXEC film_in_stock 1, 1