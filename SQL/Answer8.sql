USE orders;

SELECT 
c.customer_state,
c.customer_city,
ROUND(SUM(oi.price), 2) as revenue_city_wise,
COUNT(c.customer_unique_id) as customers_city_wise
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN customers c ON o.customer_id = c.customer_id
WHERE order_status = 'delivered'
GROUP BY c.customer_state, c.customer_city
ORDER BY customers_city_wise DESC
LIMIT 15;

-- ANSWER 8 
-- São Paulo dominates customer geography with 7 of the top 15 cities and 17,400 customers in the city alone. Salvador, 
-- Bahia shows 1,358 active customers despite only 18 local sellers — confirming strong unmet demand. Rio de Janeiro underperforms 
-- relative to its population size, suggesting either low seller density or underdeveloped marketing presence in the city.