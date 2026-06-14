USE orders;

-- SELECT 
-- order_delivered_customer_date,
-- order_estimated_delivery_date,
-- TIMESTAMPDIFF(DAY, order_estimated_delivery_date, order_delivered_customer_date)
-- FROM orders;

SELECT 
    ROUND(AVG(TIMESTAMPDIFF(DAY, order_purchase_timestamp, order_delivered_customer_date)), 1) as avg_actual_delivery_days,
    ROUND(AVG(TIMESTAMPDIFF(DAY, order_purchase_timestamp, order_estimated_delivery_date)), 1) as avg_estimated_delivery_days,
    ROUND(AVG(TIMESTAMPDIFF(DAY, order_delivered_customer_date, order_estimated_delivery_date)), 1) as avg_days_early_or_late,
    COUNT(CASE WHEN order_delivered_customer_date > order_estimated_delivery_date THEN 1 END) as late_orders,
    ROUND(AVG(CASE WHEN order_delivered_customer_date > order_estimated_delivery_date 
    THEN TIMESTAMPDIFF(DAY, order_estimated_delivery_date, order_delivered_customer_date) END), 1) as avg_days_late_for_late_orders,
    COUNT(*) as total_orders,
    ROUND(COUNT(CASE WHEN order_delivered_customer_date > order_estimated_delivery_date THEN 1 END) * 100.0 / COUNT(*), 2) as late_percentage
FROM orders
WHERE order_status = 'delivered'
AND order_delivered_customer_date IS NOT NULL
AND order_estimated_delivery_date IS NOT NULL;

-- Answer 9
-- Olist delivers orders in 12.1 days on average against a promised 23.4 days — consistently 11 days ahead of estimates. 
-- However, 8.11% of orders (7,826) miss even this conservative deadline, arriving an average of 8.9 days late. 
-- This suggests a two-tier delivery problem: most logistics partners over-perform, but a subset consistently fail. 
-- Olist should identify which sellers or regions are driving late deliveries and enforce stricter logistics SLAs.