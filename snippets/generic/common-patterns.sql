SELECT *
FROM orders
WHERE order_date >= DATE '2025-01-01';

SELECT customer_id, MAX(order_date) AS last_order_date
FROM orders
GROUP BY customer_id;
