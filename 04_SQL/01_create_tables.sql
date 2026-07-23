-- ============================================================
-- Project Name : E-Commerce Sales Analysis
-- Database     : PostgreSQL
-- File         : 01_create_tables.sql
-- Author       : Muneeza
-- Description  : Creates all tables required for the
--                E-Commerce Sales Analysis project.
-- ============================================================


-- ============================================================
-- Create Orders Table
-- ============================================================

DROP TABLE IF EXISTS orders;

CREATE TABLE public.orders (
    order_id VARCHAR(50) PRIMARY KEY,
    customer_id VARCHAR(50),
    order_status VARCHAR(20),
    order_purchase_timestamp TIMESTAMP,
    order_approved_at TIMESTAMP,
    order_delivered_carrier_date TIMESTAMP,
    order_delivered_customer_date TIMESTAMP,
    order_estimated_delivery_date TIMESTAMP,
    delivery_days INT,
    late_delivery VARCHAR(20),
    approval_hours NUMERIC,
    order_year INT,
    order_month VARCHAR(20),
    order_quarter VARCHAR(10),
    order_weekday VARCHAR(20),
    order_hour INT,
    delivery_status VARCHAR(30)
);
-- ============================================================
-- Create Order Items Table
-- ============================================================

DROP TABLE IF EXISTS order_items;

CREATE TABLE order_items (
    order_id VARCHAR(50),
    order_item_id INT,
    product_id VARCHAR(50),
    seller_id VARCHAR(50),
    shipping_limit_date TIMESTAMP,
    price NUMERIC(10,2),
    freight_value NUMERIC(10,2),
    order_item_key VARCHAR(100),
    total_item_value NUMERIC(10,2),
    shipping_cost_percent VARCHAR(20),
    price_category VARCHAR(30),
    shipping_category VARCHAR(30)
);

-- ============================================================
-- Create Customers Table
-- ============================================================

DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
    customer_id VARCHAR(50) PRIMARY KEY,
    customer_unique_id VARCHAR(50),
    customer_zip_code_prefix INT,
    customer_city VARCHAR(100),
    customer_state VARCHAR(10),
    region VARCHAR(30)
);

-- ============================================================
-- Create Products Table
-- ============================================================

DROP TABLE IF EXISTS products;

CREATE TABLE products (
    product_id VARCHAR(50) PRIMARY KEY,
    product_category_name VARCHAR(100),
    product_name_lenght INT,
    product_description_lenght INT,
    product_photos_qty INT,
    product_weight_g INT,
    product_length_cm NUMERIC(10,2),
    product_height_cm NUMERIC(10,2),
    product_width_cm NUMERIC(10,2),
    product_volume NUMERIC(12,2),
    weight_category VARCHAR(30),
    product_size VARCHAR(30),
    photo_availability VARCHAR(20)
);

-- ============================================================
-- Create Product Category Table
-- ============================================================

DROP TABLE IF EXISTS product_category;

CREATE TABLE product_category (
    product_category_name VARCHAR(100) PRIMARY KEY,
    product_category_name_english VARCHAR(100)
);

-- ============================================================
-- Create Payments Table
-- ============================================================

DROP TABLE IF EXISTS payments;

CREATE TABLE payments (
    order_id VARCHAR(50),
    payment_sequential INT,
    payment_type VARCHAR(30),
    payment_installments INT,
    payment_value NUMERIC(10,2),
    payment_category VARCHAR(30),
    installment_type VARCHAR(30),
    PRIMARY KEY (order_id, payment_sequential)
);

-- ============================================================
-- Create Reviews Table
-- ============================================================

DROP TABLE IF EXISTS reviews;

CREATE TABLE reviews (
    review_id VARCHAR(50),
    order_id VARCHAR(50),
    review_score INT,
    review_comment_title TEXT,
    review_comment_message TEXT,
    review_creation_date TIMESTAMP,
    review_answer_timestamp TIMESTAMP,
    review_key VARCHAR(100),
    customer_satisfaction VARCHAR(30),
    response_time_days NUMERIC(10,2)
);

-- ============================================================
-- Create Sellers Table
-- ============================================================

DROP TABLE IF EXISTS sellers;

CREATE TABLE sellers (
    seller_id VARCHAR(50) PRIMARY KEY,
    seller_zip_code_prefix INT,
    seller_city VARCHAR(100),
    seller_state VARCHAR(10),
    seller_region VARCHAR(30)
);

-- ============================================================
-- Create Geolocation Table
-- ============================================================

DROP TABLE IF EXISTS geolocation;

CREATE TABLE geolocation (
    geolocation_zip_code_prefix INT,
    geolocation_lat NUMERIC(10,6),
    geolocation_lng NUMERIC(10,6),
    geolocation_city VARCHAR(100),
    geolocation_state VARCHAR(10),
    region VARCHAR(30)
);
