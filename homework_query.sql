-- Drop tables if tables exist
DROP TABLE departments;
DROP TABLE dept_emp;
DROP TABLE dept_manager;
DROP TABLE employees;
DROP TABLE salaries;
DROP TABLE titles;


-- RECOMMENDED ORDER OF TABLE CREATION/IMPORT
-- employees, departments, dept_manager, dept_emp, titles, salaries
-- Create employees table
CREATE TABLE employees (emp_no INT NOT NULL,
						birth_date DATE NOT NULL,
						first_name VARCHAR NOT NULL,
						last_name VARCHAR NOT NULL,
						gender VARCHAR NOT NULL,
						hire_date DATE NOT NULL,
						PRIMARY KEY (emp_no)
						  );
						 
-- Import employees.csv
-- Check data import
SELECT * FROM employees LIMIT 5;

-- Create departments table
CREATE TABLE departments (dept_no VARCHAR NOT NULL,
						 dept_name VARCHAR  NOT NULL,
						 PRIMARY KEY (dept_no)
						  );
						 
-- Import departments.csv
-- Check data import
SELECT * FROM departments LIMIT 5;

-- Create dept_manager table
CREATE TABLE dept_manager (dept_no VARCHAR NOT NULL,
						   emp_no INT NOT NULL,
						   from_date DATE NOT NULL,
						   to_date DATE NOT NULL,
						   FOREIGN KEY (dept_no) REFERENCES departments (dept_no) ON DELETE CASCADE,
						   FOREIGN KEY (emp_no) REFERENCES employees (emp_no) ON DELETE CASCADE,
						   PRIMARY KEY (emp_no, dept_no)
						  );
						 
-- Import dept_manager.csv
-- Check data import
SELECT * FROM dept_manager LIMIT 5;

-- Create dept_emp table
CREATE TABLE dept_emp (emp_no INT NOT NULL,
					   dept_no VARCHAR NOT NULL,
					   from_date DATE NOT NULL,
					   to_date DATE NOT NULL,
					   FOREIGN KEY (emp_no) REFERENCES employees (emp_no) ON DELETE CASCADE,
					   FOREIGN KEY (dept_no) REFERENCES departments (dept_no) ON DELETE CASCADE,
					   PRIMARY KEY (emp_no, dept_no)
					  );
						 
-- Import dept_emp.csv
-- Check data import
SELECT * FROM dept_emp LIMIT 5;

-- Create titles table
CREATE TABLE titles (emp_no INT NOT NULL,
					 title VARCHAR NOT NULL,
					 from_date DATE NOT NULL,
					 to_date DATE NOT NULL,
					 FOREIGN KEY (emp_no) REFERENCES employees (emp_no) ON DELETE CASCADE,
					 PRIMARY KEY (emp_no, title, from_date)
					);
						 
-- Import titles.csv
-- Check data import
SELECT * FROM titles LIMIT 5;

-- Create salaries table
CREATE TABLE salaries (emp_no INT NOT NULL,
					   salary INT NOT NULL,
					   from_date DATE NOT NULL,
					   to_date DATE NOT NULL,
					   FOREIGN KEY (emp_no) REFERENCES employees (emp_no) ON DELETE CASCADE,
					   PRIMARY KEY (emp_no, from_date)
					  );
						 
-- Import salaries.csv
-- Check data import
SELECT * FROM salaries LIMIT 5;

-- Employee number, last name, first name, gender, salary of each employee
SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM employees e
JOIN salaries s
ON e.emp_no = s.emp_no
;

-- Employees hired in 1986
SELECT hire_date, first_name, last_name, emp_no
FROM employees
WHERE extract(year FROM hire_date) = '1986'
;

-- Manager of each department (department number, department name,
-- the manager's employee number, last name, first name, and start and end employment dates.)
SELECT
m.dept_no,
d.dept_name,
m.emp_no,
e.last_name,
e.first_name,
m.from_date,
m.to_date
FROM dept_manager m
LEFT JOIN departments d ON m.dept_no = d.dept_no
LEFT JOIN employees e ON m.emp_no = e.emp_no
;

-- Department of each employee (employee number, last name, first name, and department name)
SELECT
e.emp_no, e.last_name, e.first_name, x.dept_name
FROM employees e
LEFT JOIN dept_emp d ON e.emp_no = d.emp_no
LEFT JOIN departments x ON x.dept_no = d.dept_no
;

-- All employees named Hercules whose last names begin with "B"
SELECT * FROM employees
WHERE
(first_name LIKE 'Hercules' AND last_name LIKE 'B%')
;

-- All employees in Sales (employee number, last name, first name, and department name)
SELECT
e.emp_no, e.last_name, e.first_name, x.dept_name
FROM employees e
LEFT JOIN dept_emp d ON e.emp_no = d.emp_no
LEFT JOIN departments x ON d.dept_no = x.dept_no
WHERE x.dept_name LIKE 'Sales'
;

-- All employees in Sales and Development (employee number, last name, first name, and department name)
SELECT
e.emp_no, e.last_name, e.first_name, x.dept_name
FROM employees e
LEFT JOIN dept_emp d ON e.emp_no = d.emp_no
LEFT JOIN departments x ON d.dept_no = x.dept_no
WHERE x.dept_name LIKE 'Sales'
OR x.dept_name LIKE 'Development'
;

-- Frequency count of employee last names
SELECT last_name, count(last_name) AS "name_count"
FROM employees
GROUP BY last_name
ORDER BY name_count DESC
;