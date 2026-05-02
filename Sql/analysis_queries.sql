USE Pizza
SELECT * FROM pizza_sales;

SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales;

SELECT 
    SUM(total_price) AS total_revenue,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(total_price) / COUNT(DISTINCT order_id), 2) AS AOV
FROM pizza_sales;

SELECT SUM(quantity) AS Total_Pizzas_Sold FROM pizza_sales;

SELECT COUNT(DISTINCT order_id) AS total_orders FROM pizza_sales;

SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) AS Average_Pizzas_Per_Order FROM pizza_sales;

SELECT DATENAME(DW,order_date) AS order_day , COUNT(DISTINCT order_id) AS total_orders 
FROM pizza_sales
GROUP BY DATENAME(DW,order_date)
ORDER BY total_orders DESC;

SELECT DATEPART(HOUR,order_time) AS Hourly_orders, COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales
GROUP BY DATEPART(HOUR,order_time)
ORDER BY Hourly_orders;

SELECT pizza_category,SUM(total_price) AS Category_Revenue,
ROUND(SUM(total_price) * 100/ SUM(SUM(total_price)) OVER(),2) AS Sales_Percentage
FROM pizza_sales
GROUP BY pizza_category;

SELECT pizza_size,SUM(total_price) AS Size_Revenue,
ROUND(SUM(total_price) * 100/ SUM(SUM(total_price)) OVER(),2) AS Sales_Percentage
FROM pizza_sales
GROUP BY pizza_size;

SELECT pizza_category , SUM(quantity) AS Total_Quantity_Sold
FROM pizza_sales
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC;

SELECT TOP  5 pizza_name ,SUM(quantity) AS Total_Quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity DESC;

SELECT TOP  5 pizza_name ,SUM(quantity) AS Total_Quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity ASC;

SELECT pizza_category , ROUND(SUM(total_price),2) AS Revenue 
FROM pizza_sales
GROUP BY pizza_category;

SELECT TOP 5 order_id,ROUND(SUM(total_price),2) AS order_value
FROM pizza_sales
GROUP BY order_id
ORDER BY order_value DESC;
