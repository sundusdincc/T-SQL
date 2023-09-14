OLTP (Online Transaction Processing):
/*
OLTP is a database processing paradigm designed for managing and processing high volumes of real-time, short, and simple transactions.
These transactions are usually the kind that you encounter in day-to-day operations, such as making a reservation, updating inventory, or processing financial transactions.
OLTP databases are optimized for quick and efficient retrieval, insertion, and modification of data.
*/
--Example:
-- Create a database for banking operations
CREATE DATABASE BankDB;
USE BankDB;

-- Create a table for customers
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(20)
);

-- Create a table for accounts
CREATE TABLE Accounts (
    AccountID INT PRIMARY KEY,
    CustomerID INT,
    AccountType VARCHAR(20),
    Balance DECIMAL(18, 2),
    CONSTRAINT FK_Customer_Account FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Create a table for transactions
CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY,
    AccountID INT,
    TransactionType VARCHAR(20),
    Amount DECIMAL(18, 2),
    TransactionDate DATETIME,
    CONSTRAINT FK_Account_Transaction FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID)
);

-- Insert sample data into Customers table
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone)
VALUES (1, 'John', 'Doe', 'john@example.com', '123-456-7890');

-- Insert sample data into Accounts table
INSERT INTO Accounts (AccountID, CustomerID, AccountType, Balance)
VALUES (1, 1, 'Savings', 1000.00),
       (2, 1, 'Checking', 500.00);

-- Perform a transaction (e.g., deposit)
INSERT INTO Transactions (AccountID, TransactionType, Amount, TransactionDate)
VALUES (1, 'Deposit', 200.00, GETDATE());

-- Perform a transaction (e.g., withdrawal)
INSERT INTO Transactions (AccountID, TransactionType, Amount, TransactionDate)
VALUES (2, 'Withdrawal', 50.00, GETDATE());

-- Check account balance
SELECT AccountID, AccountType, Balance
FROM Accounts
WHERE CustomerID = 1;

-- View transaction history for an account
SELECT TransactionID, TransactionType, Amount, TransactionDate
FROM Transactions
WHERE AccountID = 1;


  
/*
OLAP (Online Analytical Processing):
OLAP, on the other hand, is designed for complex queries and analysis of large volumes of historical data.
OLAP databases are optimized for reporting, data mining, and business intelligence activities. 
*/
--Example:
SELECT
    C.CategoryID,
    C.CategoryName,
    T.Month,
    T.Year,
    SUM(S.Amount) AS TotalSales
FROM
    Sales AS S
    JOIN Products AS P ON S.ProductID = P.ProductID
    JOIN Categories AS C ON P.CategoryID = C.CategoryID
    JOIN Time AS T ON S.SaleDate = T.TimeID
WHERE
    T.Month = 7 -- Specify the month you're interested in
    AND T.Year = 2023 -- Specify the year you're interested in
GROUP BY
    C.CategoryID,
    C.CategoryName,
    T.Month,
    T.Year
ORDER BY
    C.CategoryID,
    T.Year,
    T.Month;

