WITH cte_film AS (
  SELECT film_id, title, rating, length,
    RANK() OVER (
      PARTITION BY rating ORDER BY length DESC
    ) length_rank FROM film
) SELECT * FROM cte_film WHERE length_rank = 1;
