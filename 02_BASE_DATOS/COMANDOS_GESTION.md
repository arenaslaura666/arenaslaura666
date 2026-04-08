# Database Management Commands

This document contains the necessary SQL commands for database management including backup, restore, optimization, and performance monitoring.

## 1. Database Backup
To create a backup of your database, use the following command:
```sql
-- Backup Database
BACKUP DATABASE your_database_name TO DISK = 'path_to_backup\your_database_name.bak';
```

## 2. Database Restore
To restore a backup, you can execute:
```sql
-- Restore Database
RESTORE DATABASE your_database_name FROM DISK = 'path_to_backup\your_database_name.bak';
```

## 3. Database Optimization
For optimizing your database, you can use the following command for reindexing:
```sql
-- Rebuild Index
USE your_database_name;
GO
EXEC sp_MSforeachtable @command1 = 'PRINT ''?''; ALTER INDEX ALL ON ? REBUILD;';
```

## 4. Performance Monitoring
To monitor performance, you can retrieve the queries currently running:
```sql
-- View currently running queries
SELECT * FROM sys.dm_exec_requests;
```

## 5. Check Database Size
To check the size of your database:
```sql
-- Check Database Size
EXEC sp_spaceused;
```

## 6. Check Index Fragmentation
To check for index fragmentation:
```sql
-- Check Index Fragmentation
SELECT
    DB_NAME(database_id) AS DatabaseName,
    OBJECT_NAME(object_id) AS TableName,
    index_id,
    name AS IndexName,
    avg_fragmentation_in_percent
FROM sys.dm_db_index_physical_stats(DB_ID(), NULL, NULL, NULL, 'DETAILED')
WHERE avg_fragmentation_in_percent > 10;
```

---
*Replace `your_database_name` and paths accordingly.*