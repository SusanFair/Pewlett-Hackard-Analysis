# Queries TOC.
### SEARCH
### CRUD Table Manipulation
### JOINING
### AGGREGATIONS

select * from departments


## SEARCH
################################
-- Query only the `pet_name` column
SELECT pet_name
FROM people;

-- Filter the query to show only dogs under the age of 5
SELECT pet_type, pet_name
FROM people
WHERE pet_type = 'dog'
AND pet_age < 5;

  -- View the table data
SELECT *
FROM cities;

-- View table data limited to n rows
SELECT *
FROM cities LIMIT 10;

-- Use a query to view only the cities column
SELECT city
FROM cities;

-- Create a query to view cities in Texas
SELECT city, state
FROM cities
WHERE state = 'Texas';

-- Create a query to view cities and states
-- with a population less than 100,000
SELECT *
FROM cities
WHERE population < 100000;

-- Create a query to view the city in California
-- with a population of less than 100,000
SELECT *
FROM cities
WHERE population < 100000
AND state = 'California';

--  Create a query to update the state for the city of Anaheim.
UPDATE cities
SET state = 'California'
WHERE city = 'Anaheim';

-- Wildcards
--Will return contains Will e.g.Will, WIlla, WIllows, etc
SELECT *
FROM actor
WHERE last_name LIKE 'Will%';

-- Will return start with?? Will e.g.Will, WIlla, WIllows, etc
SELECT *
FROM actor
WHERE last_name LIKE 'Will%';

## BETWEEN
-- BETWEEN two dates
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';

-- BETWEEN AND
SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');


## Distinct Quereies
-- get the unique values in a column
SELECT DISTINCT customer_id
FROM rental
ORDER BY customer_id DESC;      - returns list of unique customer ids

-- DISTINCT ON - takes the first row of the DISTINCT group
-- depends on grouping and ordering
-- use for latest thing or oldest for example
SELECT DISTINCT ON (customer_id) customer_id, rental_date
FROM rental
ORDER BY customer_id, rental_date DESC;





## CRUD TABLE Management
################################
-- Inset Database
INSERT INTO people (name, has_pet, pet_type, pet_name, pet_age)
VALUES ('Jacob', true, 'dog', 'Misty',10),
('Ahmed', true, 'rock', 'Rockington', 100),
('Peter', true, 'cat', 'Franklin', 2),
('Dave', true, 'dog', 'Queso', 1);

-- Add primary key
ALTER TABLE <name>
ADD COLUMN id SERIAL PRIMARY KEY;

-- Delete and update data where row in the column matches value
DELETE FROM <tableName>
WHERE <columnName> = <value>;

-- Update Imputation (replace 0 with value)
UPDATE firepower
SET <columnName> = 1
WHERE <columnNsame> = 0

-- Update Imputation (replace 0 witha value)
UPDATE firepower
SET <columnName> = 1
WHERE <columnNsame> = 0

-- Select averages and rename columns
SELECT AVG (personnel) AS (avg_personnel),
    AVG(strength) AS (avg_strength),
    AVG(population) AS (AVG_population),
FROM firepower;

-- Insert new data

-- Drop or delete a table
DROP TABLE <tableName> CASCADE;     -- CASCADE means alto remove the connection to other tables

-- Create a table as a result of a search (cant see table, but it shows in Tables)
SELECT first_name, last_name
INTO retirement_infos
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT * FROM retirement_info

## JOINING
################################
-- Types:
-- Inner    - only the common items in both tables, default
-- Left     - A + B = All of a, and common with B
-- Right    - A + B = All from B, and common with A
-- Cross(Full)    - returns all rows from match
-- Full Outer - All of both tables, if there is a mismatch will insert null values

SELECT <table>.<column1>, <table>.<column2>
<table2>.
see slides

-- Short cut
SELECT p.first_name, p.last_name, p.hand, m.loser_rank
FROM matches AS manager
INNER JOIN players AS p only  >>> see slides

-- Order
Inporting order
departments
employees
sallary
title
dept emp
dept manager

-- Example
SELECT DISTINCT ON (r.customer_id) c.first_name, c.last_name, c.email, r.rental_date
FROM rental as r
JOIN customer AS c
ON(r.customer_id=c.customer_id)             -- common variable in both tables
ORDER BY r.customer_id, r.rental_date DESC;



## AGGREGATION (Aggregated functions)
######################################
-- e.g.: COUNT, MAX, MIN, AVG, SUM, etc
-- often used with group by, etc.
-- count rows
SELECT COUNT(film_id) FROM film;    - count rows of Primary Key column 

-- count rows with named output
SELECT COUNT(film_id) AS "Total Films"  - names result under a new name for reuse
FROM film;

-- average
SELECT AVG(rental_duration) As "Avg Rental Period" FROM film

-- sum
SELECT SUM(replacement_cost) AS "Cost to Replace Library" FROM film

-- GROUP BY - get avg rental rate grouped by rental duration
-- 
SELECT AVG(rental_duration) AS "Avg Rental Rate" FROM film 
GROUP BY rental_duration;

-- GROUP BY and ORDER By  (orders result)
SELECT rental_duration, MAX(rental_rate) AS "Max Rental Rate" FROM film
GROUP BY (rental_duration)
ORDER BY rental_duration;

-- multiples
SELECT MIN(length), MAX(length)
FROM film;

-- ORDER BY (ORDER BY default is ascending by default)
-- always put it at the end of the query
-- can use ORDER BY on an actual column name or a calculated column
SELECT film_id, AVG(length) AS "Avg Length" FROM film
GROUP BY film_id
ORDER BY "Avg Length" DESC;                   -- DESC sets result in descending order

--  set decimal length
SELECT film_id, ROUND(AVG(length),2) AS "Avg Length" FROM film     -- round the # after the decimal
GROUP BY film_id
ORDER BY "Avg Length";

-- Order
SELECT 
FROM
JOIN
ON
GROUP BY
ORDER BY

-- Order example
SELECT country.country, COUNT(country.country) AS "Country Count"
FROM city
JOIN country 
ON city.country_id = country.country_id
GROUP BY country.country
ORDER BY "Country Count" DESC;

