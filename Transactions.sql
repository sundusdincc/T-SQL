/*
SQL Server Transactions:
A transaction in the context of a database management system (DBMS) like Microsoft SQL Server is a sequence of one or more SQL statements that are treated as a single unit of work. Transactions ensure data integrity and consistency in a database by following the ACID properties:

	1- Atomicity (Atomiklik): İşlem ya tamamıyla gerçekleşir ya da hiç gerçekleşmez. Yani işlem adımlarının herhangi birinde bir hata oluşursa, işlem önceki durumuna geri döner.
	
	2- Consistency (Tutarlılık): İşlem sonunda veritabanı belirli bir tutarlılık durumunda olmalıdır. Veritabanı, bir işlem sonucunda geçerli ve doğru bir durumda olmalıdır.
	
	3- Isolation (İzolasyon): Aynı anda birden fazla işlem gerçekleştiğinde, bu işlemler birbirinden izole edilmiş gibi davranmalıdır. Bir işlem diğer işlemlerden etkilenmemelidir.
	
	4 Durability (Kalıcılık): Bir işlem sonunda yapılan değişiklikler, kalıcı olmalıdır. Sistem çöksün ya da güç kaybı olsun, veritabanı bu değişiklikleri korumalıdır.
*/


	--Example:
	BEGIN TRANSACTION;
	
	BEGIN TRY
	    -- Veritabanı işlemleri (INSERT, UPDATE, DELETE vb.)
	    
	    -- Tüm işlemler başarılı ise COMMIT
	    COMMIT;
	END TRY
	BEGIN CATCH
	    -- Hata durumunda ROLLBACK
	    ROLLBACK;
	    -- Hata mesajını işleme alma veya raporlama
	    SELECT ERROR_MESSAGE() AS ErrorMessage;
	END CATCH;
	
	
	
	--Example:
	BEGIN TRANSACTION; -- Start the transaction
	
	DECLARE @SourceAccountID INT = 1;
	DECLARE @DestinationAccountID INT = 2;
	DECLARE @Amount DECIMAL(10, 2) = 100.00;
	
	-- Deduct money from the source account
	UPDATE BankAccounts
	SET Balance = Balance - @Amount
	WHERE AccountID = @SourceAccountID;
	
	-- Add money to the destination account
	UPDATE BankAccounts
	SET Balance = Balance + @Amount
	WHERE AccountID = @DestinationAccountID;
	
	-- Check if the balance in the source account is sufficient
	IF (SELECT Balance FROM BankAccounts WHERE AccountID = @SourceAccountID) < 0
	BEGIN
	    ROLLBACK TRANSACTION; -- Rollback the transaction if balance goes negative
	    PRINT 'Transaction rolled back due to insufficient balance.';
	END
	ELSE
	BEGIN
	    COMMIT TRANSACTION; -- Commit the transaction if all checks passed
	    PRINT 'Transaction successfully completed.';
END
