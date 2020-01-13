-- 1. List the following details of each employee: employee number, 
--    last name, first name, gender, and salary.

SELECT salaries.emp_no,
employees.last_name,
employees.first_name,
employees.gender,
salaries.salary
FROM employees
INNER JOIN salaries ON employees.emp_no=salaries.emp_no;

-- 2. List employees who were hired in 1986.

select * from employees where hire_date like '1986%';

-- 3. List the manager of each department with the following information: 
--    department number, department name, the manager's employee number, 
--    last name, first name, and start and end employment dates.

-- manager: dept_no, emp_no, from_date, to_date
-- departments: dept_name
-- employees: last_name, first_name

SELECT employees.last_name,
employees.first_name,
manager.dept_no, 
manager.emp_no,
manager.from_date,
manager.to_date,
departments.dept_name
FROM manager
JOIN departments
on departments.dept_no = manager.dept_no
JOIN employees
on employees.emp_no = manager.emp_no;

-- 4. List the department of each employee with the following information: 
--    employee number, last name, first name, and department name.

SELECT employees.emp_no,
employees.last_name,
employees.first_name,
departments.dept_name
FROM dept_emp
JOIN employees ON dept_emp.emp_no=employees.emp_no
JOIN departments ON dept_emp.dept_no=departments.dept_no;

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."

select * from employees where first_name ='Hercules' and last_name like 'B%';

-- 6. List all employees in the Sales department, including their employee number, 
--    last name, first name, and department name.

SELECT employees.emp_no,
employees.last_name,
employees.first_name,
departments.dept_name
FROM dept_emp
JOIN employees ON dept_emp.emp_no=employees.emp_no
JOIN departments ON dept_emp.dept_no=departments.dept_no
where departments.dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments,
--    including their employee number, last name, first name, and department name.

SELECT employees.emp_no,
employees.last_name,
employees.first_name,
departments.dept_name
FROM dept_emp
JOIN employees ON dept_emp.emp_no=employees.emp_no
JOIN departments ON dept_emp.dept_no=departments.dept_no
where departments.dept_name = 'Sales' or departments.dept_name = 'Development';

-- 8. In descending order, list the frequency count of employee last names,
--    i.e., how many employees share each last name.

SELECT last_name, COUNT(*) 
FROM employees 
GROUP BY last_name
ORDER BY count desc;