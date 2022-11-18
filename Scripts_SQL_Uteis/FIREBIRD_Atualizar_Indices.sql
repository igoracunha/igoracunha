SET TERM ^ ; 
EXECUTE BLOCK
AS
declare variable sql varchar(255);
begin
   for
     select rdb$index_name from rdb$indices
     into :sql
   do
   begin
      sql = 'SET STATISTICS INDEX ' || sql;
      execute statement :sql;
   end
END;
SET TERM ; ^