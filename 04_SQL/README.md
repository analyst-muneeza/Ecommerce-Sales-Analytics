# PostgreSQL E-Commerce Sales Analysis

PostgreSQL was used to analyze the cleaned E-Commerce dataset and answer 35 business questions related to sales, customers, products, sellers, payments, reviews, and delivery performance.

## Database Tables

The analysis was performed using multiple related tables:

- customers
- orders
- order_items
- payments
- products
- product_category
- reviews
- sellers

## Key Analysis Areas

- Total orders, customers, sellers, and products
- Total revenue and average order value
- Monthly revenue trends
- Order status analysis
- Top customers by spending
- Top sellers by products sold
- Top-selling products and product categories
- Revenue by product category
- Customer and seller location analysis
- Payment type analysis
- Review score analysis
- Delivery time and late-delivery analysis
- Freight cost analysis
- Customer segmentation
- Running revenue analysis

## SQL Concepts Used

- SELECT, WHERE, GROUP BY, HAVING
- ORDER BY and LIMIT
- INNER JOIN
- Aggregate Functions: SUM, COUNT, AVG
- CASE WHEN
- Subqueries
- Date Functions
- Window Functions
- RANK()
- DENSE_RANK()
- ROW_NUMBER()
- Running Totals

## Advanced Analysis

The project also includes:

- Customer ranking based on spending
- Seller ranking using DENSE_RANK
- Highest payment ranking using ROW_NUMBER
- Running revenue by purchase date
- Customer spending segmentation
- Orders above average payment using a subquery

## SQL File

`02_analysis_queries.sql` contains all 35 business analysis queries used in this project.

## Dataset

The cleaned dataset prepared during the Excel data-cleaning stage was imported into PostgreSQL and used for the SQL analysis.
