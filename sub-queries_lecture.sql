# SUB-QUERY LECTURE

# SELECT column_a, column_b, column_c
# FROM table_a
# WHERE column_a IN (
#     SELECT column_a
#     FROM table_b
#     WHERE column_b IN (
#         SELECT column_a
#         FROM table_c
#         WHERE column_b = true
#     )
# );

# Employees Table Example
# Get department number and name for department where name is 'Customer Service'
USE employees;

SELECT dept_no
FROM departments
WHERE dept_name = 'Customer Service';

SELECT *
FROM departments
WHERE dept_no = (
    SELECT dept_no
    FROM departments
    WHERE dept_name = 'Customer Service'
    );

# Department Manager employee number of Sales Department
SELECT emp_no
FROM dept_manager
WHERE dept_no IN (
    SELECT dept_no              #
    FROM departments            # }
    WHERE dept_name = 'Sales'   #
    )
    AND to_date > NOW();

# concatenate the first two employee's highest salaries
SELECT CONCAT(
    (
        SELECT MAX(salary)
        FROM salaries
        WHERE emp_no = 10001
    ),
    ' ',
    (
        SELECT MAX(salary)
        FROM salaries
        WHERE emp_no = 10002
    )
) AS Salaries;

# Find the first/last name of all department managers
SELECT emp.first_name, emp.last_name
FROM employees AS emp
JOIN dept_manager AS dm ON dm.emp_no = emp.emp_no;

SELECT first_name, last_name
FROM employees
WHERE emp_no IN (
    SELECT emp_no
    FROM dept_manager
    );

# get the names of employees with the ten highest salaries
-- first, find the list of the employees with the highest current salaries
-- Emp. No | Salary
SELECT emp_no, salary
FROM salaries
WHERE to_date > NOW()
ORDER BY salary DESC;

SELECT employees.first_name, employees.last_name, salaries.salary
FROM salaries
JOIN employees ON employees.emp_no = salaries.emp_no
WHERE employees.emp_no IN (
    SELECT emp_no
    FROM salaries
    WHERE to_date > NOW()
    ORDER BY salary DESC
    )
ORDER BY salaries.salary DESC
LIMIT 10;

SELECT CONCAT(
    (
       SELECT CONCAT(first_name, ' ', last_name)
       FROM employees
       WHERE emp_no = 10001
    ),
    ' works in a department called ',
    (
       SELECT dept_name
       FROM departments
       WHERE dept_no = 'd005'
    ),
    '.'
);

# name and hire_date of earliest-hired department employees
SELECT first_name, hire_date
FROM employees
WHERE emp_no IN (
    SELECT emp_no
    FROM dept_emp
    WHERE from_date = (SELECT MIN(from_date) FROM dept_emp)
    );




