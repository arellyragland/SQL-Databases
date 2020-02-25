/*
7_1 USER DEFINED FUNCTIONS
*/
--Simple Function - Count number of copies of a film
CREATE FUNCTION Num_Film_Copies(@film_id INT) RETURNS INT
BEGIN
	DECLARE @copies_of_film INT
	
	SET @copies_of_film = (	SELECT COUNT(film_id)
		FROM inventory
		WHERE film_id = @film_id
		)

	RETURN @copies_of_film

END
GO

--Test Function
SELECT
dbo.num_film_copies(1)
GO



--More complex example -- check if copy is in stock
CREATE FUNCTION inventory_in_stock(@inventory_id INT) RETURNS tinyint
BEGIN
    DECLARE @rentals INT;
    DECLARE @out INT;

    -- AN ITEM IS IN-STOCK IF THERE ARE EITHER NO ROWS IN THE rental TABLE
    -- FOR THE ITEM OR ALL ROWS HAVE return_date POPULATED

	--Returns 1 or 0
	--1 = Yes, the item is in Stock
	--0 = no, the item is not in stock

    SELECT @rentals = COUNT(*)
    FROM rental
    WHERE inventory_id = @inventory_id;

    IF @rentals = 0
        RETURN 1;    --If rentals table doesn't have the item, we know it's instock, return true.

    SELECT @out = COUNT(*)
    FROM inventory as i
    LEFT JOIN rental as r ON r.inventory_id = i.inventory_id
    WHERE i.inventory_id = @inventory_id
    AND r.return_date IS NULL;

    RETURN CASE WHEN @out > 0 THEN 0  --If rental table has item with no return date, it's out.
                ELSE 1
           END
END
GO



--Test the funciton
SELECT dbo.inventory_in_stock(1);
--Returns 1, the item is in stock.
SELECT dbo.inventory_in_stock(2);
--Returns 1, the item is in stock.
SELECT dbo.inventory_in_stock(2047);
--Returns 0, the item is checked out.