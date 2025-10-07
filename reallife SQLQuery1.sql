-- create database named dataset?
Create database dataset;

use dataset;

select * from salesman;

--create tables salesman, customers and  orders and insert values in tables?

Create table salesman (
salesmanid int,
Name varchar(255),
commission decimal(10,2),
city varchar(255),
age int
);

insert into salesman ( salesmanid, Name, commission, city, age)
values
(101,'Joe',50,'California',17),
(102, 'Simon', 75, 'Texas', 25),
(103, 'Jessie', 105, 'Florida',35),
(104, 'Danny', 100, 'Texas', 22),
(105,'Lia', 65,'New Jersey', 30);

select * from customer;

create table customer (
salesmanid int,
customerid int,
customerName varchar(255),
purchaseAmount int,
);

insert into customer (salesmanid, customerid, customerName, purchaseAmount)
values
(101, 2345,'Andrew', 550),
(103, 1575, 'Lucky', 4500),
(104, 2345, 'Andrew', 4000),
(107, 3747,'Remona', 2700),
(110, 4004, 'Julia', 4545);

Create Table Orders (
orderid int,
Coustomerid int,
Salesmanid int,
Orderdate date,
Amount money
);

Insert into orders
VALUES
(5001,2345,101,'2021-07-01', 550),
(5003, 1234, 105, '2022-02-15',1500);

select * from orders;

-- Q1 =  Insert a new record in your Orders table"

insert into orders (orderid, Coustomerid, Salesmanid, Orderdate, Amount)
values
(5005, 3737, 107, '2023-01-22', 1200);

/* Q2 =  Add Primary key constraint for SalesmanId column in Salesman table. Add default 
constraint for City column in Salesman table. Add Foreign key constraint for SalesmanId 
column in Customer table. Add not null constraint in Customer_name column for the 
Customer table. */

alter table salesman
alter column salesmanid int  Not Null;


Alter table salesman
add constraint pk_salesmanid primary key (salesmanid);

ALTER TABLE Salesman
DROP CONSTRAINT DF_city;


alter table salesman
add constraint df_city default 'unknown' for city;


update customer 
set salesmanid = 101
where salesmanid = 105 and customerName = 'Andrew' ;

update customer
set salesmanid = 102
where salesmanid = 110;

ALTER TABLE Customer
ADD CONSTRAINT fk_salesmanid FOREIGN KEY (SalesmanId)
REFERENCES Salesman (SalesmanId);

alter table customer
alter column customername varchar(255) not null;

/* Q3 = Fetch the data where the Customer’s name is ending with ‘N’ also get the purchase 
amount value greater than 500. */

select customername from customer 
where customername like '%n' 
and purchaseAmount > 500;

/* Q4 = Using SET operators, retrieve the first result with unique SalesmanId values from two 
tables, and the other result containing SalesmanId with duplicates from two tables.*/

select salesmanid from salesman
union
select salesmanid from customer;

select salesmanid from salesman
union all
select salesmanid from customer;

select * from salesman;
select * from customer;
select * from orders;

/* Q5= Display the below columns which has the matching data. 
Orderdate, Salesman Name, Customer Name, Commission, and City which has the 
range of Purchase Amount between 500 to 1500. */

select 
o.orderdate,
s.name,
c.customername,
s.commission,
s.city from 
orders as o
join salesman as s on o.salesmanid = s.salesmanid
join customer as c on o.Coustomerid = c.customerid
where c.purchaseamount between 500 and 1500;
 
 /* Q6 = Using right join fetch all the results from Salesman and Orders table.*/

 select 
 s.salesmanid, s.name, s.commission, s.city, s.age,
 o.orderid,o.Coustomerid, o.salesmanid, o.orderdate, o.amount
 from salesman as s
 right join orders as o on s.salesmanid = o.salesmanid;

