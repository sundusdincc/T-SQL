/*
Ad Hoc Query;
Query-> Parse-> Optimize-> Compile-> Execute-> Result

Stored Procedure;
Execute-> Result

NOT: Since the Execution Plan is created, Stored Procedure runs much faster than Ad Hoc Query.
Contrary to Client Server architecture, batch processes run at ram speed, not network speed, as they run inside.
SP, changes can be made without updating the software.
You can use the tempdb database to store and manipulate temporary data in your stored procedures.
Stored Procedures can be called within each other.

RAISERROR is a Transact-SQL (T-SQL) statement in Microsoft SQL Server used to generate an error message and raise an error severity level.
This statement is often used to communicate information about errors, exceptions, or custom messages to users or applications interacting with the database.

RAISERROR (message_string, severity, state);

Example;
	DECLARE @productName NVARCHAR(100) = 'Ürün A';
	DECLARE @errorMessage NVARCHAR(4000) = 'Ürün "%s" stokta bulunmamaktadır.';
	RAISERROR(@errorMessage, 16, 1, @productName);

*/


-- Creating a Stored Procedure Syntax;
CREATE PROCEDURE procedure_name @ParameterNames
AS
   sql_statement
GO;


EXEC procedure_name;



-- Creating a Stored Procedure Syntax ;
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


	--Example;
	--CREATE PROCEDURE--
	CREATE PROCEDURE AddCustomer
	    @FirstName NVARCHAR(50),
	    @LastName NVARCHAR(50),
	    @Email NVARCHAR(100)
	AS
	BEGIN
	    INSERT INTO Customers (FirstName, LastName, Email)
	    VALUES (@FirstName, @LastName, @Email)
	END;



	--Example;
	--CREATE PROCEDURE--
	CREATE PROCEDURE AddCustomer
	    @NAME NVARCHAR(50),
	    @SURNAME NVARCHAR(50),
	    @BIRTHDATE Date
	AS
	BEGIN
	    INSERT INTO Customers (NAME, SURNAME,BIRTHDATE)
	    VALUES (@NAME, @SURNAME, @BIRTHDATE)
	END;

	--EXEC PROCEDURE--
	EXEC AddCustomer @NAME='Ayşe',@SURNAME='Özbag',@BIRTHDATE='1998.02.01'

	SELECT * FROM Customers WHERE  NAME='Ayşe'AND SURNAME='Özbag'AND BIRTHDATE='1998.02.01'


