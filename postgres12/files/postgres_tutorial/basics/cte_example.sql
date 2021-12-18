WITH cte_film AS (
  SELECT film_id, title, (
    CASE
      WHEN length < 30 THEN 'Short'
      WHEN length >= 30 AND length < 90 THEN 'Medium'
      WHEN length >= 90 THEN 'Long'
    END
  ) length FROM film
) SELECT film_id, title, length FROM cte_film WHERE length = 'Long' ORDER BY title;
