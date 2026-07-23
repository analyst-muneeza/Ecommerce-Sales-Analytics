-- ============================================================
-- Project Name : E-Commerce Sales Analysis
-- Database     : PostgreSQL
-- File         : 04_check_foreign_keys.sql
-- Description  : Verify Foreign Key Relationships
-- ============================================================


-- ============================================================
-- Check 1 : Orders → Customers
-- Expected Output : 0
-- ============================================================

SELECT COUNT(*) AS missing_customers
FROM orders o
LEFT JOIN customers c
ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL;


-- ============================================================
-- Check 2 : Order Items → Orders
-- Expected Output : 0
-- ============================================================

SELECT COUNT(*) AS missing_orders
FROM order_items oi
LEFT JOIN orders o
ON oi.order_id = o.order_id
WHERE o.order_id IS NULL;


-- ============================================================
-- Check 3 : Order Items → Products
-- Expected Output : 0
-- ============================================================

SELECT COUNT(*) AS missing_products
FROM order_items oi
LEFT JOIN products p
ON oi.product_id = p.product_id
WHERE p.product_id IS NULL;


-- ============================================================
-- Check 4 : Order Items → Sellers
-- Expected Output : 0
-- ============================================================

SELECT COUNT(*) AS missing_sellers
FROM order_items oi
LEFT JOIN sellers s
ON oi.seller_id = s.seller_id
WHERE s.seller_id IS NULL;


-- ============================================================
-- Check 5 : Payments → Orders
-- Expected Output : 0
-- ============================================================

SELECT COUNT(*) AS missing_payment_orders
FROM payments p
LEFT JOIN orders o
ON p.order_id = o.order_id
WHERE o.order_id IS NULL;


-- ============================================================
-- Check 6 : Reviews → Orders
-- Expected Output : 0
-- ============================================================

SELECT COUNT(*) AS missing_review_orders
FROM reviews r
LEFT JOIN orders o
ON r.order_id = o.order_id
WHERE o.order_id IS NULL;


-- ============================================================
-- Check 7 : Products → Product Category
-- Expected Output : 0
-- ============================================================

SELECT COUNT(*) AS missing_categories
FROM products p
LEFT JOIN product_category pc
ON p.product_category_name = pc.product_category_name
WHERE pc.product_category_name IS NULL;