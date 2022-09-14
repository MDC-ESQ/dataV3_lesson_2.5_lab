USE sakila;


-- Lab | SQL Queries - Lesson 2.5

-- 1. Select all the actors with the first name ‘Scarlett’.
SELECT * FROM sakila.actor
WHERE first_name LIKE 'Scarlett%';


-- 2. How many films (movies) are available for rent and how many films have been rented?
SELECT COUNT(inventory_id) FROM sakila.inventory;  -- total number of films available

SELECT Count(rental_id) AS 'Films rented' FROM sakila.rental
WHERE return_date is null;
-- Number of films that have been rented and not yet returned.

SELECT 4581 - 183;
-- Number of films available for rent in all stores


-- 3. What are the shortest and longest movie duration? Name the values max_duration and min_duration.
SELECT MAX(length) AS 'max_duration', MIN(length) AS 'min_duration' FROM sakila.film;

-- 4. What's the average movie duration expressed in format (hours, minutes)?


SELECT CONCAT(Floor(AVG(length)/60),':',round(AVG(length)-60*Floor(AVG(length)/60),0)) AS 'avg_duration'
FROM sakila.film;


-- 5. How many distinct (different) actors' last names are there?
SELECT COUNT(DISTINCT last_name) FROM sakila.actor;


-- 6. Since how many days has the company been operating (check DATEDIFF() function)?
SELECT DATEDIFF(last_update, rental_date) AS 'Age comoany (in days)' FROM sakila.rental
ORDER BY 'Creation days' DESC
LIMIT 1;
-- Assuming that the company started operating the same say as renting films


-- 7. Show rental info with additional columns month and weekday. Get 20 results.
SELECT 
    *,
    DATE_FORMAT(CONVERT(rental_date,DATE),
            '%M') AS 'month',
	DAYNAME(rental_date) as 'weekday'
FROM
    sakila.rental
LIMIT 20;


-- 8. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT 
    *,
    DATE_FORMAT(CONVERT(rental_date,DATE),
            '%M') AS 'month',
	DAYNAME(rental_date) as 'weekday',
    CASE
		WHEN DAYNAME(rental_date) = 'Saturday' or DAYNAME(rental_date) = 'Sunday' then 'weekend'
		ELSE 'workday'
	END AS 'day_type'
FROM
    sakila.rental;
    
    
-- 9. Get release years
SELECT DISTINCT release_year FROM sakila.film;


-- 10. Get all films with ARMAGEDDON in the title.
SELECT * FROM sakila.film
WHERE title LIKE 'ARMAGEDDON%';


-- 11. Get all films which title ends with APOLLO.
SELECT * FROM sakila.film
WHERE RIGHT(title,6) = 'APOLLO';


-- 12. Get 10 the longest films.
SELECT * FROM sakila.film
ORDER BY length DESC
LIMIT 10;


-- 13. How many films include Behind the Scenes content?
SELECT COUNT(film_id) FROM sakila.film
WHERE special_features = 'Behind the Scenes';