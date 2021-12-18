WITH RECURSIVE subordinates AS (
  SELECT employee_id, manager_id, full_name
    FROM employee_man WHERE employee_id = 2
  UNION SELECT e.employee_id, e.manager_id, e.full_name
    FROM employee_man e INNER JOIN subordinates s ON s.employee_id = e.manager_id
) SELECT * FROM subordinates;
