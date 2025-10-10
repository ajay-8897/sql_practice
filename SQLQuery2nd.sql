SELECT * FROM Jomato;

use jomato;

/* Q-1 -> Create a user-defined functions to stuff the Chicken into ‘Quick Bites’. Eg: ‘Quick
 Chicken Bites’ */


CREATE FUNCTION dbo.StuffChicken (@input NVARCHAR(100))
RETURNS NVARCHAR(100)
AS
BEGIN
 DECLARE @output NVARCHAR(100);  
 DECLARE @spacePos INT;         
 SET @spacePos = CHARINDEX(' ', @input);
 IF @spacePos > 0
 SET @output = STUFF(@input, @spacePos + 1, 0, 'Chicken ');
 ELSE
 SET @output = @input;  
 RETURN @output;
END;

SELECT dbo.StuffChicken('Quick Bites') as stuffchicken;

/* Q-2 ->  Use the function to display the restaurant name and cuisine type which has the
 maximum number of rating.  */

    SELECT 
    dbo.StuffChicken(RestaurantName) AS StuffedRestaurantName,
    CuisinesType,
    no_of_rating
FROM 
    jomato
WHERE 
    no_of_rating = (
        SELECT MAX(no_of_rating) FROM jomato
    );


/* Q-3 ->  Create a Rating Status column to display the rating as ‘Excellent’ if it has more the 4
 start rating, ‘Good’ if it has above 3.5 and below 5 star rating, ‘Average’ if it is above 3
 and below 3.5 and ‘Bad’ if it is below 3 star rating. */



 select rating,
 case
 when rating > 4 then 'Excellent'
 when rating > 3.5 or rating < 5 then 'Good'
 when rating > 3 or rating < 3.5 then 'Average'
 when rating < 3 then 'Bad'
 end as rating_status
 from jomato;

 /* Q-4 ->  Find the Ceil, floor and absolute values of the rating column and display the current date
 and separately display the year, month_name and day. */

 SELECT RATING,
CEILING(Rating) AS CeilRating,
FLOOR(Rating) AS FloorRating,
ABS(Rating) AS AbsoluteRating,

GETDATE() AS CurrentDate,
YEAR(GETDATE()) AS Year,
DATENAME(MONTH, GETDATE()) AS MonthName,
DAY(GETDATE()) AS Day
FROM 
    jomato;


    /* Q-5  Display the restaurant type and total average cost using rollup */
    
    SELECT RESTAURANTTYPE, SUM(AVERAGECOST) AS TOTAL_AVERAGE_COST
    FROM JOMATO
    GROUP BY ROLLUP (RESTAURANTTYPE);

