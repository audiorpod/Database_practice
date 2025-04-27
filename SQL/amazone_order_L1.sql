-- Data Definition Language (DDL) is used to define the structure of the database.
-- DDL commands are used to create, alter, and drop tables or other database objects.

-- Creating a new table named amazone_sales_l1 with defined columns
create table amazone_sales_l1(
    order_id int,               -- order_id is an integer (e.g., 1, 2, 3)
    order_date date,            -- order_date stores the date (e.g., '2022-10-01')
    product_name varchar(100),  -- product_name is a string of up to 100 characters (e.g., 'baby milk')
    total decimal(6,2),         -- total is a decimal with up to 6 digits, 2 of which are after the decimal (e.g., 3421.50)
    payment_method varchar(100) -- payment_method is a string of up to 100 characters (e.g., 'upi')
);

-- Example: The above table structure defines how each row in the table should be stored, including the data types.

-- Data Manipulation Language (DML) allows you to manipulate the data in a table.
-- DML commands include INSERT, UPDATE, DELETE, and SELECT (for querying data).

-- Inserting data into the amazone_sales_l1 table
insert into amazone_sales_l1 values(1,'2022-10-01','baby milk', 3421, 'upi');
insert into amazone_sales_l1 values(2,'2022-10-02','baby milk', 3421.5, 'credit_card');
insert into amazone_sales_l1 values(3,'2022-10-02','baby milk', 3421.5, 'upi');
insert into amazone_sales_l1 values(4,'2022-10-03','baby milk', 3423.2, 'credit_card');
insert into amazone_sales_l1 values(5,'2022-10-04','baby milk', 3422.1, 'upi');

-- Example: Above statements insert five rows into the table, each row representing an order with different details.

-- Data Querying Language (DQL) is used to query data from a database.
-- It includes the SELECT statement, which allows retrieving rows from a table.

-- Selecting all columns from amazone_sales_l1
select * from amazone_sales_l1;  -- This retrieves all rows and all columns from the table

-- Example: This will return all orders, displaying every field (order_id, order_date, product_name, total, payment_method).

-- Selecting specific columns from amazone_sales_l1
select order_date from amazone_sales_l1; -- This selects only the order_date column

-- Example: This will return a list of all order dates from the table, excluding other columns.

select order_date, total from amazone_sales_l1; -- Selecting multiple columns, order_date and total

-- Example: This retrieves the order date and the total value for each order, showing two columns for each row.

-- Limiting results returned in a query
select * from amazone_sales_l1 limit 2; -- Retrieves only the first 2 rows in MySQL

-- Example: This will return only the first two records from the table.

-- In SQL Server, the syntax to limit rows would be:
select top 2 * from amazone_sales_l1;  -- Retrieves the first 2 rows in SQL Server

-- Example: This retrieves the first two rows in SQL Server, similar to the LIMIT clause in MySQL.

-- Sorting the results by a column in ascending order (default behavior)
select * from amazone_sales_l1
order by order_date; -- Sorts the results by order_date in ascending order (earliest date first)

-- Example: This will return all rows sorted by order_date, from the earliest to the latest.

-- Sorting results by multiple columns (first by order_date, then by payment_method)
select order_date, product_name, payment_method from amazone_sales_l1
order by order_date desc, payment_method; -- First sorts by order_date (descending), then by payment_method (ascending)

-- Example: 
-- If multiple records have the same order_date, it will sort them by payment_method (e.g., 'credit_card' before 'upi').

-- Deleting data from the table
delete from amazone_sales_l1 where order_id = 1; -- Deletes rows where order_id is 1

-- Example: This deletes the row where the order_id is 1. 
-- After this command, there will be no row with order_id = 1 in the table.

-- Dropping the entire table from the database
drop table amazone_sales_l1; -- This permanently removes the table and all its data

-- Example: This will delete the table itself (not just the data), and the table structure will no longer exist in the database.
-- Be cautious, as dropping a table is irreversible.

-- Additional Examples:

-- Case 1: Filtering records based on a specific condition (e.g., payment method is 'upi')
select * from amazone_sales_l1
where payment_method = 'upi';  -- This filters out rows where payment_method is 'upi'

-- Example: This will return only the rows where the payment method is 'upi'.

-- Case 2: Aggregating data with SUM and GROUP BY (calculating total sales for each product)
select product_name, sum(total) as total_sales from amazone_sales_l1
group by product_name;  -- Groups by product_name and sums the 'total' for each product

-- Example: This will give the total sales for each product. For example, it might show 'baby milk' with a total sales value.

-- Case 3: Updating records (e.g., increasing the total by 10% for all 'credit_card' payments)
update amazone_sales_l1
set total = total * 1.1
where payment_method = 'credit_card';  -- This increases the total by 10% for all rows where payment_method is 'credit_card'

-- Example: This will update the 'total' field for all orders paid via 'credit_card', applying a 10% increase to the original amount.

/*
Summary of Case Examples:
Inserting Data: You can add multiple rows with different values for each column.

Selecting Data: Use SELECT to retrieve all or specific columns. You can limit the rows returned using LIMIT (MySQL) or TOP (SQL Server).

Sorting Data: Use ORDER BY to sort by one or more columns, and you can specify ascending or descending order.

Deleting Data: The DELETE command removes rows from the table based on conditions.

Dropping a Table: DROP TABLE removes the table and all its data permanently from the database.

Filtering Data: Use the WHERE clause to filter data based on specific conditions (e.g., payment method or order date).

Aggregation: The SUM() function with GROUP BY allows you to aggregate data, such as calculating total sales by product.

Updating Data: The UPDATE command modifies existing records based on conditions.
*/