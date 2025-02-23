Create Table Student
(
Roll_No Int IDENTITY(1,1) PRIMARY KEY,  --Only one primary key should be in a table
--A primary key supports auto-increment value
Name Varchar(20),
Batch Varchar(50),
Phone_No Varchar(10),
Citizen_Id Varchar(20),
);
Insert Into Student Values('Mike', 'EEE5', '9999999999', '1234');
Insert Into Student Values('Susan', 'EEE1', '9999900000', '5678');
Insert Into Student Values('Bree', 'EEE2', '1111111111', '9999');
Insert Into Student Values('Carl', 'EEE3', '8888888888', '8888');
Insert Into Student Values('Gaby', 'EEE6', '7777777777', '7777');

Create Table Student1
(
Roll_No Int IDENTITY(1,1) PRIMARY KEY, --Primary key cannot accept null values
Name Varchar(20),
Batch Varchar(50),
Phone_No Varchar(10),
Citizen_Id Varchar(20) UNIQUE,
);
Insert Into Student1 Values('Deepa', 'EEE1', '9000000000', '123');
Insert Into Student1 Values('Sita', 'EEE2', '8000000000', null); --Unique keys can accept null values

--Insert Into Student1 Values('Ram', 'EEE2', '7000000000', null); --Msg 2627, Level 14, State 1, Line 26
--Violation of UNIQUE KEY constraint 'UQ__Student1__5F50102F1A96E856'. Cannot insert duplicate key in object 'dbo.Student1'. The duplicate key value is (<NULL>).
--The statement has been terminated.
--It will not accept more than one Null value in Citizen_Id as Citizen_Id is a Unique key.

Create Table Student2
(
Roll_No Int IDENTITY(1,1) PRIMARY KEY, --Primary key creates clustered index by default
Name Varchar(20),
Batch Varchar(50),
Phone_No Varchar(10) UNIQUE, --More than one unique keys in a table
Citizen_Id Varchar(20) UNIQUE, --Unique keys create non-clustered index
);
--A primary key can be a Unique Key, but a Unique Key cannot be a primary key.
Insert Into Student2 Values('Deepak', 'EEE1', null, '123');
Insert Into Student2 Values('Gita', 'EEE2', '2000000000', null);