DROP TABLE IF EXISTS employee_man;
CREATE TABLE employee_man(
  employee_id serial PRIMARY KEY,
  full_name VARCHAR(255) NOT NULL,
  manager_id INTEGER
);

INSERT INTO employee_man(full_name, manager_id) VALUES('Julia Mcqueen', NULL);
INSERT INTO employee_man(full_name, manager_id) VALUES('Bette Nicholson', 1);
INSERT INTO employee_man(full_name, manager_id) VALUES('Christian Gable', 1);
INSERT INTO employee_man(full_name, manager_id) VALUES('Megan Berry', 1);
INSERT INTO employee_man(full_name, manager_id) VALUES('Sarah Berry', 1);
INSERT INTO employee_man(full_name, manager_id) VALUES('Joe Swank', 2);
INSERT INTO employee_man(full_name, manager_id) VALUES('Bella Tucker', 2);
INSERT INTO employee_man(full_name, manager_id) VALUES('Ryan Metcalfe', 2);
INSERT INTO employee_man(full_name, manager_id) VALUES('Max Mills', 2);
INSERT INTO employee_man(full_name, manager_id) VALUES('Fred Costner', 3);
INSERT INTO employee_man(full_name, manager_id) VALUES('Carolyn Henderson', 3);
INSERT INTO employee_man(full_name, manager_id) VALUES('Nicola Kelly', 3);
INSERT INTO employee_man(full_name, manager_id) VALUES('Alexandra Climo', 3);
INSERT INTO employee_man(full_name, manager_id) VALUES('Sandra Kilmer', 4);
INSERT INTO employee_man(full_name, manager_id) VALUES('Leonard Gray', 4);
INSERT INTO employee_man(full_name, manager_id) VALUES('Piers Paige', 7);
INSERT INTO employee_man(full_name, manager_id) VALUES('Ryan Henderson', 7);
INSERT INTO employee_man(full_name, manager_id) VALUES('Frank Tucker', 8);
INSERT INTO employee_man(full_name, manager_id) VALUES('Nathan Ferguson', 8);
INSERT INTO employee_man(full_name, manager_id) VALUES('Kevin Rampling', 8);
