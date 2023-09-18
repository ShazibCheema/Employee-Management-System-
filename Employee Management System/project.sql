create database EmployeeManagementSystem;
use EmployeeManagementSystem;

create table Department(
Dep_id int primary key auto_increment not null,
Dep_name varchar(40)
);
insert into Department values(1,'IT') ,(2,'Marketing'),(3,'HR');
select *from Department;

create table Employee(
Emp_id int primary key auto_increment not null,
Emp_Fname varchar(50) not null,
Emp_Lname varchar(50) not null,
emp_phone int not null,
Emp_City varchar(255) not null,
Date_of_join date not null,
Dep_id int,
foreign key (Dep_id) references Department(Dep_id) 
);
insert into Employee values(1,'Ali','Ahmad',02312311,'Lahore','2022-7-4',1),
						   (2,'Ahmad','Ali',03211321,'Lahore','2022-7-4',1),
						  (3,'Shazib','Ali',03211292,'Islamabad','2022-7-4',2),
						  (4,'Ali','Shazad',03381232,'Kharachi','2022-7-5',2),
						(5,'Shazad','Ahmad',03820132,'Lahore','2022-7-6',3)
;
select *from Employee;
-- This is the method to initialize foreign key in mysql first declare the column as usual and then add references
create table Project(
Project_id int primary key auto_increment null,
P_name varchar(30),
P_Descript varchar(235)
);
Insert into Project values(1,'Employee Management System','Make Fully responisve user friendly Java based Application'),
						  (2,'Student Management System','Make Fully responisve user friendly Java based Application'),
						 (3,'E-Commerce Website','Make Fully responisve user friendly Web based Application');
select *from Project;
create table Task(
Task_id int primary key auto_increment not null,
Employee_id int,
foreign key (Employee_id) references Employee(Emp_id),
Project_id int,
foreign key (Project_id) references Project(Project_id),
T_descript varchar(235) not null,
Start_date date not null,
End_date date not null
);
insert into Task values(1,1,1,'Design interface','2022-8-1','2022-8-7'),
						(2,3,1,'SEO','2022-8-1','2022-8-7'),
                        (3,5,null,'Montly Report','2022-8-28','2022-9-1');
                        
create table Attendance (
Attendance_id int primary key auto_increment  not null,
Employee_id int,
foreign key (Employee_id) references Employee(Emp_id),
stat_us varchar(1) not null,
Time_in datetime,
Time_out datetime
);

insert into  Attendance values (1,1,'P','2022-7-4 07:00:00','2022-7-4 16:00:00'),
								(2,1,'P','2022-7-4 07:00:00','2022-7-5 16:00:00'),
                                (3,2,'P','2022-7-4 07:00:00','2022-7-4 16:00:00'),
                                (4,2,'P','2022-7-4 07:10:00','2022-7-5 16:00:00');
insert into Attendance(Employee_id,Stat_us,Time_in,Time_out) values(2,'P','2022-7-6 07:10:00','2022-7-6 16:00:00');
SELECT *FROM ATTENDANCE;
-- drop table Attendance

create table Emp_leave (
Leave_id int primary key auto_increment not null,
Employee_id int,
foreign key (Employee_id) references Employee(Emp_id),
Start_Date date,
End_Date date,
Reason varchar(235)
);
insert into Emp_leave values(1,1,'2023-07-30','2023-08-01','Sick');
select *from Emp_leave;
insert into Emp_leave(Employee_id,Start_Date,End_Date,Reason) values();


create table Salary(
Salary_id int primary key auto_increment not null,
Employee_id int,
foreign key (Employee_id) references Employee(Emp_id),
Basic_pay int,
Allowances int,
Deduction int
);
insert into Salary values(1,1,20000,20000,0),(2,2,30000,20000,0),(3,3,20000,20000,2000),(4,4,20000,30000,1000),(5,5,20000,20000,2000);
select *from Salary;

create table Performance(
Employee_id int,
foreign key (Employee_id) references Employee(Emp_id),
Rating float,
feedback varchar(235)
);

insert into Performance	 values(1,4.0,'Excellent'),(2,4.0,'Excellent'),(3,3.0,'Good'),(4,2.6,'Fair'),(5,1.0,'Poor');
select *from cafe;
create table Cafe(
Emp_id int,
foreign key (Emp_id) references Employee(Emp_id),
Cafe_Avail varchar(3) not null
);
insert into Cafe values (1,'No'),(2,'Yes'),(3,'Yes'),(4,'No'),(5,'No');
select *from Cafe;

create table Cafe_bill(
Bill_id int primary key auto_increment not null,
Emp_id int,
foreign key (Emp_id) references Employee(Emp_id),
Total_bill_payable int not null,
Total_bill_payed int not null
);
insert into Cafe_bill values (1,2,2000,1000),(2,3,1000,500);

select *from Cafe_bill;

