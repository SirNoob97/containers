CREATE OR REPLACE FUNCTION get_rental_duration(p_customer_id INTEGER)
RETURNS INTEGER
LANGUAGE plpgsql
AS $$
DECLARE
  rental_duration INTEGER;
BEGIN
  SELECT SUM(EXTRACT(DAY FROM return_date - rental_date))
    INTO rental_duration FROM rental WHERE customer_id = p_customer_id;
  RETURN rental_duration;
END
$$;

CREATE OR REPLACE FUNCTION get_rental_duration(p_customer_id INTEGER, p_from_date DATE)
RETURNS INTEGER
LANGUAGE plpgsql
AS $$
DECLARE
  rental_duration INTEGER;
BEGIN
  SELECT SUM(EXTRACT(DAY FROM return_date + '12:00:00' - rental_date))
    INTO rental_duration FROM rental
    WHERE customer_id = p_customer_id AND rental_date >= p_from_date;
  RETURN rental_duration;
END
$$;

/*
this default value will provoke this error
  HINT:  Could not choose the best candidate function. You might need to add explicit type casts.
 */
CREATE OR REPLACE FUNCTION get_rental_duration(
  p_customer_id INTEGER, p_from_date DATE DEFAULT '2004-01-01')

RETURNS INTEGER
LANGUAGE plpgsql
AS $$
DECLARE
  rental_duration INTEGER;
BEGIN
  SELECT SUM(EXTRACT(DAY FROM return_date + '12:00:00' - rental_date))
    INTO rental_duration FROM rental
    WHERE customer_id = p_customer_id AND rental_date >= p_from_date;
  RETURN rental_duration;
END
$$;
