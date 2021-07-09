-- query to join three tables
SELECT
  c.customer_id,
  c.first_name customer_first_name,
  c.last_name customer_last_name,
  s.first_name staff_first_name,
  s.last_name staff_last_name,
  amount,
  payment_date
FROM customer c
INNER JOIN payment p
  ON c.customer_id = p.customer_id
INNER JOIN staff s
  ON p.staff_id = s.staff_id
ORDER BY payment_date;
