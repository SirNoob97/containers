CREATE OR REPLACE RECURSIVE VIEW reporting_line(employee_id, subordinates) AS
  SELECT
    employee_id,
    full_name subordinates
  FROM
    employee_man
  WHERE
    manager_id IS NULL
  UNION ALL
  SELECT
    e.employee_id,
    rl.subordinates || ' > ' || e.full_name AS subordinates
  FROM
    employee_man e
    INNER JOIN reporting_line rl ON e.manager_id = rl.employee_id;
