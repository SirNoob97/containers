/*
  Table for csv import example

  READ
    Notice that the file must be read directly by the PostgreSQL server, not by the client application.
    Therefore, it must be accessible by the PostgreSQL server machine.
    Also, you need to have superuser access in order to execute the COPY statement successfully.

  WRITE
    Notice that the CSV file name that you specify in the COPY command must be written directly by the server.
    It means that the CSV file must reside on the database server machine, not your local machine.
    The CSV file also needs to be writable by the user that PostgreSQL server runs as.

  REMOTE WRITE
    The \copy command basically runs the COPY statement above.
    However, instead of server writing the CSV file, psql writes the CSV file,
    transfers data from the server to your local file system.
    To use \copy command, you just need to have sufficient privileges to your local machine.
    It does not require PostgreSQL superuser privileges.
 */
DROP TABLE IF EXISTS persons;
CREATE TABLE persons(
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  dob DATE,
  email VARCHAR(255)
);
