--CREATE VIEW Syntax--
CREATE VIEW view_name AS
SELECT column1, column2, ...
FROM table_name
WHERE conditions;

-Example--
CREATE VIEW [Brazil Customers] AS
SELECT CustomerName, ContactName
FROM Customers
WHERE Country = 'Brazil';

SELECT * FROM [Brazil Customers];


--VIEW değiştirme--
ALTER VIEW view_name AS
SELECT column1, column2, ...
FROM table_name
WHERE conditions;


--SQL DROP VIEW Syntax--
DROP VIEW view_name;
--Example--
DROP VIEW dbo.MusteriGorunumu;
DROP VIEW [Brazil Customers];

--SQL CREATE OR REPLACE VIEW Syntax--
CREATE OR REPLACE VIEW view_name AS
SELECT column1, column2, ...
FROM table_name
WHERE condition;

--Example--
CREATE OR REPLACE VIEW [Brazil Customers] AS
SELECT CustomerName, ContactName, City
FROM Customers
WHERE Country = 'Brazil';

