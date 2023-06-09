--1. How many rows are in the names table?
SELECT COUNT(*)
FROM names
--1957046

--2. How many total registered people appear in the dataset?
SELECT sum(num_registered)
FROM names 
WHERE num_registered IS NOT NULL 
--351653025

--1957046
-- 3. Which name had the most appearances in a single year in the dataset?
SELECT MAX(num_registered), name
FROM names
GROUP BY name, num_registered 
ORDER BY num_registered DESC
--Linda


4. What range of years are included?
SELECT DISTINCT year 
FROM names

--1880-2018


--5. What year has the largest number of registrations?

SELECT sum(num_registered), year
FROM names
GROUP BY year
ORDER BY SUM(num_registered) DESC
--1957

--6. How many different (distinct) names are contained in the dataset?

SELECT COUNT(distinct name)
FROM names

--98400


--7  Are there more males or more females registered?
SELECT COUNT(gender) AS gender_count, gender
FROM names
GROUP BY gender

--8. . What are the most popular male and female names overall (i.e., the most total registrations)?

SELECT SUM(num_registered) AS total_name_count, name, gender
FROM names
GROUP BY name, gender
ORDER by total_name_count DESC

--James & mary 

--9.  What are the most popular boy and girl names of the first decade of the 2000s (2000 - 2009)?

SELECT name, SUM(num_registered) AS total_sum, gender
FROM names 
WHERE year BETWEEN 2000 AND 2009
GROUP BY name, gender 
ORDER BY total_sum DESC


--jacob & emily 

-- 10. Which year had the most variety in names (i.e. had the most distinct names)?

SELECT year, COUNT(DISTINCT name) AS name_count 
FROM names
GROUP BY year
ORDER BY name_count DESC;
--2008, 32518


