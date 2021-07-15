DO $$
DECLARE
  rate film.rental_rate%TYPE;
  price_segment VARCHAR(50);
BEGIN
  SELECT rental_rate INTO rate FROM film WHERE film_id = 100;

  IF found THEN
    CASE rate
      WHEN 0.99 THEN price_segment = 'Mass';
      WHEN 2.99 THEN price_segment = 'Mainstream';
      WHEN 4.99 THEN price_segment = 'High End';
      ELSE price_segment = 'Unspecified';
    END CASE;
    raise notice '%', price_segment;
  END IF;
END
$$ LANGUAGE plpgsql;

-- sql syntax
DO $$
DECLARE
  total_payment NUMERIC;
  service_level VARCHAR(25);
BEGIN
  SELECT SUM(amount) INTO total_payment FROM Payment WHERE customer_id = 100;

  IF found THEN
    CASE
      WHEN total_payment > 200 THEN service_level = 'Platinum';
      WHEN total_payment > 100 THEN service_level = 'Gold';
      ELSE service_level = 'Sirlver';
    END CASE;
    RAISE NOTICE 'Service Level: %', service_level;
  ELSE
    RAISE NOTICE 'Customer not found';
  END IF;
END
$$ LANGUAGE plpgsql;
