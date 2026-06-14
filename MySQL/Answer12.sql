USE orders;

SELECT 
p.product_category_name,
ROUND(AVG(odr.review_score), 2) as avg_review_category_wise
FROM order_items oi
JOIN order_reviews odr ON oi.order_id = odr.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_category_name
ORDER BY avg_review_category_wise ;

-- ANSWER 12
-- Security services and diapers rank as the lowest rated categories at 2.50 and 3.26 stars respectively. 
-- The pattern across bottom-rated categories suggests two root causes: time-sensitive products (diapers, kitchen appliances) 
-- where late delivery causes disproportionate frustration, and bulky furniture items already identified as having 
-- high freight-to-price ratios and delivery complexity. Olist should prioritize same-day or next-day delivery SLAs 
-- specifically for time-sensitive categories.