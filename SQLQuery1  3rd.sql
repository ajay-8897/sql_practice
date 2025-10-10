CREATE DATABASE ZOMATO;


USE ZOMATO;


SELECT * FROM JOMATO;

/* Q-1 -> Create a stored procedure to display the restaurant name, type and cuisine where the
 table booking is not zero.  */

 create procedure getrestauranttablebooking
 as
 begin
 select restaurantname, restauranttype, cuisinestype
 from jomato where tablebooking > 0;
 end;

 exec getrestauranttablebooking;

 /* Q-2 -> Create a transaction and update the cuisine type ‘Cafe’ to ‘Cafeteria’. Check the result
 and rollback it */

 begin transaction

 update jomato
 set cuisinestype = 'cafeteria'
 where cuisinestype = 'cafe';

 select cuisinestype from jomato
 where cuisinestype = 'cafeteria';


 rollback;

 /* Q-3 -> Generate a row number column and find the top 5 areas with the highest rating of
 restaurants. */

WITH RankedAreas AS (
SELECT Area,Rating,
ROW_NUMBER() OVER (ORDER BY Rating DESC) AS RowNum
FROM jomato
)
SELECT RowNum, Area, Rating
FROM RankedAreas
WHERE RowNum <= 5;

/* Q-4 -> Use the while loop to display the 1 to 50  */

DECLARE @Counter INT = 1;
WHILE @Counter <= 50
BEGIN
PRINT @Counter;
SET @Counter = @Counter + 1;
END;

/* Q-5 -> Write a query to Create a Top rating view to store the generated top 5 highest rating of
 restaurants. */

 CREATE VIEW TOPRATEDRESTAURANTS AS 
 SELECT TOP 5 restaurantname, rating from jomato
 order by rating desc;

 select * from topratedrestaurants;

 /*Q-6 -> Create a trigger that give an message whenever a new record is inserted.  */

 create trigger trg_givemessagenewrecord
on jomato
after insert
as 
begin
print ' new restaurant record is inserted';
end;
