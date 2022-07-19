/*
Q. Pivot the data to get sales data of a particular month.
*/

-- the crosstab function has to return minimum 3 columns

CREATE EXTENSION tablefunc;

-- getting the sales data

SELECT "customer_id", to_char("sales_date", 'Mon-YY') AS sales_date, "amount"
FROM "sales_data"

-- getting the sum of sales amount as per customer ID and date

SELECT "customer_id", 
	   TO_CHAR("sales_date", 'Mon-YY') AS "sales_date", 
       SUM("amount")
FROM "sales_data"
GROUP BY "customer_id", TO_CHAR("sales_date", 'Mon-YY')
ORDER BY 1;  -- if this is not mentioned than it will gererate multiple values in pivoted table due to random arrangements.

-- pivoting

SELECT *
FROM crosstab(' SELECT "customer_id", 
                TO_CHAR("sales_date", ''Mon-YY'') AS "sales_date", 
                SUM("amount")
                FROM "sales_data"
                GROUP BY "customer_id", TO_CHAR("sales_date", ''Mon-YY'')
                ORDER BY 1; ',
              ' VALUES (''Jan-21''), (''Mar-21''), (''Apr-21''), (''May-21'') ')
AS t ("customer_id" VARCHAR,
      "Jan_21" FLOAT8,
      "MAR_21" FLOAT8,
      "APR_21" FLOAT8,
      "MAY_21" FLOAT8);
