-- Create Customer table with Constraints
CREATE TABLE Customer(
  C_Id int Primary key,
  C_Name varchar(50) NOT NULL,
  C_Email varchar(100) DEFAULT NULL,
  C_Age int DEFAULT NULL,
  C_City varchar(50) DEFAULT 'Hyderabad'
  );
  
  -- display all records from customer table
select * from Customer;

-- Insert multiple customer records
Insert into customer values (101,'Akshay KUmar','doddiakshaykumar1@gmail.com',23,'Mancherial'),
(102,'Adithya','adithyachatla2@gmail.com',24,'Khammam'),
(103,'Vilas','vilasmummadi1@gmail.com',25,'Karimnagar'),
(104,'Akhil KUmar','akilchary34@gmail.com',25,'Peddapalli'),
(105,'Ajay KUmar','ajaykumar6@gmail.com',23,'Hyderabad'),
(106,'Kumar','kumardoddi5@gmail.com',23,'Mancherial');

-- Insert a customer without specifying C_City
-- DEFAULT value 'Hyderabad' will be automatically inserted
Insert into customer(C_Id,C_Name,C_Email,C_Age) values (107,'Mahesh','doddimahesh5@gmail.com',25);

-- Update the name of customer whose ID is 101
Update Customer set C_Name= 'Akshay Kumar' Where C_Id=101;

-- Update the name of customer whose ID is 104
Update Customer set C_Name= 'Akhil Kumar' Where C_Id=104;

-- Update the name of customer whose ID is 105
Update Customer set C_Name= 'Ajay Kumar' Where C_Id=105;

-- Display only customer names and email addresses
select C_Name ,C_Email from Customer;

-- Display customers whose age is exactly 25
Select * from Customer where C_Age=25;

-- Display customers who belong to Mancherial
Select * from Customer where C_City='Mancherial';

-- Update the city of customer 107
Update Customer Set C_City='Hyderabad' where C_Id=107;

-- Update the age of customer 102
Update Customer set C_Age=26 where C_Id=102;

-- Delete customer whose ID is 106
delete from customer where C_Id=106;

-- Delete customer whose ID is 102
delete from customer where C_Id=102;

-- Display customers whose age is greater than 24
select * from Customer where C_Age > 24;

-- Display customers whose age is between 23 and 25
-- BETWEEN includes both 23 and 25
select * from customer where C_Age Between 23 and 25;

-- Reinsert deleted customer 106
Insert into Customer Values(106, 'Kumar', 'kumardoddi5@gmail.com', 23, 'Mancherial');

-- Reinsert deleted customer 102
Insert into Customer Values(102, 'Adithya', 'adithyachatla2@gmail.com', 24, 'Khammam');

-- Display the final Customer table
select * from Customer;
