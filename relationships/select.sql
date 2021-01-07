 SELECT 
    emp_name 
FROM 
    employee 
    WHERE department = 2;
     
SELECT 
    emp_name 
FROM 
    employee 
    JOIN employee_project 
    ON employee.id = employee_project.emp_id 
    JOIN project 
    ON employee_project.project_id = project.id 
WHERE project.id = 2;

SELECT 
    emp_name 
FROM 
    employee 
    JOIN employee_project 
    ON employee.id = employee_project.emp_id 
    JOIN project 
    ON employee_project.project_id = project.id 
    JOIN department 
    ON department.id = employee.department 
WHERE project.project_name = 'Watch paint dry' 
    AND department.dept_name = 'Warehouse
';

SELECT 
    project_name, 
    employee.emp_name 
FROM 
    project 
    JOIN employee_project 
    ON project.id = employee_project.project_id 
    JOIN employee 
    ON employee_project.emp_id = employee.id 
    JOIN department 
    ON employee.department = department.id 
WHERE department.dept_name = 'Sales';

SELECT 
    emp_name, 
    project.project_name, 
    department.manager 
FROM 
    employee 
    JOIN department 
    ON employee.department = department.id 
    JOIN employee_project 
    ON employee.id = employee_project.emp_id 
    JOIN project 
    ON employee_project.project_id = project.id 
WHERE project.project_name = 'Watch paint dry';