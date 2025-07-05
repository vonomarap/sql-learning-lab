SELECT c.customer_id, c.customer_name
FROM customers AS c
WHERE EXISTS (
  SELECT 1
  FROM orders AS o
  WHERE o.customer_id = c.customer_id
);

SELECT p.product_id, p.product_name
FROM products AS p
WHERE p.category_id IN (
  SELECT category_id
  FROM categories
  WHERE is_active = 1
);
