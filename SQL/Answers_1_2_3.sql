USE orders;

-- SELECT * FROM orders LIMIT 3;
-- SELECT * FROM order_items LIMIT 3;
-- SELECT * FROM order_payments LIMIT 3;

SELECT order_status, COUNT(*) as count, ROUND( COUNT(*) * 100 / (SELECT COUNT(*) FROM orders), 2) as percentage
FROM orders
GROUP BY order_status
ORDER BY count DESC;

-- "97% of Olist orders are successfully delivered. However, 0.6% are cancelled and 0.6% are unavailable — indicating potential inventory 
-- gaps and payment friction that could be addressed to improve overall fulfillment rate."

SELECT ROUND(SUM(price), 2) AS total_revenue,
ROUND(AVG(price), 2) AS average_order_value,
ROUND(MIN(price), 2) AS min_price,
ROUND(MAX(price), 2) AS max_price,
COUNT(*) AS total_items_sold
FROM order_items;

-- Standard deviation could be high as huge diff b/w avg and max_price 
-- could be a chance that some luxury items are keeping the average up
-- total item sold are around 112k and orders were around 100k, it means 1.12 items per order, it means one customer is ordering
-- only one item, which is low, we have to focus on multiple orders added to kart

SELECT DATE_FORMAT(order_purchase_timestamp, "%Y-%m") as month,
COUNT(*) as total_orders,
ROUND(SUM(oi.price), 2) as monthly_revenue
FROM orders o
JOIN order_items oi ON oi.order_id = o.order_id
WHERE order_status = 'delivered'
GROUP BY  month
ORDER BY month ASC;

-- Olist grew from 3 orders in September 2016 to nearly 8,000 orders per month by early 2018 — a 2,600% increase. 
-- November 2017 shows a clear Black Friday spike with revenue approaching R$1 million in a single month. Growth stabilized at 7,000-8,000 
-- monthly orders in 2018, suggesting market maturation.






