DROP TABLE IF EXISTS top_rated_films;
CREATE TABLE top_rated_films(
  title VARCHAR NOT NULL,
  release_year SMALLINT
);

DROP TABLE IF EXISTS most_popular_films;
CREATE TABLE most_popular_films(
  title VARCHAR NOT NULL,
  release_year SMALLINT
);

INSERT INTO top_rated_films(title, release_year) VALUES('The Shawshank Redemption', 1994);
INSERT INTO top_rated_films(title, release_year) VALUES('The Godfather', 1972);
INSERT INTO top_rated_films(title, release_year) VALUES('12 Angry Men', 1957);

INSERT INTO most_popular_films(title, release_year) VALUES('An American Pickle', 2020);
INSERT INTO most_popular_films(title, release_year) VALUES('The Godfather', 1972);
INSERT INTO most_popular_films(title, release_year) VALUES('Greyhound', 2020);
