-- KPI Requirements

-- Total Revenue
 select round(sum(total_price),2) as total_price 
 from dominos_sales; 
 --817680.22

 --Average Order value
 select round(sum(total_price)/count(distinct order_id),2) as avg_order_value
 from dominos_sales
 --38.20

 -- Total_pizzas_sold
 select sum(quantity) as total_Pizzas_sold
 from dominos_sales
 --49574

 --Total_orders
 select count(distinct order_id) as Total_orders
 from dominos_sales
 --21350

 --Average_pizzas_per_order
 select round(sum(quantity)/count(distinct order_id),2) as Avg_pizzas_per_order
 from dominos_sales
 --2.32

 -- Daily trends for total orders
 select datename(DW, order_date) as Order_day, count(disticnt order_id) as total_orders
 from dominos_Sales
 group by datename(DW, order_date)
 order by order_day;
 
 --Monthly trends for total orders
 select datename(Month, order_date) as monthly_orders, count(disticnt order_id) as total_orders
 from dominos_Sales
 group by datename(Month, order_date) as monthly_orders,
 order by monthly_orders;

 --Percentage of sales by pizza category
 select category, round(sum(total_price),2) as total_revenue, 
 round(sum(total_price)*100/(select sum(total_price) from dominos_sales),2) as PCT
 from dominos_sales 
 group by category

 --Percentage of sales by pizza_size
 select Pizza_size, round(sum(total_price),2) as total_revenue, 
 round(sum(total_price)*100/(select sum(total_price) from dominos_sales),2) as PCT
 from dominos_sales 
 group by pizza_size

 --Pizzas sold by pizza category
 select pizza_category, sum(quantity) as pizza_sales
 from dominos_sales
 group by pizza_category
 order by pizza_sales desc;
 
 --Top 5 best sellers by revenue, total_quantity, total_orders
 select top 5 pizza_name,  sum(total_prices) as revenue
 from domions_sales
 group by pizza_name
 order by revenue desc;

 select top 5 pizza_name, sum(quantity) as total_quantity
 from domions_sales
 group by pizza_name
 order by total_quantity desc;

 select top 5 pizza_name, count(distinct order_id)  as total_orders
 from domions_sales
 group by pizza_name
 order by total_orders desc;

 -- Bottom 5 best sellers by revenue, total_quantity, total_orders
 elect top 5 pizza_name,  sum(total_prices) as revenue
 from domions_sales
 group by pizza_name
 order by revenue asc;

 select top 5 pizza_name, sum(quantity) as total_quantity
 from domions_sales
 group by pizza_name
 order by total_quantity asc;

 select top 5 pizza_name, count(distinct order_id)  as total_orders
 from domions_sales
 group by pizza_name
 order by total_orders ;