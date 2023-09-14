/*
Kelime anlamı tetikçi veya tetikleyici.
Veri manipülasyonları sonrasında çalışırlar.
Loglama, kontrol, güvenlik ve toplam hesaplama için kullanılır.
*/

--AFTER INSERT Trigger:
	CREATE TRIGGER AfterInsertTrigger
	ON TableName
	AFTER INSERT
	AS
	BEGIN
	    INSERT INTO AnotherTable (Column1, Column2)
	    SELECT ColumnA, ColumnB FROM inserted;
	END;

-- AFTER UPDATE Trigger:
	CREATE TRIGGER AfterUpdateTrigger
	ON TableName
	AFTER UPDATE
	AS
	BEGIN
	    INSERT INTO ChangeLog (TableName, ColumnName, OldValue, NewValue)
	    SELECT 'TableName', 'ColumnName', deleted.ColumnName, inserted.ColumnName
	    FROM deleted
	    JOIN inserted ON deleted.PrimaryKey = inserted.PrimaryKey;
	END;

--AFTER DELETE Trigger:
	CREATE TRIGGER AfterDeleteTrigger
	ON TableName
	AFTER DELETE
	AS
	BEGIN
	    INSERT INTO ArchiveTable (Column1, Column2)
	    SELECT ColumnA, ColumnB FROM deleted;
	END;


-- INSTEAD OF INSERT Trigger:
	CREATE TRIGGER InsteadOfInsertTrigger
	ON TableName
	INSTEAD OF INSERT
	AS
	BEGIN
	    IF EXISTS (SELECT 1 FROM inserted WHERE ColumnX IS NULL)
	    BEGIN
	        RAISEERROR('ColumnX cannot be NULL');
	        ROLLBACK TRANSACTION;
	    END
	    ELSE
	    BEGIN
	        INSERT INTO TableName (Column1, Column2)
	        SELECT ColumnA, ColumnB FROM inserted;
	    END;
	END;


-- AFTER TRIGGER for Multiple Events:
	CREATE TRIGGER AfterInsertOrUpdateTrigger
	ON TableName
	AFTER INSERT, UPDATE
	AS
	BEGIN
	    INSERT INTO EventLog (EventType, EventDate)
	    VALUES ('INSERT/UPDATE', GETDATE());
	END;






--Example:
ALTER TRIGGER  AfterLogUpdate ON  Customers
AFTER  UPDATE
AS 
BEGIN 
DECLARE @LOG_HOSTNAME AS VARCHAR(255)=HOST_NAME()
DECLARE @LOG_DATE AS DATETIME
SET @LOG_DATE=GETDATE()
DECLARE @LOG_PROGRAM AS VARCHAR(255)=PROGRAM_NAME()
DECLARE @LOG_USERNAME AS VARCHAR(255)=SUSER_NAME()
DECLARE @LOG_SQL AS VARCHAR(MAX)
DECLARE @LOG_ACTIONTYPE AS VARCHAR(10)='UPDATE'

SELECT GETDATE()
DBCC INPUTBUFFER(@@SPID)

CREATE TABLE #T (EVENTTYPE VARCHAR(100), PARAMETERS_ VARCHAR(100),EVENTINFO VARCHAR(MAX))
DECLARE @SQL AS NVARCHAR(MAX)
SET @SQL='INSERT INTO #T EXEC (''DBCC INPUTBUFFER('+CONVERT(varchar,@@SPID)+')'')'
EXEC SP_EXECUTESQL @SQL 
SELECT @LOG_SQL=EVENTINFO FROM #T

DROP TABLE #T

INSERT INTO LOGDB.dbo.Customers
(ID,NAME, SURNAME, BIRTHDATE, CITY, TOWN, GENDER ,LOG_HOSTNAME,LOG_DATE,LOG_PROGRAM,LOG_USERNAME,LOG_SQL,LOG_ACTIONTYPE)

SELECT 
(ID, NAME, SURNAME, BIRTHDATE, CITY, TOWN, GENDER ,LOG_HOSTNAME,LOG_DATE,LOG_PROGRAM,LOG_USERNAME,LOG_SQL,LOG_ACTIONTYPE)
FROM deleted

END
