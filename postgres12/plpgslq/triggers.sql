DROP TABLE IF EXISTS employees;
CREATE TABLE employees(
  id INTEGER GENERATED ALWAYS AS IDENTITY,
  first_name VARCHAR(40) NOT NULL,
  last_name VARCHAR(40) NOT NULL,
  PRIMARY KEY(id)
);

DROP TABLE IF EXISTS employee_audits;
CREATE TABLE employee_audits(
  id INTEGER GENERATED ALWAYS AS IDENTITY,
  employee_id INTEGER NOT NULL,
  last_name VARCHAR(40) NOT NULL,
  changed_on TIMESTAMP(6) NOT NULL
);

CREATE OR REPLACE FUNCTION log_last_name_changes()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
  IF NEW.last_name <> OLD.last_name THEN
    INSERT INTO employee_audits(employee_id, last_name, changed_on)
    VALUES(OLD.id, OLD.last_name, NOW());
  END IF;
  RETURN NEW;
END
$$;

CREATE TRIGGER last_name_changes
  BEFORE UPDATE
  ON employees
  FOR EACH ROW
  EXECUTE PROCEDURE log_last_name_changes();
