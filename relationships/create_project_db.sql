-- first remove the foreign key constraint from department
ALTER TABLE IF EXISTS department
  DROP COLUMN manager;

-- DROP the tables and constraints
DROP TABLE IF EXISTS employee_project;
DROP TABLE IF EXISTS project;
DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS department;

-- create the project table, it depends on no other
CREATE TABLE project (
  id INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
  project_name TEXT NOT NULL,
  budget NUMERIC DEFAULT 0,
  start_date DATE
);

-- create the department table without the foreign key
CREATE TABLE department (
  id INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
  dept_name TEXT NOT NULL
);

-- create the employee table
-- make the foreign keys immediately as the two
-- dependencies exist

CREATE TABLE employee (
  id INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
  emp_name TEXT NOT NULL,
  phone TEXT,
  title TEXT,
  salary NUMERIC,
  department INTEGER REFERENCES department(id)
);

-- now the manager relationship between department and
-- employee is possible, alter the table and add the constraint

ALTER TABLE department
  ADD COLUMN manager INTEGER REFERENCES employee(id);

-- create the employee_project table with references
-- to both employee and project
-- the primary key is made up of two columns

CREATE TABLE employee_project (
  emp_id INTEGER REFERENCES employee(id),
  project_id INTEGER REFERENCES project(id),
  start_date DATE,
  end_date DATE,
  PRIMARY KEY (emp_id, project_id)
);