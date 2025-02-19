Create Table Customer_1
(
CustomerId int IDENTITY(1,1) PRIMARY KEY,
CustomerName varchar(20),
ContactName varchar(20),
Country varchar(20)
);

Insert Into Customer_1 Values ('Shubham', 'Thakur', 'India');
Insert Into Customer_1 Values ('Aman', 'Chopra', 'Australia');
Insert Into Customer_1 Values ('Naveen', 'Tulsi', 'Sri Lanka');
Insert Into Customer_1 Values ('Aditya', 'Arpan', 'Austria');
Insert Into Customer_1 Values ('Nishant', 'Jain', 'Spain');

-- Create a stored procedure named "GetCustomersByCountry"
CREATE PROCEDURE GetCustomersByCountry
    @Country VARCHAR(50)
AS
BEGIN
    SELECT CustomerName, 
	ContactName
    FROM Customer_1
    WHERE Country = @Country;
END;

-- Execute the stored procedure with parameter "Sri lanka"
EXEC GetCustomersByCountry @Country = 'Sri lanka';
             --Or
USE [master]

DECLARE	@return_value int

EXEC	@return_value = [dbo].[GetCustomersByCountry]
		@Country = 'India'

--SELECT	'Return Value' = @return_value