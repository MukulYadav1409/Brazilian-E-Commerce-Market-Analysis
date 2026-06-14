USE orders;

SELECT 
review_score,
COUNT(order_id) as review_wise_orders,
ROUND(COUNT(order_id) * 100 / (SELECT COUNT(*) FROM order_reviews), 2) as percent_orders
FROM order_reviews
GROUP BY review_score
ORDER BY review_score DESC;

-- ANSWER 11
-- 57.78% of Olist customers give 5-star reviews indicating strong overall satisfaction. 
-- However, 11.51% give 1-star reviews — the single most damaging rating — which is disproportionately high compared to 2-star (3.18%) 
-- and 3-star (8.24%) reviews. The spike at 1-star suggests a subset of customers are having severely negative experiences, 
-- not just mildly disappointing ones. Given the correlation established in Q10, late deliveries are the most likely driver of 
-- this 1-star concentration.