
MERGE in Oracle SQL
MERGE is a SQL statement used to perform INSERT, UPDATE, or both operations on a target table depending on whether matching records exist in another source.

It is also known as an UPSERT operation (UPDATE + INSERT).

In simple words:
- If a matching record exists → UPDATE it.
- If a matching record does not exist → INSERT it.

*SYNTEX OF MERGE 
  MERGE INTO target_table t
  
  USING source_table s
  
  ON (t.id = s.id)
  
  WHEN MATCHED THEN
  
   UPDATE SET
      
   t.column_name = s.column_name
  
  WHEN NOT MATCHED THEN
      INSERT (column1, column2)
      VALUES (s.column1, s.column2);

1. MERGE is also called UPSERT.

2. MERGE can perform INSERT and UPDATE in one statement.

3. The ON condition determines whether records match.

4. The source can be a table or a SELECT query.

5. The target table cannot be updated in a way that changes a column referenced in the ON condition.

6. If multiple source rows match the same target row for an update, Oracle can raise an error because the same target row cannot be updated multiple times in one MERGE statement.

7. MERGE is a DML statement, so transaction control applies. You can COMMIT or ROLLBACK its changes.

