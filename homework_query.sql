-- Drop tables if tables exist
DROP TABLE departments;
DROP TABLE dept_emp;
DROP TABLE dept_manager;
DROP TABLE employees;
DROP TABLE salaries;
DROP TABLE titles;

-- Create departments table
CREATE TABLE departments (dept_no VARCHAR,
						 dept_name VARCHAR)
						 ;
						 
-- Import departments.csv
-- Check data import
SELECT * FROM departments LIMIT 5;

-- Create dept_emp table
CREATE TABLE dept_emp (emp_no INT,
					   dept_no VARCHAR,
					   from_date DATE,
					   to_date DATE
					  );
						 
-- Import dept_emp.csv
-- Check data import
SELECT * FROM dept_emp LIMIT 5;

-- Create dept_manager table
CREATE TABLE dept_manager (dept_no VARCHAR,
						   emp_no INT,
						   from_date DATE,
						   to_date DATE
						  );
						 
-- Import dept_manager.csv
-- Check data import
SELECT * FROM dept_manager LIMIT 5;

-- Create employees table
CREATE TABLE employees (emp_no INT,
						birth_date DATE,
						first_name VARCHAR,
						last_name VARCHAR,
						gender VARCHAR,
						hire_date DATE
						  );
						 
-- Import employees.csv
-- Check data import
SELECT * FROM employees LIMIT 5;

-- Create salaries table
CREATE TABLE salaries (emp_no INT,
					   salary INT,
					   from_date DATE,
					   to_date DATE
					  );
						 
-- Import salaries.csv
-- Check data import
SELECT * FROM salaries LIMIT 5;

-- Create titles table
CREATE TABLE titles (emp_no INT,
					 title VARCHAR,
					 from_date DATE,
					 to_date DATE
					);
						 
-- Import titles.csv
-- Check data import
SELECT * FROM titles LIMIT 5;
