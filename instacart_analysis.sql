
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS order_products;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS aisles;


-- Orders table stores customer order-level information
CREATE TABLE orders (
    order_id INT,
    user_id INT,
    order_dow INT,
    order_hour_of_day INT,
    days_since_prior_order FLOAT,
    basket_size FLOAT,
    day_type VARCHAR(10)
);

-- Order products table stores products purchased in each order
CREATE TABLE order_products (
    order_id INT,
    product_id INT,
    reordered INT
);

-- Products table stores product details
CREATE TABLE products (
    product_id INT,
    product_name TEXT,
    aisle_id INT,
    department_id INT
);

-- Departments table stores department names
CREATE TABLE departments (
    department_id INT,
    department TEXT
);

-- Aisles table stores aisle names
CREATE TABLE aisles (
    aisle_id INT,
    aisle TEXT
);


-- Total number of orders
SELECT COUNT(*) AS total_orders
FROM orders;

-- Total number of product purchase records
SELECT COUNT(*) AS total_product_orders
FROM order_products;

-- Total number of unique products
SELECT COUNT(DISTINCT product_id) AS total_products
FROM products;

-- Total number of departments
SELECT COUNT(*) AS total_departments
FROM departments;

-- Total number of aisles
SELECT COUNT(*) AS total_aisles
FROM aisles;


-- =====================================================
-- 4. KPI / METRIC QUERIES
-- =====================================================

-- Average number of products purchased per order
SELECT ROUND(AVG(basket_size)::numeric, 2) AS avg_basket_size
FROM orders;

-- Percentage of reordered products
SELECT ROUND((100.0 * SUM(reordered) / COUNT(*))::numeric, 2) AS reorder_rate_percent
FROM order_products;

-- Average number of days between customer orders
SELECT ROUND(AVG(days_since_prior_order)::numeric, 2) AS avg_days_between_orders
FROM orders;

-- Average number of orders placed per user
SELECT ROUND((COUNT(*) * 1.0 / COUNT(DISTINCT user_id))::numeric, 2) AS avg_orders_per_user
FROM orders;


-- Total orders by day of week
SELECT 
    order_dow,
    COUNT(*) AS total_orders
FROM orders
GROUP BY order_dow
ORDER BY order_dow;

-- Total orders by hour of day
SELECT 
    order_hour_of_day,
    COUNT(*) AS total_orders
FROM orders
GROUP BY order_hour_of_day
ORDER BY order_hour_of_day;

-- Total orders by day type (Weekday vs Weekend)
SELECT 
    day_type,
    COUNT(*) AS total_orders
FROM orders
GROUP BY day_type;

-- Average basket size by day type
SELECT 
    day_type,
    ROUND(AVG(basket_size)::numeric, 2) AS avg_basket_size
FROM orders
GROUP BY day_type;

-- Reorder rate by department
SELECT 
    d.department,
    ROUND((100.0 * SUM(op.reordered) / COUNT(*))::numeric, 2) AS reorder_rate
FROM order_products op
JOIN products p
    ON op.product_id = p.product_id
JOIN departments d
    ON p.department_id = d.department_id
GROUP BY d.department
ORDER BY reorder_rate DESC;


-- 6. VISUALIZATION QUERIES

-- Top 10 most ordered products
SELECT 
    p.product_name,
    COUNT(*) AS total_orders
FROM order_products op
JOIN products p
    ON op.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_orders DESC
LIMIT 10;

-- Top departments by total orders
SELECT 
    d.department,
    COUNT(*) AS total_orders
FROM order_products op
JOIN products p
    ON op.product_id = p.product_id
JOIN departments d
    ON p.department_id = d.department_id
GROUP BY d.department
ORDER BY total_orders DESC;

-- Orders by hour of day
SELECT 
    order_hour_of_day,
    COUNT(*) AS total_orders
FROM orders
GROUP BY order_hour_of_day
ORDER BY order_hour_of_day;

-- Weekend vs Weekday orders
SELECT 
    day_type,
    COUNT(*) AS total_orders
FROM orders
GROUP BY day_type
ORDER BY total_orders DESC;

-- Reorder rate by department
SELECT 
    d.department,
    ROUND((100.0 * SUM(op.reordered) / COUNT(*))::numeric, 2) AS reorder_rate
FROM order_products op
JOIN products p
    ON op.product_id = p.product_id
JOIN departments d
    ON p.department_id = d.department_id
GROUP BY d.department
ORDER BY reorder_rate DESC;