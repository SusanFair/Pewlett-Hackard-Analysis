## Database design

-- Creating tables for Ph-EmployeeDB
CREATE TABLE departments(
	dept_no VARCHAR(4) NOT NULL,
	dept_name varchar(40) NOT NULL,
	PRIMARY KEY (dept_no),
	UNIQUE (dept_no)
);

CREATE TABLE employees (
	emp_no INT NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	gender VARCHAR NOT NULL,
	hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_no) REFERENCES manager (emp_no),
	FOREIGN KEY (emp_no) REFERENCES dept_emp (emp_no),
	FOREIGN KEY (emp_no) REFERENCES titles (emp_no),
	FOREIGN KEY (emp_no) REFERENCES salaries (emp_no)
);

-- Creating tables for PH-EmployeeDB
CREATE TABLE manager (
	dept_no VARCHAR (4) NOT NULL,
	emp_no INT NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);

CREATE TABLE dept_empl (
	emp_no INT NOT NULL,
	dept_no VARCHAR NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);

CREATE TABLE salaries(
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (emp_no)
);

CREATE TABLE titles (
	emp_no INT NOT NULL,
	title VARCHAR NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	PRIMARY KEY (title),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);
