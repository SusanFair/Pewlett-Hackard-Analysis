--###################################
-- Starting Module 7 Challenge
--###################################

SELECT emp_no, first_name, last_name
FROM employees as e

SELECT title, from_date, to_date
FROM titles as t

-- Deliverable 1, Steps 1 - 7
-- Create new table - retirement_titles
SELECT e.emp_no,
    e.first_name,
	e.last_name,
    t.title,
    t.from_date,
    t.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no

select * FROM retirement_titles

-- Deliverable 1, Steps 8 - 15
-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title

INTO unique_titles
FROM retirement_titles as rt
WHERE to_date = ('9999-01-01')
ORDER BY rt.emp_no ASC, rt.to_date DESC;


select * FROM retirement_titles
SELECT * FROM unique_titles

-- Format given for above query
SELECT DISTINCT ON (______) _____,
______,
______,
______

INTO nameyourtable
FROM _______
WHERE _______
ORDER BY _____, _____ DESC;

-- Deliverable 1, Steps 16 - 22
SELECT ut.title, COUNT(*)
INTO retiring_titles
FROM unique_titles as UT
GROUP BY ut.title
ORDER BY count DESC

SELECT * FROM retiring_titles




-- Deliverable 2
-- Steps 1 - 11
SELECT DISTINCT ON (e.emp_no) e.emp_no, 
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
INTO mentorship_eligibility
FROM employees as e
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE de.to_date = ('9999-01-01')
AND (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp_no

SELECT * from mentorship_eligibility