use classicmodels;

/* Explore the tables and columns */

select *
from products;

select * 
from customers;

select * 
from employees;

select * 
from offices;

select * 
from orderdetails;

select *
from orders;

select *
from payments;

select *
from productlines;



/**********
  Basics Exercises
**********/

#1) Write down sql query to show different countries from customers table
select distinct country
from customers;

#2) write a query to show number of cities in customers table
select distinct count(city)
from customers;

select distinct city
from customers;

#3) How many of my customers are from London in customers table? - 2
select *
from customers 
where city = 'london';

select count(customerNumber)
from customers 
where city = 'london';

#4)How many of customers from UK but not from London? - 3
select *
from customers 
where country = 'uk' and not city = 'london';

select count(customerNumber)
from customers 
where country = 'uk' and not city = 'london';

#5)Write SQL query to show number of Sales Rep in employees table
select count(employeenumber)
from employees;

select employeenumber, concat(firstname,' ', lastname) as EmployeeName
from employees;

#6) What is the address line2 for the office in San Francisco in offices table? - suite 300
select addressLine2
from offices
where city = 'San Francisco';

#7) What is the largest quantity ordered in orderdetails table? -97
select *
from orderdetails
order by quantityOrdered desc
limit 1;

#8) Whats the highest amount paid on '2003-09-28' in payments table?
select amount, paymentdate
from payments
where paymentDate = '2003-09-28'
order by amount desc
limit 1;

#9) Which products are avaliable more than 5000 in stock and also has buyprice lower than 25?
select * 
from products
where quantityinstock > 5000 and buyPrice < 25;

select productName, quantityInStock, buyPrice
from products
where quantityinstock > 5000 and buyPrice < 25;

#10) select customers who do not have a credit limit (0.00). 
select * 
from customers
where creditLimit = 0.00;

select customerName, creditLimit
from customers
where creditLimit = 0.00;

#11)  Ask your own question and write a query to answer. Share and discuss with your friends. How many products have a product line of 'motorcycles'?
select * 
from products
where productLine = 'motorcycles';

select count(productLine)
from products
where productLine = 'motorcycles';

#12) Ask your own question and write a query to answer. Share and discuss with your friends. show what products are low in stock < 500

select * 
from products
where quantityInStock < 500;

#13) Ask your own question and write a query to answer. Share and discuss with your friends. show orders where ship date was after the customers required date.
select * 
from orders
where shippedDate > requiredDate;

/********** 
Joins and group by Exercises 
**********/

/* 1- Find office information of each employee with their first, lastname, addressLine1, state and their city */
select concat(e.firstname,' ', e.lastname) as EmployeeName, off.officeCode, off.addressline1, off.state, off.city
from employees as e
inner join offices as off
on e.officeCode = off.officeCode;


/* 2- How many orders have been placed by Herkku Gifts? */
select * 
from orders as o
inner join customers as c
on o.customerNumber = c.customerNumber
where customerName = 'herkku gifts';

 select count(orderNumber)
from orders as o
inner join customers as c
on o.customerNumber = c.customerNumber
where customerName = 'herkku gifts';

/* 3- Write sql query to find total payments for Atelier graphique */
select c.customerName, c.customerNumber, sum(p.amount) as totalpayment
from payments as p
inner join customers as c
on p.customerNumber = c.customerNumber
group by customerName, customerNumber
having customerName = 'atelier graphique';

/* 4- Write sql query find the total payments by date- not sure if this is correct  */
select c.customerName, c.customerNumber, p.paymentDate, sum(p.amount) as totalpayment
from payments as p
inner join customers as c
on p.customerNumber = c.customerNumber
group by customerName, customerNumber, paymentDate
order by paymentDate;

select c.customerName, c.customerNumber, p.paymentDate, p.amount as totalpayment
from payments as p
inner join customers as c
on p.customerNumber = c.customerNumber
group by customerName, customerNumber, paymentDate
order by paymentDate;

/* 5- Write a query to find the amount paid by each customer. */
select c.customerName, c.customerNumber, sum(p.amount) as totalpayment
from payments as p
inner join customers as c
on p.customerNumber = c.customerNumber
group by customerName, customerNumber;

/* 6- Write sql to find top 10 customers the highest total amount paid */
select c.customerName, c.customerNumber, sum(p.amount) as totalpayment
from payments as p
inner join customers as c
on p.customerNumber = c.customerNumber
group by customerName, customerNumber
order by totalpayment desc
limit 10;

/* 7- Write a query to find the account representative for each customer.*/
select e.employeeNumber, concat(e.firstname,' ', e.lastname) as EmployeeName, c.customerNumber, customerName
from employees as e
inner join customers as c
on e.employeeNumber = c.salesRepEmployeeNumber;

/* 8- Write sql query to find the employees who live in Boston */
select e.employeeNumber, concat(e.firstName,' ', e.lastname) as employeename, city
from employees as e 
inner join offices as off
on e.officeCode = off.officeCode
where city = 'boston';

