create database orders;
use orders;

# Created the same Table structure but lowest datatype size
/*create table orders(
		order_id int primary key,
        order_date date,
        ship_mode varchar(20),
        segment varchar(20),
        country	varchar(20),
        city varchar(20),
        state varchar(20),
        postal_code varchar(20),
        region varchar(20),
        category varchar(20),
        sub_category varchar(20),
        product_id varchar(50),
        quantity int,
        discount decimal(7,2),
        sale_price	decimal(7,2),
        profit decimal(7,2)
)*/


#Q1. Find top 10 highest revenue generating product
 select product_id,round(sum(sale_price),2) as sales
 from orders
 group by product_id
 order by sales desc
 limit 10;
 
 #Q2. Find top 5 highest selling products in each region
with cte as( 
			SELECT region, product_id, SUM(sale_price) AS sales
			FROM orders
			GROUP BY region, product_id
            ),
temp as(select *, 
	           dense_rank() OVER(partition by region order by sales desc) as rnk
	           from cte
	   )
select * from temp
where rnk<=5; 

#Q3. Find month over month comparision for 2022 and 2023 sales eg: jan 2022 vs jan 2023
with cte as (select 
				year(order_date) as order_year, 
				month(order_date) as order_month,
				round(sum(sale_price),2) as sales
		    from orders
		    group by order_year,order_month
		    order by order_year,order_month
            )
select order_month,
       SUM(CASE WHEN order_year = 2022 THEN sales ELSE 0 END) AS sales_2022,
	   SUM(CASE WHEN order_year = 2023 THEN sales ELSE 0 END) AS sales_2023
from cte
group by order_month;

#Q4. For each category which month had highest sales
with cte as (select category,
					month(order_date) as order_month,
                    year(order_date) as order_year,
					round(sum(sale_price),2) as sales 
			from orders
			group by category,order_month,order_year
            
			),
temp as( select cte.*,
					 row_number() over(partition by category order by sales desc ) as rnk
			  from cte 
            )
select * from temp
where rnk=1;  

#Q5. Which Sub category had highest growth by profit in 2023 compare to 2022
WITH cte AS (
    SELECT 
        sub_category,
        YEAR(order_date) AS order_year,
        ROUND(SUM(profit), 2) AS profit 
    FROM orders
    GROUP BY sub_category, order_year
),
temp AS (
    SELECT 
        sub_category,
        SUM(CASE WHEN order_year = 2022 THEN profit ELSE 0 END) AS year_2022,
        SUM(CASE WHEN order_year = 2023 THEN profit ELSE 0 END) AS year_2023
    FROM cte
    GROUP BY sub_category
)
SELECT 
    sub_category,
    year_2022,
    year_2023,
    CONCAT(
        ROUND(((year_2023 - year_2022) * 100 / year_2022), 2),
        "%"
    ) AS growth_by_profit_from_2022_to_2023
FROM temp
ORDER BY (year_2023 - year_2022) DESC
LIMIT 1;