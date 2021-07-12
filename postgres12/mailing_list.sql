CREATE DOMAIN contact_name AS VARCHAR NOT NULL CHECK(value !~ '\s');

DROP TABLE IF EXISTS mailing_list;
CREATE TABLE mailing_list(
  id SERIAL PRIMARY KEY,
  first_name contact_name,
  last_name contact_name,
  email VARCHAR  NOT NULL
);
