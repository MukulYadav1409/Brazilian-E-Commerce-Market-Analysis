USE orders;

SELECT 
	odr.review_score,
    ROUND(AVG(TIMESTAMPDIFF(DAY, order_purchase_timestamp, order_delivered_customer_date)), 1) as avg_actual_delivery_days,
    ROUND(AVG(TIMESTAMPDIFF(DAY, order_purchase_timestamp, order_estimated_delivery_date)), 1) as avg_estimated_delivery_days,
    ROUND(AVG(TIMESTAMPDIFF(DAY, order_delivered_customer_date, order_estimated_delivery_date)), 1) as avg_days_early_or_late,
    COUNT(CASE WHEN order_delivered_customer_date > order_estimated_delivery_date THEN 1 END) as late_orders,
    ROUND(AVG(CASE WHEN order_delivered_customer_date > order_estimated_delivery_date 
    THEN TIMESTAMPDIFF(DAY, order_estimated_delivery_date, order_delivered_customer_date) END), 1) as avg_days_late_for_late_orders,
    COUNT(*) as total_orders,
    ROUND(COUNT(CASE WHEN order_delivered_customer_date > order_estimated_delivery_date THEN 1 END) * 100.0 / COUNT(*), 2) as late_percentage
FROM orders o
JOIN order_reviews odr ON o.order_id = odr.order_id
WHERE order_status = 'delivered'
AND order_delivered_customer_date IS NOT NULL
AND order_estimated_delivery_date IS NOT NULL
GROUP BY odr.review_score;

-- Answer 10
-- There is a direct correlation between delivery performance and customer satisfaction on Olist. 
-- Orders with 1-star reviews have a 37.8% late delivery rate with an average delay of 12 days, 
-- compared to just 3% late rate and 4.3 days delay for 5-star orders. 
-- This confirms that delivery speed is the single biggest driver of negative reviews on the platform. Reducing late deliveries would 
-- directly improve customer satisfaction scores and retention.