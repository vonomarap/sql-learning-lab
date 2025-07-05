SELECT c.customer_id, c.customer_name, o.order_id
FROM customers AS c
INNER JOIN orders AS o
  ON o.customer_id = c.customer_id;

SELECT c.customer_id, c.customer_name, o.order_id
FROM customers AS c
LEFT JOIN orders AS o
  ON o.customer_id = c.customer_id
ORDER BY c.customer_id;
