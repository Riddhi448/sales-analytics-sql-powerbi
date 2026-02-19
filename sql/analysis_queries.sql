USE sales_analytics;

-- Total Sales
SELECT SUM(sales) AS total_sales FROM orders;

-- Total Profit
SELECT SUM(profit) AS total_profit FROM orders;

-- Profit Margin %
SELECT (SUM(profit) / SUM(sales)) * 100 AS profit_margin_percentage
FROM orders;

-- Total Orders
SELECT COUNT(DISTINCT order_id) AS total_orders FROM orders;

-- Sales by Sub-Category
SELECT p.sub_category, SUM(o.sales) AS total_sales
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY p.sub_category
ORDER BY total_sales DESC;

-- Profit by Category
SELECT p.category, SUM(o.profit) AS total_profit
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY p.category
ORDER BY total_profit DESC;

-- Region-wise Sales
SELECT c.region, SUM(o.sales) AS total_sales
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.region
ORDER BY total_sales DESC;

-- Sales Trend Over Time
SELECT order_date, SUM(sales) AS daily_sales
FROM orders
GROUP BY order_date
ORDER BY order_date;
