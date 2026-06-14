USE orders;

SELECT 
    p.product_category_name,
    ct.product_category_name_english,
    ROUND(AVG(oi.freight_value), 2) as avg_shipping_value,
    ROUND(AVG(oi.price), 2) as category_wise_avg,
    ROUND(AVG(oi.freight_value) * 100 / AVG(oi.price), 2) as freight_price_ratio
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN orders o ON oi.order_id = o.order_id
JOIN category_translation ct ON p.product_category_name = ct.product_category_name
WHERE order_status = 'delivered'
GROUP BY p.product_category_name, ct.product_category_name_english
ORDER BY category_wise_avg DESC
LIMIT 15;

-- Answer 5
-- Computers lead as the highest ticket category on Olist with an average order value of R$1,099, followed by Small Appliances (Home Oven & Coffee) 
-- at R$638 and Home Appliances at R$467. Musical Instruments and Small Appliances round out the top 5 premium categories 
-- averaging R$283 and R$278 respectively. Notably, all top categories by ticket size are electronics or home appliances — 
-- indicating that Brazilian e-commerce customers are willing to spend significantly on technology and home equipment. Watches & Gifts 
-- at R$199 stands out as the only non-electronics category in the top 10, suggesting strong demand for premium gifting on the platform.

-- Answer 6
-- 5 product categories show freight-to-price ratios above 35% — indicating potential margin erosion or loss-making orders. 
-- Olist should consider minimum order value thresholds for high-freight categories, negotiate better logistics rates for bulky items, 
-- or introduce freight surcharges for flowers and home comfort products where shipping costs exceed 44-54% of product value.