/*
Q. P(R) represents a pattern drawn by Julia in R rows. The following pattern represents P(5):

* * * * * 
* * * * 
* * * 
* * 
*

Write a query to print the pattern P(20).
*\

SET @ROWS := 21;

SELECT 
    REPEAT('* ', @ROWS := @ROWS - 1) 
FROM 
    INFORMATION_SCHEMA.TABLES;

/*
Information Schema provides information about database or table name or data type of column.
*\
