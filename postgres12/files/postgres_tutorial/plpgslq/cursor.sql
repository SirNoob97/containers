CREATE OR REPLACE FUNCTION get_film_titles(p_year INTEGER)
RETURNS text
AS $$
DECLARE
  titles TEXT DEFAULT '';
  rec_film RECORD;
  cur_films CURSOR(p_year INTEGER) FOR
    SELECT title, release_year FROM film WHERE release_year = p_year;
BEGIN
  OPEN cur_films(p_year);
  LOOP
    FETCH cur_films INTO rec_film;
    EXIT WHEN NOT FOUND;

    IF rec_film.title LIKE '%ful%' THEN
      titles := titles || ',' || rec_film.title || ':' || rec_film.release_year;
    END IF;
  END LOOP;
  CLOSE cur_films;
  RETURN titles;
END
$$ LANGUAGE plpgsql;
