USE [sakila]
GO

/****** Object:  View [dbo].[CustomerAddress]    Script Date: 10/31/2019 11:19:34 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW [dbo].[CustomerAddress] 
AS
SELECT 
c.first_name,
c.last_name,
c.email,
a.phone,
a.address,
a.address2,
cty.city,
a.postal_code,
isActive = CASE WHEN c.active  =  1 THEN 'Yes'
			WHEN c.active = 0 THEN 'No'
			ELSE '?' END

FROM customer c
JOIN address a on a.address_id = c.address_id
JOIN city cty on cty.city_id = a.city_id;
GO


