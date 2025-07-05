WITH monthly_sales AS (
  SELECT employee_id, order_year, order_month, SUM(total_amount) AS revenue
  FROM orders
  GROUP BY employee_id, order_year, order_month
)
SELECT employee_id, order_year, order_month, revenue
FROM monthly_sales
WHERE revenue >= 10000
ORDER BY order_year, order_month, revenue DESC;
