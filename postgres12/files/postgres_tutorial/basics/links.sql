DROP TABLE IF EXISTS links;
CREATE TABLE links(
  id SERIAL PRIMARY KEY,
  url VARCHAR(255) NOT NULL,
  name VARCHAR(255) NOT NULL,
  description VARCHAR(255),
  rel VARCHAR(10),
  last_update DATE DEFAULT NOW()
);

INSERT INTO links(url, name, description, rel, last_update) VALUES('https://www.postgresqltutorial.com', 'PostgreSQL Tutorial', 'Learn PostgreSQL fast and easy', 'follow', '2013-06-02');
INSERT INTO links(url, name, description, rel, last_update) VALUES('http://www.oreilly.com', 'O''Reilly Media', 'O''Reilly Media', 'nofollow', '2013-06-02');
INSERT INTO links(url, name, description, rel, last_update) VALUES('http://www.google.com', 'Google', 'Google', 'nofollow', '2013-06-02');
INSERT INTO links(url, name, description, rel, last_update) VALUES('http://www.yahoo.com', 'Yahoo', 'Yahoo', 'nofollow', '2013-06-02');
INSERT INTO links(url, name, description, rel, last_update) VALUES('http://www.bing.com', 'Bing', 'Bing', 'nofollow', '2013-06-02');
INSERT INTO links(url, name, description, rel, last_update) VALUES('http://www.facebook.com', 'Facebook', 'Facebook', 'nofollow', '2013-06-01');
INSERT INTO links(url, name, description, rel, last_update) VALUES('https://www.tumblr.com/', 'Tumblr', 'Tumblr', 'nofollow', '2013-06-02');
INSERT INTO links(url, name, description, rel, last_update) VALUES('http://www.postgresql.org', 'PostgreSQL', 'PostgreSQL', 'nofollow', '2013-06-02');
