CREATE DATABASE onlinesales;

SHOW DATABASES;

USE onlinesales;

CREATE TABLE Products(
	product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10, 2)
);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    region VARCHAR(50)
);

CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    sale_date DATE,
    product_id INT,
    customer_id INT,
    quantity INT,
    price DECIMAL(10, 2),
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO products (product_id, product_name, category, price) VALUES
(1, 'Laptop', 'Electronics', 800.00),
(2, 'Smartphone', 'Electronics', 600.00),
(3, 'Desk Chair', 'Furniture', 150.00),
(4, 'Pen Pack', 'Stationery', 10.00);

SELECT * FROM products;

INSERT INTO customers (customer_id, customer_name, region) VALUES
(1, 'Alice', 'North'),
(2, 'Bob', 'South'),
(3, 'Charlie', 'East'),
(4, 'Diana', 'West');

SELECT * FROM customers;

INSERT INTO sales (sale_id, sale_date, product_id, customer_id, quantity, price) VALUES
(1, '2024-01-10', 1, 1, 2, 800.00),
(2, '2024-01-15', 2, 2, 1, 600.00),
(3, '2024-02-05', 3, 3, 4, 150.00),
(4, '2024-03-20', 4, 4, 10, 10.00),
(5, '2024-04-01', 1, 1, 1, 800.00),
(6, '2024-04-10', 3, 2, 2, 150.00),
(7, '2024-05-15', 2, 3, 1, 600.00),
(8, '2024-05-20', 4, 4, 20, 10.00);

SELECT * FROM sales;

# Monthly Revenue
SELECT 
  DATE_FORMAT(sale_date, '%Y-%m') AS month,
  SUM(quantity * price) AS revenue
FROM sales
GROUP BY month;

# Customer Order Count and Revenue
SELECT 
  customer_id,
  COUNT(*) AS total_orders,
  SUM(quantity * price) AS total_revenue
FROM sales
GROUP BY customer_id;

# Product Revenue by Category
SELECT 
  p.category,
  s.product_id,
  SUM(s.quantity * s.price) AS revenue
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.category, s.product_id;

# Quarterly Revenue
SELECT 
  QUARTER(sale_date) AS quarter,
  YEAR(sale_date) AS year,
  SUM(quantity * price) AS revenue
FROM sales
GROUP BY year, quarter
ORDER BY year, quarter;

# Revenue This Year vs Last Year 
SELECT 
  MONTH(sale_date) AS month,
  YEAR(sale_date) AS year,
  SUM(quantity * price) AS revenue
FROM sales
WHERE YEAR(sale_date) IN (YEAR(CURDATE()), YEAR(CURDATE()) - 1)
GROUP BY year, month
ORDER BY year, month;

# Top 5 Customers by Total Revenue
SELECT 
  customer_id,
  SUM(quantity * price) AS total_revenue
FROM sales
GROUP BY customer_id
ORDER BY total_revenue DESC
LIMIT 5;

# Total Monthly Revenue
SELECT 
  DATE_FORMAT(sale_date, '%Y-%m') AS month,
  SUM(quantity * price) AS revenue
FROM sales
GROUP BY month;

# Monthly Revenue per Product
SELECT 
  DATE_FORMAT(sale_date, '%Y-%m') AS month,
  product_id,
  SUM(quantity * price) AS revenue
FROM sales
GROUP BY month, product_id;
