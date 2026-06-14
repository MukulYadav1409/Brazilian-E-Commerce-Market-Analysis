USE orders;

SELECT * FROM orders LIMIT 3;
SELECT * FROM order_items LIMIT 3;
SELECT * FROM order_payments LIMIT 3;

SELECT * FROM products LIMIT 3;
SELECT * FROM category_translation LIMIT 3;

-- ALTER TABLE sellers ADD INDEX idx_seller_id (seller_id);
SELECT * FROM sellers LIMIT 3;

SELECT * FROM customers LIMIT 3;

SELECT * FROM order_reviews LIMIT 3;