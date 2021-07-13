DO $$
DECLARE
  v_film film%ROWTYPE;
  len_description VARCHAR(100);
BEGIN
  SELECT * FROM film INTO v_film WHERE film_id = 100;

  IF NOT found THEN
    RAISE NOTICE 'The film could not be found';
  ELSE
    IF v_film.length > 0 AND v_film.length <= 50 THEN
      len_description := 'Short';
    ELSEIF v_film.length > 50 AND v_film.length < 120 THEN
      len_description := 'Medium';
    ELSEIF v_film.length > 120 THEN
      len_description := 'Long';
    ELSE
      len_description := 'N/A';
    END IF;

    RAISE NOTICE 'The % film is %', v_film.title, len_description;
  END IF;
END
$$ LANGUAGE plpgsql;
