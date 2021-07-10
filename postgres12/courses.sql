DROP TABLE IF EXISTS courses;
CREATE TABLE courses(
  course_id SERIAL PRIMARY KEY,
  course_name VARCHAR(255) NOT NULL,
  description VARCHAR(500),
  published_date DATE
);

INSERT INTO courses(course_name, description, published_date) VALUES('PostgreSQL for Developers', 'A complete PostgreSQL for Developers', '2020-07-03');
INSERT INTO courses(course_name, description, published_date) VALUES('PostgreSQL Administration', 'A PostgreSQL Guide for DBA', NULL);
INSERT INTO courses(course_name, description, published_date) VALUES('PostgreSQL High Performance', NULL, NULL);
INSERT INTO courses(course_name, description, published_date) VALUES('PostgreSQL Bootcamp', 'Learn PostgreSQL via Bootcamp', '2013-07-11');
INSERT INTO courses(course_name, description, published_date) VALUES('Mastering PostgreSQL', 'Mastering PostgreSQL in 21 days', '2012-06-30');
