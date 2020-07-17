-- Find salary by employee
SELECT  e.emp_no,
        e.last_name,
        e.first_name,
        e.gender,
        s.salary
FROM employees as e
    LEFT JOIN salaries as s
    ON (e.emp_no = s.emp_no);



-- Find employees hired in 1986
SELECT first_name, last_name
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';



-- Find the department managers
SELECT  dm.dept_no,
        d.dept_name,
        dm.emp_no,
        e.last_name,
        e.first_name,
        dm.from_date,
        dm.to_date
FROM dept_manager AS dm
    INNER JOIN departments AS d
        ON (dm.dept_no = d.dept_no)
    INNER JOIN employees AS e
        ON (dm.emp_no = e.emp_no);



-- Find the department of each employee
SELECT  e.emp_no,
        e.last_name,
        e.first_name,
        d.dept_name
FROM employees AS e
    INNER JOIN dept_emp AS de
        ON (e.emp_no = de.emp_no)
    INNER JOIN departments AS d
      ON (de.dept_no = d.dept_no);



-- Find all the Hercules with last name that starts with B
SELECT *
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';



-- Find all the employees in the sales department
SELECT  e.emp_no,
        e.last_name,
        e.first_name,
        d.dept_name
FROM employees AS e
    INNER JOIN dept_emp AS de
        ON (e.emp_no = de.emp_no)
    INNER JOIN departments AS d
        ON (de.dept_no = d.dept_no)
WHERE d.dept_name = 'Sales';



-- Find all the employees in sales and development departments
SELECT  e.emp_no,
        e.last_name,
        e.first_name,
        d.dept_name
FROM employees AS e
    INNER JOIN dept_emp AS de
        ON (e.emp_no = de.emp_no)
    INNER JOIN departments AS d
        ON (de.dept_no = d.dept_no)
WHERE d.dept_name IN ('Sales', 'Development');



-- Find the frequency count of employee last naes
SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;
