
# Miscellaneous Problem Solving

Questions provided are not from HackerRank. This section will mostly contain subqueries.

There are 3 types of subqueries:

 - **Scalar subquery** - return only 1 row and 1 column.
 - **Multiple row subquery** - returns multiple rows and mutiple columns or multiple rows and 1 column.
 - **Correlated subquery** - returns subquery related to outer query
 
**Note:** Correlated subquery is usually avoided due to its large processing. But for some problems, you have to use it.

```sql
  SELECT "emp_name"
  FROM "Employee" as e1
  WHERE "salary" > (SELECT AVG("salary")
                    FROM "Employee" AS e2
                    WHERE e2."dept_name" = e1."dept_name")
  GROUP BY e1."emp_name";
```

For the above query, the outer query will output a table and then the subquery will output a table matching with every row from a table came from outer query

So, if there is 1 million record, then 1 million records will be processed and then another 1 million records of same data will be matched with every row of 1st million records and that will make a processing of 1,000,000 x 1,000,000 = 1,000,000,000,000 records.

### Case 1

<b>Q.</b> Find the employees whose salary is more than the average salary earned by all employees.

**Employee Table**

| Parameter             | Data Type    |
| ----------------- | ------ |
| Id | int |
| emp_name | varchar |
| dept_name | varchar |
| salary | int |

### Case 2

<b>Q.</b> Find the empolyees who earn the highest salary in each department.

**Employee Table**

| Parameter             | Data Type    |
| ----------------- | ------ |
| Id | int |
| emp_name | varchar |
| dept_name | varchar |
| salary | int |

### Case 3

<b>Q.</b> Find the department who do not have any employees.

**Employee Table**

| Parameter             | Data Type    |
| ----------------- | ------ |
| Id | int |
| emp_name | varchar |
| dept_name | varchar |
| salary | int |

**Department Table**

| Parameter             | Data Type    |
| ----------------- | ------ |
| Id | int |
| dept_name | varchar |
| location | varchar |

### Case 4

<b>Q.</b> Find the employees in each department who earn more than the average salary in that department.

**Employee Table**

| Parameter             | Data Type    |
| ----------------- | ------ |
| Id | int |
| emp_name | varchar |
| dept_name | varchar |
| salary | int |

**Department Table**

| Parameter             | Data Type    |
| ----------------- | ------ |
| Id | int |
| dept_name | varchar |
| location | varchar |
