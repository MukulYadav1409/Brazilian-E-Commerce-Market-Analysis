USE orders;

-- REVENUE by Product Category

CREATE TABLE products (
    product_id VARCHAR(50),
    product_category_name VARCHAR(100),
    product_name_length INT,
    product_description_length INT,
    product_photos_qty INT,
    product_weight_g INT,
    product_length_cm INT,
    product_height_cm INT,
    product_width_cm INT
);

LOAD DATA LOCAL INFILE 'C:/Users/mukul/Documents/Data Analytics/Projects/Brazilian E-commerce/olist_products_dataset.csv'
INTO TABLE products
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 LINES;


CREATE TABLE category_translation (
    product_category_name VARCHAR(100),
    product_category_name_english VARCHAR(100)
);

LOAD DATA LOCAL INFILE 'C:/Users/mukul/Documents/Data Analytics/Projects/Brazilian E-commerce/product_category_name_translation.csv'
INTO TABLE category_translation
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

SET SESSION wait_timeout = 600;
SET SESSION interactive_timeout = 600;
SET SESSION net_read_timeout = 600;
SET SESSION net_write_timeout = 600;

ALTER TABLE order_items ADD INDEX idx_product_id (product_id);
ALTER TABLE order_items ADD INDEX idx_order_id (order_id);
ALTER TABLE products ADD INDEX idx_product_id (product_id);
ALTER TABLE orders ADD INDEX idx_order_id (order_id);
ALTER TABLE category_translation ADD INDEX idx_category (product_category_name);

-- Query with 4 Table joins and every info in it

SELECT 
p.product_category_name,
ct.product_category_name_english,
COUNT(oi.order_id) as total_orders,
ROUND(SUM(price), 2) as category_wise_revenue,
ROUND(AVG(price), 2) as category_wise_avg
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN orders o ON oi.order_id = o.order_id
JOIN category_translation ct ON p.product_category_name = ct.product_category_name
WHERE order_status = 'delivered'
GROUP BY p.product_category_name, ct.product_category_name_english
ORDER BY category_wise_revenue DESC
LIMIT 15;

-- Query with 3 table join and not having the english names of product category

SELECT 
    p.product_category_name,
    COUNT(oi.order_id) as total_orders,
    ROUND(SUM(price), 2) as category_wise_revenue,
    ROUND(AVG(price), 2) as category_wise_avg
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN orders o ON oi.order_id = o.order_id
WHERE order_status = 'delivered'
GROUP BY p.product_category_name
ORDER BY category_wise_revenue DESC
LIMIT 15;

-- Health & Beauty dominates Olist revenue at R$1.23M despite not having the highest average order value. 
-- Watches & Gifts shows the highest spend per transaction at R$199 — indicating a premium segment with growth potential. 
-- Bed Bath Table leads in order volume but ranks #3 in revenue due to low average pricing, suggesting a high-frequency 
-- low-margin category best suited for customer retention rather than revenue growth.

