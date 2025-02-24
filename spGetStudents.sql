CREATE PROCEDURE spGetStudents
AS
BEGIN
     SELECT Roll_No,
	 Name, 
	 Batch, 
	 Phone_No, 
	 Citizen_Id
     FROM Student
END