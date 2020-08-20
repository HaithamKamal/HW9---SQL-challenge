-- DATA ANALYSIS

-- 1. Details of each employee: employee number, last name, first name, gender, and salary.

SELECT  emp.emp_no,
        emp.last_name,
        emp.first_name,
        emp.sex,
        sal.salary
FROM Employees as emp
    LEFT JOIN Salaries as sal
    ON (emp.emp_no = sal.emp_no)
ORDER BY emp.emp_no;

-- 2. List employees who were hired in 1986.

SELECT emp_no, first_name, last_name, hire_date from Employees
WHERE hire_date >= '1985-12-31'
AND hire_date < '1987-01-01';

-- 3. List the manager of each department with the following information: 
		-- department number, department name, the manager's employee number, 
		-- last name, first name, and start and end employment dates.
			
SELECT  dm.dept_no,
        d.dept_name,
        dm.emp_no,
        e.last_name,
        e.first_name
FROM Department_Manager AS dm
    INNER JOIN Departments AS d
        ON (dm.dept_no = d.dept_no)
    INNER JOIN Employees AS e
        ON (dm.emp_no = e.emp_no);


-- 4. List the department of each employee with the following information: 
	-- employee number, last name, first name, and department name.
	
SELECT  e.emp_no,
        e.last_name,
        e.first_name,
        d.dept_name
FROM Employees AS e
    INNER JOIN Department_Employee AS de
        ON (e.emp_no = de.emp_no)
    INNER JOIN Departments AS d
        ON (de.dept_no = d.dept_no)
ORDER BY e.emp_no;

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."

SELECT first_name, last_name, birth_date, sex
FROM Employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- 6. List all employees in the Sales department, 
	--including their employee number, last name, first name, and department name.
	
SELECT  e.emp_no,
        e.last_name,
        e.first_name,
        d.dept_name
FROM Employees AS e
    INNER JOIN Department_Employee AS de
        ON (e.emp_no = de.emp_no)
    INNER JOIN Departments AS d
        ON (de.dept_no = d.dept_no)
WHERE d.dept_name = 'Sales'
ORDER BY e.emp_no;

-- 7. List all employees in the Sales and Development departments, 
	-- including their employee number, last name, first name, and department name.
	
SELECT  e.emp_no,
        e.last_name,
        e.first_name,
        d.dept_name
FROM Employees AS e
    INNER JOIN Department_Employee AS de
        ON (e.emp_no = de.emp_no)
    INNER JOIN departments AS d
        ON (de.dept_no = d.dept_no)
WHERE d.dept_name IN ('Sales', 'Development')
ORDER BY e.emp_no;

-- 8. In descending order, list the frequency count of employee last names, 
	-- i.e., how many employees share each last name.
	
SELECT last_name, COUNT(last_name)
FROM Employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;
