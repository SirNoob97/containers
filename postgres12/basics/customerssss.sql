DROP TABLE IF EXISTS customerssss;
CREATE TABLE customerssss (
	customer_id serial PRIMARY KEY,
	name VARCHAR UNIQUE,
	email VARCHAR NOT NULL,
	active bool NOT NULL DEFAULT TRUE
);

INSERT INTO customerssss (name, email) VALUES ('IBM', 'rcontact@ibm.com');
INSERT INTO customerssss (name, email) VALUES ('Microsoft', 'contact@microsoft.com');
INSERT INTO customerssss (name, email) VALUES ('Intel', 'contact@intel.com');
