--BACKUP--
/*1-Full Backup:
    A full backup creates a copy of the entire database at a specific point in time. It includes all data and objects within the database.
    Full backups are typically used as a starting point for other types of backups and for database recovery.
    To create a full backup using SQL Server Management Studio (SSMS) or T-SQL, you can use the BACKUP DATABASE command.*/

BACKUP DATABASE YourDatabaseName
TO DISK = 'C:\Backup\YourDatabaseNameFull.bak';

/*2-Differential Backup:
    A differential backup captures changes made to the database since the last full backup.
    It only includes the data that has changed, making it faster than a full backup.
    Differential backups are often used between full backups to reduce backup time and storage requirements.*/

BACKUP DATABASE YourDatabaseName
TO DISK = 'C:\Backup\YourDatabaseNameDiff.bak'
WITH DIFFERENTIAL;

/*3-Transaction Log Backup: 
    Transaction log backups capture all changes to the database since the last transaction log backup. 
    They are crucial for point-in-time recovery and maintaining data consistency. 
    Transaction log backups are typically used in conjunction with full and differential backups.*/

BACKUP LOG YourDatabaseName
TO DISK = 'C:\Backup\YourDatabaseNameLog.trn';



--RESTORE--

/*1-Full Database Restore: 
    This type of restore replaces an existing database with a backup of the entire database. 
    It is used to recover the entire database to a point in time when the backup was taken.*/

	RESTORE DATABASE [YourDatabaseName]
	FROM DISK = 'C:\Path\To\Your\BackupFile.bak'
	WITH REPLACE, RECOVERY;

/*2-Differential Restore: 
    A differential backup contains changes made to the database since the last full backup. 
    You can use this to apply only the changes since the last full backup to a restored full backup.*/
	
	RESTORE DATABASE [YourDatabaseName]
	FROM DISK = 'C:\Path\To\Your\FullBackup.bak'
	WITH NORECOVERY;
	
	-- Restore the differential backup
	RESTORE DATABASE [YourDatabaseName]
	FROM DISK = 'C:\Path\To\Your\DifferentialBackup.bak'
	WITH RECOVERY;


/*3-Transaction Log Restore: 
    Transaction log backups capture changes to the database since the last log backup.
    You can use this to apply transaction log backups to a restored full or differential backup to bring the database to a specific point in time.*/
	
	-- Restore the full or differential backup first
	RESTORE DATABASE [YourDatabaseName]
	FROM DISK = 'C:\Path\To\Your\FullOrDifferentialBackup.bak'
	WITH NORECOVERY;
	
	-- Restore transaction log backups
	RESTORE LOG [YourDatabaseName]
	FROM DISK = 'C:\Path\To\Your\LogBackup1.trn'
	WITH NORECOVERY;
	
	-- Repeat for additional log backups
	
	-- Finally, bring the database online
	RESTORE DATABASE [YourDatabaseName] WITH RECOVERY;
	

