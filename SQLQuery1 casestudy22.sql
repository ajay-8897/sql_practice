create database EMPLOYEES

use EMPLOYEES


Create table Location ( 
location_id int primary key,
city varchar(50)
);

insert into location ( location_id, city)
values
(122, 'Newyork'),
(123, 'dallas'),
(124, 'chicago'),
(167, 'Boston');


create table department (
department_id int primary key,
name varchar(50),
location_id int, foreign key (location_id) references location (location_id)
);

insert into department ( department_id, name, location_id)
values
(10, 'accounting', 122),
(20, 'sales', 124),
(30, 'research', 123),
(40,'operations',167);


create table Job (
job_id int primary key,
designation varchar(30)
);

insert into job (job_id, designation)
values
(667, 'clerk'),
(668, 'staff'),
(669, 'analyst'),
(670, 'sales person'),
(671, 'manager'),
(672, 'president');


create table employee (
Employee_id int,
last_name varchar(15),
first_name varchar(20),
middle_name varchar(5),
job_id int,
foreign key (job_id) references job(job_id),
hiredate date,
salary int,
comm int,
department_id int,
foreign key (department_id) references department(department_id)
);

insert into employee (Employee_id, last_name, first_name, middle_name, job_id,hiredate, salary,comm, department_id)
values
(7369, 'smith', 'jhon', 'Q', 667, '17-Dec-84',800, null, 20),
(7499, 'allen', 'kevin', 'J', 670, '20-feb-85',1600, 300,30),
(755, 'doyle', 'jean', 'K', 671, '04-apr-85', 2850, null, 30),
(756,'dennis', 'lynn', 'S',671, '15-may-85', 2750, null,30),
(757, 'baker', 'leslie', 'D', 671, '10-jun-85', 2250, null, 40),
(7521, 'wark', 'cynthia', 'D', 670, ' 22-feb-85', 1250, 50, 30);


select * from location
select * from department
select * from job
select * from employee



-- Simple quries :-

/* Q-1 ->  List all the employee details. */

select * from employee;

/* Q-2 ->  List all the department details.*/

SELECT * FROM DEPARTMENT;

/* Q -3 -> List all job details.  */

select * from job;

/*Q-4 -> List all the locations. */

SELECT * FROM LOCATION;

/*Q-5 -> List out the First Name, Last Name, Salary, Commission for all Employees. */

SELECT FIRST_NAME, LAST_NAME, SALARY, COMM FROM EMPLOYEE;

/* Q-6 -> List out the Employee ID, Last Name, Department ID for all employees and 
alias 
Employee ID as "ID of the Employee", Last Name as "Name of the 
Employee", Department ID as "Dep_id".  */

select employee_id as 'ID of the employee',
last_name as 'name of the employee',
department_id as 'dep_id'
from employee;

/* Q-7 ->  List out the annual salary of the employees with their names only.  */

SELECT FIRST_NAME+ ' ' +LAST_NAME as names, SALARY * 12 AS ANNUAL_SALARY
FROM EMPLOYEE;

-- WHERE CONDITION :-

/* Q-1 -> List the details about "Smith".  */

select * from employee where last_name = 'smith';

/* Q-2 ->  List out the employees who are working in department 20. */

SELECT * from employee where department_id = 20;

/* Q-3 ->  List out the employees who are earning salary between 2000 and 3000. */

select * from employee
where salary between 2000 and 3000;

/* Q-4 -> List out the employees who are working in department 10 or 20. */

select * from employee
where department_id in (10, 20);

/*Q-5 ->  Find out the employees who are not working in department 10 or 30.  */

select * from employee
where department_id not in (10,30);

/*Q-6 ->  List out the employees whose name starts with 'L'. */

SELECT * FROM EMPLOYEE
where first_name like 'l%';

/* Q-7 -> List out the employees whose name starts with 'L' and ends with 'E'.  */

select * from employee
where first_name like 'l%e';

/*Q-8 -> List out the employees whose name length is 4 and start with 'J'  */

SELECT * FROM employee
where first_name like 'j%' and len(first_name) = 4;

/*Q-9 -> List out the employees who are working in department 30 and draw the 
salaries more than 2500. */

select * from employee
where department_id = 30 and salary > 2500;

/*Q-10 ->  List out the employees who are not receiving commission. */

select * from employee
where comm is null;

-- ORDER BY CLAUSE :-

/*Q-1 -> List out the Employee ID and Last Name in ascending order based on the 
Employee ID.   */

SELECT employee_id, last_name from employee
order by employee_id asc;

/*Q-2 -> List out the Employee ID and Name in descending order based on salary. */

SELECT employee_id, first_name+ ' ' +last_name as name , salary from employee
order by salary desc;

/* Q-3 ->  List out the employee details according to their Last Name in ascending-order.*/

select * from employee
order by last_name desc;

/*Q-4 ->  List out the employee details according to their Last Name in ascending 
order and then Department ID in descending order. */

SELECT * FROM EMPLOYEE
ORDER BY last_name asc, department_id desc;


--GROUP BY AND HAVEING CLAUSE-:

/*Q-1 -> List out the department wise maximum salary, minimum salary and 
average salary of the employees. */

select department_id, 
max(salary) as max_salary,
min(salary) as min_salary,
avg(salary) as avg_salary from employee
group by department_id;

/*Q-2 -> List out the job wise maximum salary, minimum salary and average 
salary of the employees.*/

select job_id,
max(salary) as max_salary,
min(salary) as min_salary,
avg(salary) as avg_salary
from employee
group by job_id;

/*Q-3 -> List out the number of employees who joined each month in ascending order.   */

SELECT MONTH(hiredate) AS joining_month,
COUNT(*) AS employee_count
FROM employee
GROUP BY MONTH(hiredate)
ORDER BY MONTH(hiredate) ASC;

/*Q-4 -> List out the number of employees for each month and year in 
ascending order based on the year and month. */

SELECT year(hiredate) as joining_year,
month(hiredate) as joining_month,
count(*) as employee_count
from employee
group by  year(hiredate),
month(hiredate)
order by year(hiredate),
month(hiredate);

/*Q-5 ->  List out the Department ID having at least four employees */

select department_id from employee
group by department_id
having count(*) > 4;

/* Q-6 -> How many employees joined in February month.   */

SELECT  MONTH(hiredate) as month , count(*) as feb_month_hire
from employee
group by month(hiredate)
having month(hiredate) = 2;

/*Q-7 ->   How many employees joined in May or June month */

select month(hiredate) as may_june_month, count(*) as may_june_joined
from employee
group by month(hiredate)
having month(hiredate) in (5, 6);

/*Q-8 ->  How many employees joined in 1985 */

select year(hiredate) as joining_year, count(*) as employee_joined
from employee
group by year(hiredate)
having year(hiredate) = 1985;

/*Q-9 ->  How many employees joined each month in 1985  */

SELECT month(hiredate) as monthly_hires,
count(*) as no_of_employee
from employee
where
year(hiredate) = 1985
group by month(hiredate)
order by month(hiredate) asc;

/*Q-10 ->    How many employees were joined in April 1985? */

select month(hiredate) as month_hire,
count(*) as emp_joined
from employee
where year(hiredate) = 1985 and month(hiredate) = 4
group by month(hiredate);

/*Q-11 ->  Which is the Department ID having greater than or equal to 3 employees 
joining in April 1985? */

SELECT department_id,
COUNT(*) AS april_joins
FROM employee
WHERE YEAR(hiredate) = 1985 
AND MONTH(hiredate) = 4
GROUP BY department_id
HAVING COUNT(*) >= 3;

--JOINS:-

/* Q-1 ->  List out employees with their department names.   */

SELECT e.employee_id, e.first_name+ ' ' +e.last_name as employee_name, d.name 
from employee as e
join department as d on e.department_id = d.department_id;

/* Q-2 -> Display employees with their designations. */

SELECT E.employee_id, e.first_name+ ' ' +last_name as employee_name,
j.designation from employee as e
join job as j on e.job_id = j.job_id;


/*Q-3 ->   Display the employees with their department names and city.  */

select e.employee_id, e.first_name+ ' ' +e.last_name as employee_name, d.name,
l.city from employee as e
 join department as d on e.department_id = d.department_id
 join location as l on d.location_id = l.location_id;


/*Q-4 ->  How many employees are working in different departments? Display with 
department names.  */

SELECT d.name as department_name,COUNT(e.employee_id) AS employee_count
FROM  department as d
left JOIN employee as e on d.department_id = e.department_id
GROUP BY d.name
ORDER BY employee_count desc;

/*Q-5 ->  How many employees are working in the sales department? */

select d.name,
count(e.employee_id) as employee_count
from employee as e
left join department as d on e.department_id = d.department_id
where d.name like'%sales%'
group by d.name;

/*Q-6 -> Which is the department having greater than or equal to 3 
employees and display the department names in 
ascending order.  */

SELECT d.name, count(e.employee_id) as count_emp
from employee as e
join department as d on e.department_id = d.department_id
group by d.name
having count(e.employee_id) >= 3
order by d.name asc;


/*Q-7 ->  How many employees are working in 'Dallas'? */

SELECT l.city, count(e.employee_id) as employee_count
from employee as e
join department as d on e.department_id = d.department_id
join location as l on d.location_id = l.location_id
group by l.city
having  l.city ='dallas';



/*Q-8 -> Display all employees in sales or operation departments.  */

select e.employee_id,d.name, e.first_name+ ' ' +last_name as full_name
 from employee as e
left join department as d on e.department_id = d.department_id
where d.name in ('sales','operations')
;

-- CONDITIONAL STATEMENT ->

/*Q-1 -> Display the employee details with salary grades. Use conditional statement to 
create a grade column  */

select employee_id, first_name+ ' ' +last_name AS FULL_NAME,
salary,
case
when salary >= 2500 then 'A'
when salary >= 1500 then 'B'
when salary >= 500 then 'C'
else 'D'
end as salary_grade
from employee;

/*Q-2 ->  List out the number of employees grade wise. Use conditional statement to 
create a grade column. */

select 
case
when salary >= 2500 then 'A'
when salary >= 1500 then 'B'
when salary >= 500 then 'C'
else 'D'
end as salary_grade,
COUNT(*) AS EMPLOYEE_COUNT
from employee
GROUP BY
case
when salary >= 2500 then 'A'
when salary >= 1500 then 'B'
when salary >= 500 then 'C'
else 'D'
end 
order by salary_grade;
 

 /*Q-3 ->  Display the employee salary grades and the number of employees between 
2000 to 5000 range of salary. */

SELECT 
case
when salary >= 2500 then 'A'
when salary >= 1500 then 'B'
when salary >= 500 then 'C'
else 'D'
end as salary_grade,
count(*) as no_f_emp
from employee
where salary between 2000 and 3000
group by case
when salary >= 2500 then 'A'
when salary >= 1500 then 'B'
when salary >= 500 then 'C'
else 'D'
end
order by salary_grade;

-- SUBQUERY --

/* Q-1 ->   Display the employees list who got the maximum salary */

SELECT employee_id, first_name+ ' ' +last_name as full_name, salary 
from employee
where salary = (select max(salary) as max_salary from employee);

 /* Q-2 ->  Display the employees who are working in the sales department. */

 select employee_id, department_id, first_name+ ' ' +last_name as full_name 
 from employee
 where department_id = ( select department_id from department where name = 'sales');

 /*Q-3 ->   Display the employees who are working as 'Clerk' */

 select job_id, employee_id, first_name+ ' ' +last_name as full_name 
 from employee
 where job_id = (select job_id from job where designation = 'clerk');

 /*Q->4 ->  Display the list of employees who are living in 'Boston'.*/

 select department_id, employee_id, first_name+ ' ' +last_name as full_name 
 from employee
 where department_id = (select department_id from department 
 where location_id =  (select location_id from location where city = 'boston'));

 /*Q->5 ->  Find out the number of employees working in the sales department  */

 select department_id, count(employee_id) as employee_count 
 from employee where department_id =(select department_id from department where name = 'sales')
 group by department_id;

 /*Q-> 6 Update the salaries of employees who are working as clerks on the basis of 
10%.   */

UPDATE EMPLOYEE
set salary = salary * 1.10
where job_id = ( select job_id from job where designation = 'clerk');

select * from employee;

/*Q-> 7  Display the second highest salary drawing employee details.  */

SELECT EMPLOYEE_ID,first_name+ ' ' +last_name as full_name, salary from employee
where salary = ( select max(salary) from employee 
where salary < (select max(salary) from employee)); 

/*Q-> 8  List out the employees who earn more than every employee in department 30.  */

select employee_id, department_id, first_name+ ' ' +last_name as full_name, salary
from employee 
where salary >  ( select max(salary) from employee where department_id = 30);

/* Q->9  Find out which department has no employees.*/

SELECT 
department_id, 
name AS department_name
FROM department
WHERE department_id NOT IN (SELECT DISTINCT department_id 
FROM employee WHERE department_id IS NOT NULL
);

/* Q-> 10  Find out the employees who earn greater than the average salary for 
their department. */

SELECT 
employee_id,first_name + ' ' + last_name AS full_name, salary,department_id
FROM employee E
WHERE salary > (SELECT AVG(salary) FROM employee WHERE department_id = e.department_id);