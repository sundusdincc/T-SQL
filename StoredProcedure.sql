--Creating a Stored Procedure Syntax--
CREATE PROCEDURE procedure_name @ParameterNames
AS
   sql_statement
GO;


EXEC procedure_name;


--Creating a Stored Procedure Syntax--
CREATE PROCEDURE ProcedureName
    @Parameter1 DataType,
    @Parameter2 DataType
AS
BEGIN
    -- SQL statements here
    -- You can use the parameters like: @Parameter1, @Parameter2

    -- Example: SELECT * FROM TableName WHERE ColumnName = @Parameter1;

END;

-- Executing a Stored Procedure
EXEC ProcedureName @Parameter1 = Value1, @Parameter2 = Value2;



--Altering a Stored Procedure  Syntax--
ALTER PROCEDURE ProcedureName
    @Parameter1 DataType,
    @Parameter2 DataType
AS
BEGIN
    -- Updated SQL statements here
    -- You can use the parameters like: @Parameter1, @Parameter2

    -- Example: SELECT * FROM TableName WHERE ColumnName = @Parameter1;

END;




--Example--
-- Altering the stored procedure
ALTER PROCEDURE GetEmployeeInfo
    @EmployeeID INT,
    @IncludeSalary BIT
AS
BEGIN
    IF @IncludeSalary = 1
    BEGIN
        SELECT FirstName, LastName, Department, Salary
        FROM Employees
        WHERE EmployeeID = @EmployeeID;
    END
    ELSE
    BEGIN
        SELECT FirstName, LastName, Department
        FROM Employees
        WHERE EmployeeID = @EmployeeID;
    END
END;


EXEC GetEmployeeInfo @EmployeeID = 123, @IncludeSalary = 1;
