	-- MIN() Functions;
	SELECT MIN(column_name)
	FROM table_name
	WHERE condition;

	-- MAX() Functions;
	SELECT MAX(column_name)
	FROM table_name
	WHERE condition;
	
	-- COUNT() Functions;
	SELECT COUNT(column_name)
	FROM table_name
	WHERE condition;
	
	
	-- AVG() Functions;
	SELECT AVG(column_name)
	FROM table_name
	WHERE condition;
	
	-- SUM() Functions;
	SELECT SUM(column_name)
	FROM table_name
	WHERE condition;
	
	-- IFNULL(), ISNULL(), COALESCE(), and NVL() Functions;
	--The SQL Server ISNULL() function lets you return an alternative value when an expression is NULL:
	
	SELECT ProductName, UnitPrice * (UnitsInStock + ISNULL(UnitsOnOrder, 0))
	FROM Products;

	SELECT ProductName, UnitPrice * (UnitsInStock + COALESCE(UnitsOnOrder, 0))
	FROM Products;
