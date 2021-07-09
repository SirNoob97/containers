CREATE TABLE contacts(
  id INT GENERATED BY DEFAULT AS IDENTITY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  email VARCHAR(255) NOT NULL,
  phone VARCHAR(50),
  PRIMARY KEY(id)
);

INSERT INTO contacts(first_name, last_name, email, phone) VALUES('Jhon', 'Doe', 'john@example.com', NULL);
INSERT INTO contacts(first_name, last_name, email, phone) VALUES('Lily', 'Bush', 'lily.bush@example.com', '(408-234-2764)');
