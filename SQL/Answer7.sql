USE orders; 

CREATE TABLE sellers (
    seller_id VARCHAR(50),
    seller_zip_code_prefix VARCHAR(10),
    seller_city VARCHAR(50),
    seller_state VARCHAR(5)
);

LOAD DATA LOCAL INFILE 'C:/Users/mukul/Documents/Data Analytics/Projects/Brazilian E-commerce/olist_sellers_dataset.csv'
INTO TABLE sellers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

SELECT * FROM sellers;

ALTER TABLE sellers ADD INDEX idx_seller_id (seller_id);
ALTER TABLE order_items ADD INDEX idx_seller_id (seller_id);

SELECT
s.seller_state,
COUNT(DISTINCT s.seller_id) as total_seller_per_state,
COUNT(DISTINCT oi.order_id) as total_orders_per_state,
ROUND(AVG(oi.price), 2) as avg_revenue_per_state,
ROUND(SUM(oi.price), 2) as total_revenue_per_state
FROM order_items oi
JOIN orders o ON oi.order_id = o.order_id
JOIN sellers s ON oi.seller_id = s.seller_id
WHERE order_status = 'delivered'
GROUP BY s.seller_state
ORDER BY total_revenue_per_state DESC;	

-- Answer 7
-- SP - São Paulo dominates Olist's seller network with 1,769 sellers (57% of total) generating R$8.5M in revenue — 66% of total platform revenue. 
-- This extreme geographic concentration creates business risk: any disruption in SP directly impacts two-thirds of revenue. 
-- States like Bahia show high average order values (R$445) with only 18 sellers — indicating strong demand but severely undersupplied markets. 
-- Amazon (AM), Pará (PA), and Piauí (PI) each have only 1 seller despite being large states — representing untapped expansion opportunities. 
-- Olist should prioritize seller acquisition campaigns in BA, RJ, and MG where demand signals are strong but seller density remains low.