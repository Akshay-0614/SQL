use Task;

-- Display all customer details.
select * from customer;


-- Display only customer names and cities.
select C_Name,C_City from customer;


-- Find customers who live in Hyderabad.
select C_Name,C_City from customer where C_City="Hyderabad";


-- Find customers whose age is greater than 25.
select C_Name,C_Age from customer where C_Age >= 25;


-- Find customers whose age is between 20 and 30.
select * from Customer where C_Age between 20 and 30;


-- Display customers whose name starts with 'A'.
SELECT * FROM Customer WHERE C_Name LIKE 'A%';


-- Display customers whose city is either Hyderabad or Mancherial.
SELECT * FROM Customer WHERE C_City IN ('Hyderabad', 'Mancherial');


-- Sort customers by age from highest to lowest.
SELECT * FROM Customer ORDER BY C_Age DESC;


-- Count the total number of customers.
SELECT COUNT(*) AS Total_Customers FROM Customer;


-- Find the average age of customers.
SELECT AVG(C_Age) AS Average_Age FROM Customer;
