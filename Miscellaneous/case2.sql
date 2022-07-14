/*
Q. Find the empolyees who earn the highest salary in each department
*/

SELECT "emp_name"
FROM "Employee"
WHERE ("dept_name", "salary") 
IN (
  SELECT DISTINCT("dept_name"), MAX("salary")
  FROM "Employee"
  GROUP BY "dept_name");
