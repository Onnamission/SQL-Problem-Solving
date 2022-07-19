
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

There are 4 clauses in SQL where we can use a subquery

 - SELECT
 - FROM
 - WHERE
 - HAVING

**Note:** 
 - It is advised not to use subquery in select clause because for every record the SEELCT clause will process, the whole query inside the SELECT clause will also process making the processing very huge. As a solution, you can use JOIN statement.

```sql
  SELECT *, (CASE
            WHEN "salary" > (SELECT AVG("salary") FROM "Employee") THEN 'You are rich'
            ELSE 'You are poor'
           END) as "remarks"
  FROM "Employee";
```

- There should be only scalar subquery in SELECT clause.

**WITH** Clause

When you are using same subquery multiple times, use WITH clause.
Basically, if you are creating a temp table for avg or sum, better to put it in WITH clause.

```sql
  WITH sales AS (SELECT "store_name", SUM("price") AS "total_sales"
                 FROM "Sales"
                 GROUP BY "store_name")
  SELECT *
  FROM sales;
```

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

### Case 5

<b>Q.</b> Find stores whose sales were better than the average sales across all stores.

**Sales Table**

| Parameter             | Data Type    |
| ----------------- | ------ |
| store_id | int |
| store_name | varchar |
| product_name | varchar |
| quantity | int |
| price | int |

### Case 6

<b>Q.</b> Fetch all employee details and add remarks to those employees who earn more than the average pay.

**Employee Table**

| Parameter             | Data Type    |
| ----------------- | ------ |
| Id | int |
| emp_name | varchar |
| dept_name | varchar |
| salary | int |

### Case 7

<b>Q.</b> Find the stores which have sold more units than the average units sold by all stores.

**Sales Table**

| Parameter             | Data Type    |
| ----------------- | ------ |
| store_id | int |
| store_name | varchar |
| product_name | varchar |
| quantity | int |
| price | int |

### Case 8

<b>Q.</b> INSERT data to employee history table. Make sure not to insert duplicate records.

**Employee History Table**

| Parameter             | Data Type    |
| ----------------- | ------ |
| emp_id | int |
| emp_name | varchar |
| dept_name | varchar |
| salary | int |
| location | varchar |

### Case 9

<b>Q.</b> Give 10% increment to all employees in Bangalore location based on the maximum salary earned by an employee in each department. Use employee_history.

**Employee History Table**

| Parameter             | Data Type    |
| ----------------- | ------ |
| emp_id | int |
| emp_name | varchar |
| dept_name | varchar |
| salary | int |
| location | varchar |

### Case 10

<b>Q.</b> Delete all employees who do not have any department.

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

### Case 11

<b>Q. Pivot the data to get sales data of a particular month.</b>

**Sales Data Table**

| Parameter             | Data Type    |
| ----------------- | ------ |
| sales_date | date |
| customer_id | varchar |
| amount | int |

### Case 12

<b>Q. Delete duplicate rows from a table.</b>

**Duplicate Employee Table**

| Parameter             | Data Type    |
| ----------------- | ------ |
| id | int |
| emp_name | varchar |
| dept_name | varchar |
| age | int |
| gender | varchar |
| salary | int |

### Case 13

<b>Q. Do the data cleaning by removing dollar sign and converting data type to int</b>

**Duplicate Employee Table**

| Parameter             | Data Type    |
| ----------------- | ------ |
| id | int |
| salary | varchar |
