CREATE TABLE distinct_demo(
  id serial NOT NULL PRIMARY KEY,
  bgcolor VARCHAR,
  fgcolor VARCHAR
);

INSERT INTO distinct_demo(bgcolor, fgcolor) VALUES('red', 'red');
INSERT INTO distinct_demo(bgcolor, fgcolor) VALUES('red', 'red');
INSERT INTO distinct_demo(bgcolor, fgcolor) VALUES('red', NULL);
INSERT INTO distinct_demo(bgcolor, fgcolor) VALUES(NULL, 'red');
INSERT INTO distinct_demo(bgcolor, fgcolor) VALUES('red', 'green');
INSERT INTO distinct_demo(bgcolor, fgcolor) VALUES('red', 'blue');
INSERT INTO distinct_demo(bgcolor, fgcolor) VALUES('green', 'red');
INSERT INTO distinct_demo(bgcolor, fgcolor) VALUES('green', 'blue');
INSERT INTO distinct_demo(bgcolor, fgcolor) VALUES('green', 'green');
INSERT INTO distinct_demo(bgcolor, fgcolor) VALUES('blue', 'red');
INSERT INTO distinct_demo(bgcolor, fgcolor) VALUES('blue', 'green');
INSERT INTO distinct_demo(bgcolor, fgcolor) VALUES('blue', 'blue');
