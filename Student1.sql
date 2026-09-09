Create database Task;
use Task;
create table Student1 (
S_id int not null,
First_name varchar (50) not null,
Last_name varchar (50) not null,
Course varchar(50) not null,
Yoj int not null,
Yop int ,
Admission_no int not null,
Gender char not null,
Phone_no Bigint ,
Location varchar(50),
Marks int ,
Primary key (S_id)
);
select * from student1;
INSERT INTO student1
(S_id, First_name, Last_name, Course, Yoj, Yop,
 Admission_no, Gender, Phone_no, Location, Marks)
VALUES
(101, 'Akshay', 'Doddi', 'MCA', 2024, 2026, 1001, 'M', '9876543210', 'Mancherial', 98),

(102, 'Prasanna', 'Reddy', 'MCA', 2023, 2026, 1002, 'F', '9876543211', 'Narsingapadu', 92),

(103, 'Akhil', 'chary', 'BSc', 2022, 2025, 1003, 'M', '9876543212', 'Hyderabad', 78),

(104, 'Akhila', 'Patel', 'MCA', 2024, 2026, 1004, 'F', '9876543213', 'Jammikunta', 95),

(105, 'Kiran', 'Rao', 'BCA', 2023, 2026, 1005, 'M', '9876543214', 'Nizamabad', 67),

(106, 'Anjali', 'Reddy', 'BSc', 2022, 2025, 1006, 'F', '9876543215', 'Hyderabad', 88),

(107, 'Vijay', 'Kumar', 'MCA', 2024, 2026, 1007, 'M', '9876543216', 'Karimnagar', 73),

(108, 'Meena', 'Sharma', 'BCA', 2023, 2026, 1008, 'F', '9876543217', 'Warangal', 81),

(109, 'Rohit', 'Verma', 'BSc', 2022, 2025, 1009, 'M', '9876543218', 'Khammam', 69),

(110, 'Divya', 'Rao', 'MCA', 2024, 2026, 1010, 'F', '9876543219', 'Hyderabad', 91),

(111, 'Suresh', 'Naidu', 'BCA', 2023, 2026, 1011, 'M', '9876543220', 'Vijayawada', 76),

(112, 'Lakshmi', 'Kumar', 'BSc', 2022, 2025, 1012, 'F', '9876543221', 'Nalgonda', 84),

(113, 'Manoj', 'Reddy', 'MCA', 2024, 2026, 1013, 'M', '9876543222', 'Hyderabad', 89),

(114, 'Pooja', 'Patel', 'BCA', 2023, 2026, 1014, 'F', '9876543223', 'Warangal', 94),

(115, 'Naveen', 'Sharma', 'BSc', 2022, 2025, 1015, 'M', '9876543224', 'Karimnagar', 72),

(116, 'Swathi', 'Reddy', 'MCA', 2024, 2026, 1016, 'F', '9876543225', 'Nizamabad', 87),

(117, 'Ajay', 'Kumar', 'BCA', 2023, 2026, 1017, 'M', '9876543226', 'Hyderabad', 63),

(118, 'Kavya', 'Rao', 'BSc', 2022, 2025, 1018, 'F', '9876543227', 'Khammam', 90),

(119, 'Ramesh', 'Naidu', 'MCA', 2024, 2026, 1019, 'M', '9876543228', 'Vijayawada', 79),

(120, 'Neha', 'Verma', 'BCA', 2023, 2026, 1020, 'F', '9876543229', 'Hyderabad', 96);
select * from Student1;

--  Find the highest marks scored by a student.
select *from Student1 where Marks=(select max(Marks) from Student1);

-- Find the second-highest marks.
select * from Student1 where Marks = ( select Marks from Student1 order by Marks desc limit 1,1);

--  Find the average marks of all students.
select avg(Marks) from Student1;

-- Find the number of students in each course.
select Course,count(*) from Student1 group by course with rollup;

-- Find the average marks for each course.
select Course,avg(Marks) from Student1 group by course ;
