/*
Q. INSERT data to employee history table. Make sure not to insert duplicate records.
*/

SELECT *
FROM "employee_history"

INSERT INTO "employee_history"
	SELECT e."id", e."emp_name", d."dept_name", e."salary", d."location"
    FROM "Employee" AS e
    INNER JOIN "Department" AS d ON e."dept_name" = d."dept_name"
    WHERE NOT EXISTS (SELECT 1
                      FROM "employee_history" AS eh
                      WHERE eh."emp_id" = e."id");
