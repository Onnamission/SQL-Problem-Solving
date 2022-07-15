/*
Q. Find the stores which have sold more units than the average units sold by all stores.
*/

WITH sales AS (SELECT "store_name", SUM("quantity") AS "total_quant"
               FROM "Sales"
               GROUP BY "store_name")
SELECT *
FROM sales
GROUP BY "store_name", "total_quant"
HAVING "total_quant" > (SELECT AVG("total_quant") FROM sales);
