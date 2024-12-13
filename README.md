# 🛠️ SQL Exploration with Classic Models! 🎉  

---

## 🎯 **Project Goal**  
To flex my SQL muscles 💪 by exploring, querying, and analysing the Classic Models database! This journey includes digging through tables, uncovering insights, and answering intriguing questions with SQL.  

---

## 🗂️ **Dataset Overview**  
The Classic Models database contains a wealth of information about:  
- 🛍️ **Products**: What's in stock and their pricing.  
- 🌍 **Customers**: Who’s buying what and where they’re from.  
- 👩‍💼 **Employees**: Sales reps and their offices.  
- 💳 **Payments**: Tracking customer transactions.  
- 📦 **Orders**: What’s been ordered and shipped.  

---

## 🧑‍💻 **Tasks and Highlights**  
Here’s what I accomplished (and had some fun doing it!):  

### **🚀 Basic Queries**  
1. **Unique Countries**: Found all the different countries where our customers live. 🌎  
2. **City Count**: Total number of unique cities our customers come from. 🏙️  
3. **Londoners**: Only 2 customers hail from London—cheers, mates! 🍻  
4. **UK Customers Outside London**: Spotted 3 of them enjoying life elsewhere in the UK. 🇬🇧 
5. **Sales Reps**: Counted all the sales reps in our employee database. 💼  
6. **San Francisco Office Address**: It’s **Suite 300**—talk about a fancy spot! 🌉  
7. **Largest Quantity Ordered**: A whopping **97 units**—that’s some serious shopping! 🛒  
8. **Biggest Payment (Sept 28, 2003)**: Someone shelled out a hefty sum. 💰  
9. **Best Budget Buys**: Products with >5000 stock and under £25 in buy price. 🤑  
10. **No Credit Limit Customers**: Not everyone’s running up their cards—good for them! 💳  

### **🧠 Custom Questions**  
- **Motorcycles in Stock**: Counted all the motorcycle products. 🏍️  
- **Low Stock Products**: Identified those with less than 500 units—time to restock! 🚨  
- **Late Shipments**: Orders shipped after the required date—oops! 😅  

---

## 🤝 **Joins and Aggregations**  
1. **Employee Office Info**: Merged employee and office data for detailed insights. 🏢  
2. **Herkku Gifts Orders**: Found the total number of orders placed by this customer. 🎁  
3. **Atelier Graphique Payments**: Total payments received from this customer. 🖌️  
4. **Payments by Date**: Organised total payments by transaction date. 📅  
5. **Customer Payments**: Summed up payments per customer for better analysis. 💵  
6. **Top 10 Customers**: Identified the most valuable customers by payment amount. 🌟  
7. **Sales Reps for Customers**: Matched customers with their account reps. 🤝  
8. **Employees in Boston**: Found all employees based in Boston. 🐻  

---

## 📸 **Sneak Preview**  
Here are some snippets of my favorite queries and results:  

### Unique Countries Query  
```sql
SELECT DISTINCT country FROM customers;
```

### Write sql to find top 10 customers the highest total amount paid
```sql
select c.customerName, c.customerNumber, sum(p.amount) as totalpayment
from payments as p
inner join customers as c
on p.customerNumber = c.customerNumber
group by customerName, customerNumber
order by totalpayment desc
limit 10;
```
### Write a query to find the account representative for each customer
```sql
select e.employeeNumber, concat(e.firstname,' ', e.lastname) as EmployeeName, c.customerNumber, customerName
from employees as e
inner join customers as c
on e.employeeNumber = c.salesRepEmployeeNumber;
```
