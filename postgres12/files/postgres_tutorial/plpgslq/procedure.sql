-- A drawback of user-defined functions is that they cannot execute transactions.
-- In other words, inside a user-defined function, you cannot start a transaction, and commit or rollback it.
CREATE OR REPLACE PROCEDURE transfer(sender INTEGER, receiver INTEGER, amount DECIMAL)
LANGUAGE plpgsql
AS $$
BEGIN
  UPDATE accounts SET balance = balance - amount WHERE id = sender;

  UPDATE accounts SET balance = balance + amount WHERE id = receiver;
  COMMIT;
END
$$;
