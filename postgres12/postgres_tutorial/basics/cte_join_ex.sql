WITH cte_rental AS (
  SELECT staff_id, COUNT(rental_id) rental_count FROM rental
    GROUP BY staff_id
) SELECT s.staff_id, first_name, last_name, rental_count FROM staff s
    INNER JOIN cte_rental USING(staff_id);
