create database administrator;

use administrator;

create table fact_table (
Date date,
Productid int,
profit decimal(10,2),
sales decimal(10,2),
margin decimal(10,2),
COGS decimal(10,2), -- COGS stands for cost of good sold
total_expenses decimal(10,2),
Marketing decimal(10,2),
inventory int,
Budget_profit decimal(10,2),
Budget_COGS decimal(10,2),
budget_Margin decimal(10,2),
Budget_Sales decimal(10,2),
Area_coded int
);

alter table fact_table
add constraint fk_productid  FOREIGN KEY (Productid) REFERENCES Product_Table(Productid);

alter table fact_table
add constraint fk_area_code  FOREIGN KEY (Area_coded) REFERENCES location_table(area_code);


create table product_table (
Product_type varchar(70),
Product varchar(100),
productid int primary key,
Type varchar(50)
);


create table location_table (
Area_Code int primary key,
State varchar(50),
Market varchar(40),
Market_size varchar(50)
);

select * from fact_table;
select * from product_table;
select * from location_table;

INSERT INTO Fact_Table (Date, ProductID, Profit, Sales, Margin, COGS, Total_Expenses, Marketing, Inventory, Budget_Profit, Budget_COGS, Budget_Margin, Budget_Sales, Area_Coded) VALUES
('2010-01-01', 1, 120.50, 500.00, 25.00, 300.00, 50.00, 20.00, 100, 150.00, 280.00, 30.00, 520.00, 719),
('2010-01-02', 2, 80.00, 400.00, 20.00, 250.00, 45.00, 15.00, 90, 130.00, 240.00, 25.00, 450.00, 101),
('2010-01-03', 3, 60.00, 300.00, 18.00, 200.00, 42.00, 10.00, 85, 120.00, 190.00, 22.00, 320.00, 202),
('2010-01-04', 4, 90.00, 350.00, 22.00, 220.00, 48.00, 12.00, 95, 140.00, 210.00, 28.00, 370.00, 303),
('2010-01-05', 5, 110.00, 450.00, 24.00, 280.00, 55.00, 18.00, 105, 160.00, 260.00, 32.00, 480.00, 404),
('2010-01-06', 6, 70.00, 320.00, 19.00, 210.00, 40.00, 14.00, 88, 125.00, 200.00, 23.00, 340.00, 505),
('2010-01-07', 7, 95.00, 370.00, 21.00, 230.00, 47.00, 16.00, 92, 135.00, 220.00, 26.00, 390.00, 606),
('2010-01-08', 8, 85.00, 340.00, 20.00, 215.00, 43.00, 13.00, 89, 128.00, 205.00, 24.00, 360.00, 707),
('2010-01-09', 9, 100.00, 420.00, 23.00, 270.00, 52.00, 17.00, 98, 155.00, 250.00, 31.00, 440.00, 808),
('2010-01-10', 10, 75.00, 310.00, 18.50, 205.00, 41.00, 11.00, 87, 122.00, 195.00, 21.00, 330.00, 909),
('2010-01-11', 11, 65.00, 280.00, 17.00, 180.00, 39.00, 9.00, 80, 110.00, 170.00, 20.00, 300.00, 719),
('2010-01-12', 12, 55.00, 260.00, 16.00, 170.00, 38.00, 8.00, 78, 105.00, 160.00, 19.00, 280.00, 101),
('2010-01-13', 13, 85.00, 390.00, 22.00, 240.00, 50.00, 15.00, 96, 145.00, 230.00, 29.00, 410.00, 202),
('2010-01-14', 1, 130.00, 520.00, 26.00, 310.00, 53.00, 21.00, 102, 160.00, 290.00, 33.00, 540.00, 303),
('2010-01-15', 2, 85.00, 410.00, 21.00, 260.00, 46.00, 16.00, 91, 135.00, 250.00, 26.00, 460.00, 404),
('2010-01-16', 3, 65.00, 310.00, 19.00, 210.00, 43.00, 11.00, 86, 125.00, 200.00, 23.00, 330.00, 505),
('2010-01-17', 4, 95.00, 360.00, 23.00, 230.00, 49.00, 13.00, 97, 145.00, 220.00, 29.00, 380.00, 606),
('2010-01-18', 5, 115.00, 460.00, 25.00, 290.00, 56.00, 19.00, 106, 165.00, 270.00, 33.00, 490.00, 707),
('2010-01-19', 6, 75.00, 330.00, 20.00, 220.00, 42.00, 15.00, 90, 130.00, 210.00, 24.00, 350.00, 808),
('2010-01-20', 7, 105.00, 380.00, 22.00, 240.00, 48.00, 17.00, 93, 140.00, 230.00, 27.00, 400.00, 909);


INSERT INTO Product_Table (Product_Type, Product, ProductID, Type) VALUES
('Coffee', 'Arabica Blend', 1, 'Regular'),
('Coffee', 'Robusta Roast', 2, 'Regular'),
('Tea', 'Green Tea', 3, 'Premium'),
('Tea', 'Black Tea', 4, 'Regular'),
('Juice', 'Orange Juice', 5, 'Regular'),
('Juice', 'Apple Juice', 6, 'Premium'),
('Water', 'Mineral Water', 7, 'Regular'),
('Water', 'Sparkling Water', 8, 'Premium'),
('Snack', 'Potato Chips', 9, 'Regular'),
('Snack', 'Chocolate Cookies', 10, 'Premium'),
('Dairy', 'Whole Milk', 11, 'Regular'),
('Dairy', 'Greek Yogurt', 12, 'Premium'),
('Dairy', 'Cheddar Cheese', 13, 'Premium');



INSERT INTO Location_Table (Area_Code, State, Market, Market_Size) VALUES
(719, 'Colorado', 'West', 'Medium'),
(101, 'Texas', 'South', 'Large'),
(202, 'California', 'West', 'Large'),
(303, 'New York', 'East', 'Large'),
(404, 'Florida', 'South', 'Medium'),
(505, 'Nevada', 'West', 'Small'),
(606, 'Illinois', 'Midwest', 'Large'),
(707, 'Georgia', 'South', 'Medium'),
(808, 'Washington', 'West', 'Medium'),
(909, 'Arizona', 'West', 'Small');

ALTER TABLE product_Table
ADD CONSTRAINT unique_productid UNIQUE (Productid);

/* Q-1 -> Display the number of states present in theLocationTable. */

SELECT State, COUNT(State) AS count
FROM location_table
GROUP BY State;

/* Q-2 -> How many products are of regular type */

SELECT COUNT(*) AS Regular_Product_Count
FROM Product_Table
WHERE Type = 'Regular';

/* Q-3 -> How much spending has been done on marketing of product ID 1 */

SELECT SUM(Marketing) AS Total_Marketing_Spend
FROM Fact_Table
WHERE ProductID = 1;

/* Q-4 -> What is the minimum sales of a product? */

select min(sales) as minimum_sale
from fact_table;

/* Q-5 -> Display the max Cost of Good Sold (COGS). */

select max(cogs) as maximum_cogs from fact_table;

/* Q-6 -> Display the details of the product where product type is coffee. */

select * from product_table where product_type = 'coffee';

/* Q-7 ->  Display the details where total expenses are greater than 40. */

select * from fact_table where total_expenses > 40;

/* Q-8 ->  What is the average sales in area code 719?*/

select avg(sales) as avg_sales from fact_table
where area_coded = 719;

/* Q-9 -> Find out the total profit generated by Colorado state.  */

select l.state, sum(f.profit) as total_profit
from fact_table as f 
join location_table as l on f.area_coded = l.area_code
where l.state = 'Colorado'
group by l.state;

/*Q-10 -> Display the average inventory for each product ID.*/

select productid, avg(inventory) as average_inventory
from fact_table 
group by productid;

--Q-11 -> Display state in a sequential order in a Location_Table.

select state from location_table 
order by state ASC;

/*Q-12 -> Display the average budget of the Product where the average budget
margin should be greater than 100.*/

select productid, avg(budget_profit) as avg_budget_profit,
avg(budget_cogs) as avg_budget_profit,
avg(budget_margin) as avg_budget_profit,
avg(budget_sales) as avg_budget_sales from fact_table
group by productid
having avg(budget_margin) > 100;

-- Q-13 -> What is the total sales done on date 2010-01-01?

select sum(sales) as total_sales from fact_table
where date =  '2010-01-01';

-- Q-14 -> Display the average total expense of each product ID on an individual date?

select date, productid, avg(total_expenses) as avg_total_expense
from fact_table
group by date, productid
order by date, productid;


 /* Q-15 -> Display the table with the following attributes such as date, productID,
 product_type, product, sales, profit, state, area_code. */

 select f.date,f.productid,p.product_type,p.product,f.sales, f.profit, l.state, l.area_code 
 from fact_table as f
 join product_table as p on f.productid = p.productid
 join location_table as l on f.area_coded = l.area_code
 order by f.date, f.productid;

 /*Q-16 ->  Display the rank without any gap to show the sales wiserank.*/

SELECT Date,ProductID,Sales,
DENSE_RANK() OVER (ORDER BY Sales DESC) AS Sales_Rank
FROM Fact_Table;

/*Q-17 ->  Find the state wise profit and sales.*/

select l.state,
sum(f.profit) as total_profit,
sum(f.sales) as total_sales from fact_table as f
join location_table as l on f.area_coded = l.area_code
group by l.state
order by l.state;

/*Q-18 -> Find the state wise profit and sales along with the productname.*/

select l.state, p.productid,
sum(f.profit) as total_profit,
sum(f.sales) as total_sales
from fact_table as f
join product_table as p on f.productid = p.productid
join location_table as l on f.area_coded = l.area_code
group by l.state, p.productid
order by l.state, p.productid;

/* Q-19 -> If there is an increase in sales of 5%, calculate the increasedsales. */

select sales, round(sales * 1.05,2) as increasedsales
from fact_table

/* Q-20 -> Find the maximum profit along with the product ID and producttype? */

select f.profit,f.productid,p.product_type
from fact_table as f
join product_table as p on f.productid = p.productid
where f.profit = (select max(profit) from fact_table);

/* Q-21 -> Create a stored procedure to fetch the result according to the product type
 from ProductTable. */

CREATE PROCEDURE getproductbytype  
    @producttype VARCHAR(70)
AS
BEGIN
SELECT  productid, product_type,  product,  type FROM 
product_table  WHERE  product_type = @producttype;
END;

EXEC getproductbytype @producttype = 'Coffee';

/* Q-22 ->  Write a query by creating a condition in which if the total expenses isless than
 60 then it is a profit or else loss.*/

 select productid, total_expenses,
 case when total_expenses < 60 then 'profit'
 else 'loss' end as expense_status  
 from fact_table;

 /* Q-23 -> Give the total weekly sales value with the date and product IDdetails. Use
 roll-up to pull the data in hierarchical order */

 select datepart(week, date) as week_number,
 date,
 productid,
 sum(sales) as total_weekly_sales
 from fact_table
 group by rollup (datepart(week, date), date, productid)
 order by datepart (week, date), date, productid;

 /* Q-24 ->  Apply union and intersection operator on the tables which consist of
 attribute area code ?*/

 SELECT Area_Code FROM Location_Table
union
SELECT Area_Coded FROM Fact_Table;

SELECT Area_Code FROM Location_Table
intersect
SELECT Area_Coded FROM Fact_Table;

/* Q-25 -> Create a user-defined function for the product table to fetch aparticular
 product type based upon the user’s preference.  */

 create function 
 dbo.getproductsbytype
 (  @producttype varchar(70)
 )
 returns table
 as
 return
 (select productid, product_type,product, type from product_table
 where product_type = @producttype
 );

SELECT * FROM dbo.GetProductsByType('Coffee');

/* Q-26 ->  Change the product type from coffee to tea where product ID is 1  and undo
 it. */

BEGIN TRANSACTION;
UPDATE Product_Table
SET Product_Type = 'Tea'
WHERE ProductID = 1;

ROLLBACK;


SELECT ProductID, Product_Type FROM Product_Table WHERE ProductID = 1;

/* Q-27 -> Display the date, product ID and sales where total expensesare
 between 100 to 200. */

 select date, productid, sales from fact_table 
 where total_expenses between 100 and 200;

 /* Q-28 -> Delete the records in the Product Table for regulartype. */

ALTER TABLE Fact_Table NOCHECK CONSTRAINT fk_productid;

DELETE FROM Product_Table WHERE Type = 'Regular';

ALTER TABLE Fact_Table CHECK CONSTRAINT fk_productid;

/*Q-29 -> Display the ASCII value of the fifth character from the columnProduct */

SELECT  ProductID, Product,
ASCII(SUBSTRING(Product, 5, 1)) AS FifthChar_ASCII
FROM 
Product_Table;

