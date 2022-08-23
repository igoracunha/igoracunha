	-- 1) Colocar o nome do banco que deseja limpar o log no comando USE  
    USE dadosabertos;   
    
	DECLARE @NAME VARCHAR(100) = ''

	SELECT @NAME = name 
	FROM sysfiles WHERE filename like '%.ldf' 
    
    DECLARE @DB VARCHAR(100),
			@TEXT NVARCHAR(MAX)

	SET @DB = (SELECT DB_NAME())

	SET @TEXT = '
	ALTER DATABASE '+ @DB +'   
    SET RECOVERY SIMPLE;  
      
    DBCC SHRINKFILE ('+ @NAME+', 1);  
      
    ALTER DATABASE '+ @DB +'  
    SET RECOVERY FULL; 
	'

	EXEC SP_EXECUTESQL @TEXT