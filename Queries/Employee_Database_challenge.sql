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
-- and create unique_titles 
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

-- Deliverable 1, Steps 16 - 22 - retiring_titles
SELECT ut.title, COUNT(*)
INTO retiring_titles
FROM unique_titles as UT
GROUP BY ut.title
ORDER BY count DESC

SELECT * FROM retiring_titles




-- Deliverable 2: Employees eligible for mentorship
-- Steps 1 - 11 - mentorship_eligibility
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



-- Other Queries


-- Mentorship unique titles using mentorship_eligibilty
SELECT DISTINCT ON (me.emp_no) me.emp_no,
me.first_name,
me.last_name,
me.title
INTO mentorship_unique_titles
FROM mentorship_eligibility as me
WHERE to_date = ('9999-01-01')
ORDER BY me.emp_no ASC, me.to_date DESC;

-- Mentorship count by titles - mentorship_titles
-- used to create mentorship chart
SELECT mut.title, COUNT(*)
INTO mentorship_titles
FROM mentorship_unique_titles as MUT
GROUP BY mut.title
ORDER BY count DESC


-- Retiring roles and salaries - Retirement salary chart
-- Join retiring table with salaries and derive a unique_titles_salaries table
SELECT * FROM unique_titles_salaries

-- count roles an sum of salaries by role
-- count roles an sum salary by role
SELECT uts.title, COUNT(*), SUM(uts.salary)
INTO retirement_salaries
FROM unique_titles_salaries as UTS
GROUP BY uts.title
ORDER BY SUM(uts.salary)

SELECT * FROM retirement_salaries



