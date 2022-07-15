/*
Q. Fetch all employee details and add remarks to those employees who earn more than the average pay.
*/

SELECT *, (CASE
            WHEN "salary" > (SELECT AVG("salary") FROM "Employee") THEN 'You are rich'
            ELSE 'You are poor'
           END) as "remarks"
FROM "Employee";

-- Alternative

SELECT *, (CASE
            WHEN "salary" > "avg_sal".sal THEN 'You are rich'
            ELSE 'You are poor'
           END) as "remarks"
FROM "Employee"
CROSS JOIN (SELECT AVG("salary") AS sal FROM "Employee") AS "avg_sal";
