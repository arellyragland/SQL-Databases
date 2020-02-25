--6_3 Code Examples
--CASE Statements

USE Chinook;

--Example 1
SELECT Top 25
ArtistId,
Name,
SpecialComment = CASE WHEN Name = 'Aerosmith' THEN 'This is a special case.' 
					WHEN Name = 'AC/DC' THEN 'This is a special case' 
					WHEN Name = 'Alice In Chains' THEN 'This is a special case.'
					WHEN ArtistId = 43 THEN 'This is a special case by Artist ID'
					ELSE 'Default Text'
				 END
FROM Artist
ORDER BY Name



--Example 2
SELECT 
customer.FirstName,
customer.LastName,
invoice.BillingCountry,
isNorthAmericanRegion = CASE WHEN BillingCountry = 'USA' THEN 'Yes'
							WHEN BillingCountry = 'Canada' THEN 'Yes'
							WHEN BillingCountry = 'Mexico' THEN 'Yes'
							ELSE 'No' 
						END
FROM Invoice
JOIN customer on customer.CustomerId = Invoice.CustomerId

--Example 3
USE sakila
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