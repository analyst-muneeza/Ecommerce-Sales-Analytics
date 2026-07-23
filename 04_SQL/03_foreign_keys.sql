-- ============================================================
-- Project Name : E-Commerce Sales Analysis
-- Database     : PostgreSQL
-- File         : 03_foreign_keys.sql
-- Description  : Add Foreign Key Constraints
-- ============================================================


-- ============================================================
-- Foreign Key 1 : Orders → Customers
-- ============================================================

ALTER TABLE orders
ADD CONSTRAINT fk_orders_customer
FOREIGN KEY (customer_id)
REFERENCES customers(customer_id);


-- ============================================================
-- Foreign Key 2 : Order Items → Orders
-- ============================================================

ALTER TABLE order_items
ADD CONSTRAINT fk_orderitems_order
FOREIGN KEY (order_id)
REFERENCES orders(order_id);


-- ============================================================
-- Foreign Key 3 : Order Items → Products
-- ============================================================

ALTER TABLE order_items
ADD CONSTRAINT fk_orderitems_product
FOREIGN KEY (product_id)
REFERENCES products(product_id);


-- ============================================================
-- Foreign Key 4 : Order Items → Sellers
-- ============================================================

ALTER TABLE order_items
ADD CONSTRAINT fk_orderitems_seller
FOREIGN KEY (seller_id)
REFERENCES sellers(seller_id);


-- ============================================================
-- Foreign Key 5 : Payments → Orders
-- ============================================================

ALTER TABLE payments
ADD CONSTRAINT fk_payments_order
FOREIGN KEY (order_id)
REFERENCES orders(order_id);


-- ============================================================
-- Foreign Key 6 : Reviews → Orders
-- ============================================================

ALTER TABLE reviews
ADD CONSTRAINT fk_reviews_order
FOREIGN KEY (order_id)
REFERENCES orders(order_id);


-- ============================================================
-- Foreign Key 7 : Products → Product Category
-- ============================================================

ALTER TABLE products
ADD CONSTRAINT fk_products_category
FOREIGN KEY (product_category_name)
REFERENCES product_category(product_category_name);