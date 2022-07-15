/*
Q. Find stores whose sales were better than the average sales across all stores.
*/

-- Method 1

-- Getting the total sales for each store
SELECT "store_name", SUM("price") AS "total_sales"
	  FROM "Sales"
	  GROUP BY "store_name"

-- Getting average sales from total sales of each store
SELECT AVG("total_sales")
FROM (SELECT "store_name", SUM("price") AS "total_sales"
	  FROM "Sales"
	  GROUP BY "store_name") AS X;

-- Getting stores with total sales more than average sales
SELECT "store_name"
FROM (SELECT "store_name", SUM("price") AS "total_sales"
	  FROM "Sales"
	  GROUP BY "store_name") AS Y
WHERE "total_sales" > (SELECT AVG("total_sales")
					   FROM (SELECT "store_name", SUM("price") AS "total_sales"
	  				   FROM "Sales"
	  				   GROUP BY "store_name") AS X);


-- Method 2

-- Sales is the table name
WITH sales AS (SELECT "store_name", SUM("price") AS "total_sales"
			   FROM "Sales"
			   GROUP BY "store_name")
SELECT *
FROM sales;

WITH sales AS (SELECT "store_name", SUM("price") AS "total_sales"
               FROM "Sales"
               GROUP BY "store_name")
SELECT *
FROM sales
WHERE "total_sales" > (SELECT AVG("total_sales") FROM sales);
