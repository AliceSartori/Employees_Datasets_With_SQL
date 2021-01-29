-- COPY employees(emp_no,emp_title_id,birth_date,first_name,last_name, sex,hire_date)
-- FROM '/Users/alicesartori/Desktop/Code/Data_Analytics_class/cu-nyc-data-pt-11-2020-u-c-master-01-Class_Activities-09-SQL/02-Homework/09-SQL/Instructions/new_data/employees.csv'
-- DELIMITER ','
-- CSV HEADER;

-- COPY titles(title_id,title)
-- FROM '/Users/alicesartori/Desktop/Code/Data_Analytics_class/cu-nyc-data-pt-11-2020-u-c-master-01-Class_Activities-09-SQL/02-Homework/09-SQL/Instructions/new_data/titles.csv'
-- DELIMITER ','
-- CSV HEADER;

-- COPY salaries(emp_no,salary)
-- FROM '/Users/alicesartori/Desktop/Code/Data_Analytics_class/cu-nyc-data-pt-11-2020-u-c-master-01-Class_Activities-09-SQL/02-Homework/09-SQL/Instructions/new_data/salaries.csv'
-- DELIMITER ','
-- CSV HEADER;

-- COPY departments(dept_no,dept_name)
-- FROM '/Users/alicesartori/Desktop/Code/Data_Analytics_class/cu-nyc-data-pt-11-2020-u-c-master-01-Class_Activities-09-SQL/02-Homework/09-SQL/Instructions/new_data/departments.csv'
-- DELIMITER ','
-- CSV HEADER;

-- COPY dept_emp(emp_no,dept_no)
-- FROM '/Users/alicesartori/Desktop/Code/Data_Analytics_class/cu-nyc-data-pt-11-2020-u-c-master-01-Class_Activities-09-SQL/02-Homework/09-SQL/Instructions/new_data/dept_emp.csv'
-- DELIMITER ','
-- CSV HEADER;

-- COPY dept_manager(dept_no,emp_no)
-- FROM '/Users/alicesartori/Desktop/Code/Data_Analytics_class/cu-nyc-data-pt-11-2020-u-c-master-01-Class_Activities-09-SQL/02-Homework/09-SQL/Instructions/new_data/dept_manager.csv'
-- DELIMITER ','
-- CSV HEADER;


-- List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT employees.emp_no, last_name, first_name, sex, salary
FROM employees
INNER JOIN salaries ON
employees.emp_no = salaries.emp_no


-- List first name, last name, and hire date for employees who were hired in 1986.
select first_name,last_name,hire_date
from employees
where hire_date >= '1986-01-01' AND hire_date <= '1986-12-31'
ORDER BY hire_date


-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
select dept_manager.dept_no, dept_name, dept_manager.emp_no,last_name, first_name
from employees
INNER JOIN dept_manager ON
employees.emp_no=dept_manager.emp_no
INNER JOIN departments ON
dept_manager.dept_no = departments.dept_no


-- List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT employees.emp_no,last_name,first_name, dept_name
FROM employees
INNER JOIN dept_emp ON
employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON
dept_emp.dept_no=departments.dept_no

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select first_name, last_name, sex
from employees
where first_name='Hercules' AND last_name LIKE 'B%'

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, first_name, last_name,dept_name
FROM employees
INNER JOIN dept_emp ON
employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON
dept_emp.dept_no =departments.dept_no
WHERE dept_name = 'Sales'

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, first_name, last_name,dept_name
FROM employees
INNER JOIN dept_emp ON
employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON
dept_emp.dept_no =departments.dept_no
WHERE dept_name IN ('Development', 'Sales')
WHERE dept_name = 'Development' OR dept_name= 'Sales'

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, count(*) AS "count"
FROM employees
GROUP BY last_name
ORDER BY "count" DESC
