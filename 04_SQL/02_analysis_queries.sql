-- ============================================================
-- Project Name : E-Commerce Sales Analysis
-- Database     : PostgreSQL
-- File         : 02_analysis_queries.sql
-- Description  : Business Analysis Queries
-- ============================================================

-- ============================================================
-- Query 1 : Total Number of Orders
-- ============================================================

SELECT COUNT(*) AS total_orders
FROM orders;

-- ============================================================
-- Query 2 : Total Customers
-- ============================================================

SELECT COUNT(DISTINCT customer_id) AS total_customers
FROM customers;


-- ============================================================
-- Query 3 : Total Sellers
-- ============================================================

SELECT COUNT(*) AS total_sellers
FROM sellers;


-- ============================================================
-- Query 4 : Total Products
-- ============================================================

SELECT COUNT(*) AS total_products
FROM products;


-- ============================================================
-- Query 5 : Total Revenue Generated
-- ============================================================

SELECT
ROUND(SUM(payment_value),2) AS total_revenue
FROM payments;


-- ============================================================
-- Query 6 : Average Order Value
-- ============================================================

SELECT
ROUND(AVG(payment_value),2) AS average_order_value
FROM payments;


-- ============================================================
-- Query 7 : Orders by Status
-- ============================================================

SELECT
order_status,
COUNT(*) AS total_orders
FROM orders
GROUP BY order_status
ORDER BY total_orders DESC;


-- ============================================================
-- Query 8 : Top 10 Customers by Total Spending
-- ============================================================

SELECT
o.customer_id,
ROUND(SUM(p.payment_value),2) AS total_spent
FROM orders o
JOIN payments p
ON o.order_id = p.order_id
GROUP BY o.customer_id
ORDER BY total_spent DESC
LIMIT 10;


-- ============================================================
-- Query 9 : Top 10 Sellers by Number of Products Sold
-- ============================================================

SELECT
seller_id,
COUNT(*) AS products_sold
FROM order_items
GROUP BY seller_id
ORDER BY products_sold DESC
LIMIT 10;


-- ============================================================
-- Query 10 : Monthly Revenue Trend
-- ============================================================

SELECT
DATE_TRUNC('month',o.order_purchase_timestamp) AS month,
ROUND(SUM(p.payment_value),2) AS revenue
FROM orders o
JOIN payments p
ON o.order_id=p.order_id
GROUP BY month
ORDER BY month;


-- ============================================================
-- Query 11 : Top 10 Selling Products
-- ============================================================

SELECT
product_id,
COUNT(*) AS total_sales
FROM order_items
GROUP BY product_id
ORDER BY total_sales DESC
LIMIT 10;


-- ============================================================
-- Query 12 : Top 10 Product Categories
-- ============================================================

SELECT
pct.product_category_name_english,
COUNT(*) AS total_products_sold
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id
JOIN product_category pct
ON p.product_category_name = pct.product_category_name
GROUP BY pct.product_category_name_english
ORDER BY total_products_sold DESC
LIMIT 10;


-- ============================================================
-- Query 13 : Revenue by Product Category
-- ============================================================

SELECT
pct.product_category_name_english,
ROUND(SUM(py.payment_value),2) AS total_revenue
FROM orders o
JOIN payments py
ON o.order_id = py.order_id
JOIN order_items oi
ON o.order_id = oi.order_id
JOIN products p
ON oi.product_id = p.product_id
JOIN product_category pct
ON p.product_category_name = pct.product_category_name
GROUP BY pct.product_category_name_english
ORDER BY total_revenue DESC;


-- ============================================================
-- Query 14 : Average Review Score
-- ============================================================

SELECT
ROUND(AVG(review_score),2) AS average_review_score
FROM reviews;


-- ============================================================
-- Query 15 : Review Score Distribution
-- ============================================================

SELECT
review_score,
COUNT(*) AS total_reviews
FROM reviews
GROUP BY review_score
ORDER BY review_score;


-- ============================================================
-- Query 16 : Average Delivery Time (Days)
-- ============================================================

SELECT
ROUND(
AVG(order_delivered_customer_date::date -
order_purchase_timestamp::date),2
) AS avg_delivery_days
FROM orders
WHERE order_delivered_customer_date IS NOT NULL;


-- ============================================================
-- Query 17 : Late Delivered Orders
-- ============================================================

SELECT
COUNT(*) AS late_orders
FROM orders
WHERE order_delivered_customer_date >
order_estimated_delivery_date;


-- ============================================================
-- Query 18 : Top 10 Customer States
-- ============================================================

SELECT
customer_state,
COUNT(*) AS total_customers
FROM customers
GROUP BY customer_state
ORDER BY total_customers DESC
LIMIT 10;


-- ============================================================
-- Query 19 : Top 10 Seller States
-- ============================================================

SELECT
seller_state,
COUNT(*) AS total_sellers
FROM sellers
GROUP BY seller_state
ORDER BY total_sellers DESC
LIMIT 10;


-- ============================================================
-- Query 20 : Top 10 Customer Cities
-- ============================================================

SELECT
customer_city,
COUNT(*) AS total_customers
FROM customers
GROUP BY customer_city
ORDER BY total_customers DESC
LIMIT 10;


-- ============================================================
-- Query 21 : Orders by Payment Type
-- ============================================================

SELECT
payment_type,
COUNT(*) AS total_orders,
ROUND(SUM(payment_value),2) AS total_revenue
FROM payments
GROUP BY payment_type
ORDER BY total_revenue DESC;


-- ============================================================
-- Query 22 : Total Customers by Region
-- ============================================================

SELECT
region,
COUNT(*) AS total_customers
FROM customers
GROUP BY region
ORDER BY total_customers DESC;


-- ============================================================
-- Query 23 : Top 10 Customers using RANK()
-- ============================================================

SELECT
o.customer_id,
ROUND(SUM(p.payment_value),2) AS total_spent,
RANK() OVER(ORDER BY SUM(p.payment_value) DESC) AS customer_rank
FROM orders o
JOIN payments p
ON o.order_id = p.order_id
GROUP BY o.customer_id;


-- ============================================================
-- Query 24 : Top Sellers using DENSE_RANK()
-- ============================================================

SELECT
seller_id,
COUNT(*) AS total_orders,
DENSE_RANK() OVER(ORDER BY COUNT(*) DESC) AS seller_rank
FROM order_items
GROUP BY seller_id;


-- ============================================================
-- Query 25 : Row Number for Highest Payments
-- ============================================================

SELECT
order_id,
payment_value,
ROW_NUMBER() OVER(ORDER BY payment_value DESC) AS row_num
FROM payments;


-- ============================================================
-- Query 26 : Running Revenue by Purchase Date
-- ============================================================

SELECT

o.order_purchase_timestamp::date,

SUM(p.payment_value) AS daily_revenue,

SUM(SUM(p.payment_value))
OVER(
ORDER BY o.order_purchase_timestamp::date
) AS running_revenue

FROM orders o

JOIN payments p

ON o.order_id = p.order_id

GROUP BY o.order_purchase_timestamp::date

ORDER BY o.order_purchase_timestamp::date;


-- ============================================================
-- Query 27 : Average Payment by Payment Type
-- ============================================================

SELECT
payment_type,
ROUND(AVG(payment_value),2) AS average_payment
FROM payments
GROUP BY payment_type
ORDER BY average_payment DESC;


-- ============================================================
-- Query 28 : Customer Spending Category
-- ============================================================

SELECT
customer_id,
SUM(payment_value) AS total_spent,

CASE

WHEN SUM(payment_value)>=5000 THEN 'High Value'

WHEN SUM(payment_value)>=2000 THEN 'Medium Value'

ELSE 'Low Value'

END AS customer_segment

FROM orders o
JOIN payments p
ON o.order_id=p.order_id

GROUP BY customer_id;


-- ============================================================
-- Query 29 : Orders Above Average Payment
-- ============================================================

SELECT
order_id,
payment_value
FROM payments
WHERE payment_value >
(
SELECT AVG(payment_value)
FROM payments
);


-- ============================================================
-- Query 30: Top 10 Customers with Exactly One Order
-- ============================================================

SELECT
    customer_id,
    COUNT(order_id) AS total_orders
FROM orders
GROUP BY customer_id
HAVING COUNT(order_id) = 1
ORDER BY total_orders DESC
LIMIT 10;


-- ============================================================
-- Query 31 : Top 10 Cities by Revenue
-- ============================================================

SELECT
c.customer_city,
ROUND(SUM(p.payment_value),2) AS revenue

FROM customers c

JOIN orders o

ON c.customer_id=o.customer_id

JOIN payments p

ON o.order_id=p.order_id

GROUP BY customer_city

ORDER BY revenue DESC

LIMIT 10;


-- ============================================================
-- Query 32 : Freight Percentage
-- ============================================================

SELECT
ROUND(
SUM(freight_value)
/SUM(price)*100,2
) AS freight_percentage
FROM order_items;


-- ============================================================
-- Query 33 : Average Product Weight by Category
-- ============================================================

SELECT

pct.product_category_name_english,

ROUND(
AVG(product_weight_g),2
) AS average_weight

FROM products pr

JOIN product_category pct

ON pr.product_category_name =
pct.product_category_name

GROUP BY pct.product_category_name_english

ORDER BY average_weight DESC;


-- ============================================================
-- Query 34 : Top 10 States by Revenue
-- ============================================================

SELECT

c.customer_state,

ROUND(SUM(p.payment_value),2) AS total_revenue

FROM customers c

JOIN orders o

ON c.customer_id = o.customer_id

JOIN payments p

ON o.order_id = p.order_id

GROUP BY c.customer_state

ORDER BY total_revenue DESC

LIMIT 10;


-- ============================================================
-- Query 35 : Average Review Score by Payment Type
-- ============================================================

SELECT

p.payment_type,

ROUND(AVG(r.review_score),2) AS average_review_score

FROM payments p

JOIN reviews r

ON p.order_id = r.order_id

GROUP BY p.payment_type

ORDER BY average_review_score DESC;

