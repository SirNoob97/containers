CREATE MATERIALIZED VIEW IF NOT EXISTS rental_by_category AS
  SELECT c.name AS category,
    SUM(p.amount) AS total_sales
  FROM payment p JOIN rental r USING(rental_id)
  JOIN inventory USING(inventory_id)
  JOIN film USING(film_id)
  JOIN film_category USING(film_id)
  JOIN category c USING(category_id)
  GROUP BY c.name
  ORDER BY total_sales DESC
  WITH NO DATA;
