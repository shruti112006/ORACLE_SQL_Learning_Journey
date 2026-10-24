
ORDER BY CLAUSE IN ORACLE SQL

*PURPOSE : 
 
 1. Order by clause used to sort the records on the basis of the columns specified in the query.            
 
 2. By default it sort the record in ascending order but by using DESC keyword we can sort records in desecnding order.

 3. We can pass multiple columns in order by clause but the compiler first sorts the records on the basis of the first column.
              If the first column has some duplicate records then it will take help of the next specified column to sort the data.

 4. NULL -> NULL is an unknown datatype. It can't be compare with other values directly because NULL means nothing, empty.
              So, IS NULL AND IS NOT NULL keywords are used to handle NULL records
