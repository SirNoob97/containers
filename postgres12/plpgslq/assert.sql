DO $$
DECLARE
  film_count INTEGER;
BEGIN
  SELECT COUNT(*) INTO film_count FROM film;

  RAISE NOTICE 'Count: %', film_count;

  ASSERT film_count > 0, 'Film not found, check the film table';

  -- this will fail
  ASSERT film_count > 1000, '1000 Film found, check the film table';
END
$$ LANGUAGE 'plpgsql';
