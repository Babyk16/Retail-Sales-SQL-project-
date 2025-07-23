
CREATE DATABASE p1_retail_db;

USE p1_retail_db;

CREATE table retail_sales(
    transactions_id INT PRIMARY KEY,
    sale_date DATE,	
    sale_time TIME,
    customer_id INT,	
    gender VARCHAR(10),
    age INT,
    category VARCHAR(35),
    quantity INT,
    price_per_unit FLOAT,	
    cogs FLOAT,
    total_sale FLOAT
    );

    SELECT * FROM sales_retail;
    
    
SELECT 
COUNT(DISTINCT customer_id)
FROM sales_retail;
     
     
SELECT * FROM sales_retail
WHERE sale_date IS NULL
or
sale_time IS NULL 
or
customer_id IS NULL
or 
age IS NULL
or
category IS NULL
or
quantiy IS NULL
or 
price_per_unit IS NULL
or
cogs IS NULL
or
total_sale IS NULL;

#Q.1 Write a sql query to retrive all the columns for sales mad on '2022-11-05'

SELECT *
FROM sales_retail
WHERE DATE (sale_date) = '2022-11-05';

#2. **Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022**:
 
 SELECT * FROM sales_retail
 WHERE 
     category = "clothing"
     AND 
     sale_date>= '2022-11-01'
     AND
     sale_date < '2022-12-01'
     AND
     quantiy >= 4;
      USE p1_retail_db;
     #3. **Write a SQL query to calculate the total sales (total_sale) for each category.**:
     
SELECT 
     category,
     SUM(total_sale) as net_sales,
     count(*) as total_orders
     FROM sales_retail
     GROUP BY category;
     
     
#4**Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.**:
     
SELECT 
avg(age) as avg_age
FROM sales_retail
WHERE category = "beauty";

# 5**Write a SQL query to find all transactions where the total_sale is greater than 1000.**:

SELECT *
FROM sales_retail
WHERE total_sale >1000;

#6 **Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.**:

SELECT 
category,
gender,
count(*) AS total_trans
FROM sales_retail
GROUP BY 
category,
gender;

#8. **Write a SQL query to find the top 5 customers based on the highest total sales **:
  
SELECT
ï»¿transactions_id ,
SUM( total_sale) AS total_sales
FROM
sales_retail
GROUP BY 
ï»¿transactions_id
ORDER BY
total_sales DESC
LIMIT 5;  
 
#9. **Write a SQL query to find the number of unique customers who purchased items from each category.**:

    SELECT 
  category, 
  COUNT(distinct ï»¿transactions_id) AS cnt_unique
  FROM sales_retail
  group by category ;

#10.**Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17)

SELECT 
  CASE 
   WHEN HOUR ( sale_time) <12 THEN 'Morning'
   WHEN HOUR( sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
   ELSE 'Evening'
 END AS shift,
 COUNT(*) AS number_of_orders
FROM 
sales_retail
GROUP BY 
shift;
 
 #7. **Write a SQL query to calculate the average sale for each month. Find out best selling month in each year**:
 
 SELECT * FROM
 (
 
 SELECT 
  year(sale_date), 
  month (sale_date),
  avg(total_sale) as avg_sales ,
  rank() over (partition by year(sale_date) order by avg(total_sale) desc) as rank1
 FROM sales_retail
 group by 1,2
 ) as t1
 where rank1 =1 ;
 #order by 1,3 desc;
 # avg of the total sales by year 

 