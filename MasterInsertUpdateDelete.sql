CREATE TABLE Employee_1
(
    Id         INT NOT NULL PRIMARY KEY,
    First_name VARCHAR(10),
    Last_name  VARCHAR(10),
    Salary     DECIMAL(10, 2),
    City       VARCHAR(20),
)
INSERT INTO Employee_1 VALUES (2,  'Sameer',  'Gaikwad',   4789, 'Agra');
INSERT INTO Employee_1 VALUES (4,'Rahul','Gupta',5567,'London');
INSERT INTO Employee_1 VALUES (5, 'Prabhat','Kumar',4467,'Bombay');
INSERT INTO Employee_1 VALUES (6,'Ramu','Khan',3456,'JK');

CREATE PROCEDURE MasterInsertUpdateDelete (@Id            INT,
                                          @First_name    VARCHAR(10),
                                          @Last_name     VARCHAR(10),
                                          @Salary        DECIMAL(10, 2),
                                          @City          VARCHAR(20),
                                          @StatementType NVARCHAR(20) = '')
AS
  BEGIN
      IF @StatementType = 'Insert'
        BEGIN
            INSERT INTO Employee_1
                        (Id,
                         First_name,
                         Last_name,
                         Salary,
                         City)
            VALUES     ( @Id,
                         @First_name,
                         @Last_name,
                         @Salary,
                         @City)
        END

      IF @StatementType = 'Select'
        BEGIN
            SELECT *
            FROM  Employee_1
        END

      IF @StatementType = 'Update'
        BEGIN
            UPDATE Employee_1
            SET    First_name = @First_name,
                   Last_name = @Last_name,
                   Salary = @Salary,
                   City = @City
            WHERE  Id = @Id
        END

      ELSE IF @StatementType = 'Delete'
        BEGIN
            DELETE FROM Employee_1
            WHERE  id = @id
        END
  END

  EXEC MasterInsertUpdateDelete
  @Id = 2, 
  @First_name ='Sameer', 
  @Last_name= 'Gaikwad', 
  @Salary = 4789,  
  @City = 'Agra',
  @StatementType = 'Select'

USE [master]

DECLARE	@return_value int

EXEC	@return_value = [dbo].[MasterInsertUpdateDelete]
		@Id = 2,
		@First_name = 'Sameer',
		@Last_name = 'Gaikwad',
		@Salary = 4789,
		@City = 'Agra',
		@StatementType = 'Select'

--SELECT	'Return Value' = @return_value