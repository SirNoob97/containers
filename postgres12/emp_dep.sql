DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS deparment;

CREATE TABLE employee(
  employee_id serial PRIMARY KEY,
  employee_name VARCHAR(255) NOT NULL,
  department_id INTEGER
);

CREATE TABLE department(
  department_id serial PRIMARY KEY,
  department_name VARCHAR(255) NOT NULL
);

INSERT INTO employee(employee_name, department_id) VALUES('Julia Mcqueen', NULL);
INSERT INTO employee(employee_name, department_id) VALUES('Bette Nicholson', 1);
INSERT INTO employee(employee_name, department_id) VALUES('Christian Gable', 1);
INSERT INTO employee(employee_name, department_id) VALUES('Joe Swank', 2);
INSERT INTO employee(employee_name, department_id) VALUES('Fred Costner', 3);
INSERT INTO employee(employee_name, department_id) VALUES('Sandra Kilmer', 4);

INSERT INTO department(department_name) VALUES('Sales');
INSERT INTO department(department_name) VALUES('Marketing');
INSERT INTO department(department_name) VALUES('HR');
INSERT INTO department(department_name) VALUES('IT');
INSERT INTO department(department_name) VALUES('Production');
