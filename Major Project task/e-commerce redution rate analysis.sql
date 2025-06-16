CREATE DATABASE ecommercereturn;

SHOW DATABASES;

CREATE TABLE cleaned_ecommerce_data (
    customer_id INT,
    purchase_date TIMESTAMP,
    product_category VARCHAR(100),
    product_price INT,
    quantity INT,
    total_purchase_amount INT,
    payment_method VARCHAR(50),
    customer_age INT,
    returns FLOAT,
    gender VARCHAR(10),
    churn INT,
    purchase_year INT,
    purchase_month INT
);

INSERT INTO cleaned_ecommerce_data VALUES
(46251, '2020-09-08 09:38:32', 'Electronics', 12, 3, 36, 'Credit Card', 37, 0.0, 'Male', 0, 2020, 9),
(46251, '2022-03-05 12:56:35', 'Home', 468, 4, 1872, 'PayPal', 37, 0.0, 'Male', 0, 2022, 3),
(46251, '2022-05-23 18:18:01', 'Home', 288, 2, 576, 'PayPal', 37, 0.0, 'Male', 0, 2022, 5),
(46251, '2020-11-12 13:13:29', 'Clothing', 196, 1, 196, 'PayPal', 37, 0.0, 'Male', 0, 2020, 11),
(13593, '2020-11-27 17:55:11', 'Home', 449, 1, 449, 'Credit Card', 49, 0.0, 'Female', 1, 2020, 11);

SELECT 
    product_category, 
    SUM(total_purchase_amount) AS total_sales
FROM cleaned_ecommerce_data
GROUP BY product_category
ORDER BY total_sales DESC;

SELECT 
    gender,
    COUNT(*) AS total_customers,
    SUM(churn) AS churned_customers,
    ROUND(SUM(churn) * 100.0 / COUNT(*), 2) AS churn_rate_percent
FROM cleaned_ecommerce_data
GROUP BY gender;

SELECT 
    purchase_year,
    purchase_month,
    SUM(total_purchase_amount) AS monthly_sales
FROM cleaned_ecommerce_data
GROUP BY purchase_year, purchase_month
ORDER BY purchase_year, purchase_month;

