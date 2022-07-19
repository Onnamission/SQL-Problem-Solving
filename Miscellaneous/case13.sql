/*
Q. Do the data cleaning by removing dollar sign and converting data type to int
*/

select * from "demo_data";

select cast(replace("salary", '$', ' ') as int)
from "demo_data";
