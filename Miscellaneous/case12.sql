/*
Q. Delete duplicate rows from a table.
*/

-- with max(id), only last row of duplicate values will be selected

-- getting the non-redundant data

SELECT MAX("id") 
FROM "duplicate_employee"
GROUP BY "emp_name", "dept_name", "age", "gender", "salary";

-- deleting the redundant data

DELETE FROM "duplicate_employee"
WHERE "id" NOT IN (SELECT MAX("id") 
               FROM "duplicate_employee"
               GROUP BY "emp_name", "dept_name", "age", "gender", "salary");

SELECT * FROM "duplicate_employee";
