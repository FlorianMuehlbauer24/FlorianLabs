use sakila;

#Challenge 1 
# 1.1 Determine the shortest and longest movie durations and name the values as max_duration and min_duration.
SELECT title, length, 
CASE
	WHEN length = (SELECT MAX(length) FROM film) THEN 'max_duration'
    WHEN length = (SELECT MIN(length) FROM film) THEN 'min_duration'
END AS movie_min_max
FROM film;


#1.2 Express the average movie duration in hours and minutes. Don't use decimals. Hint: Look for floor and round functions.

SELECT
  ROUND(AVG(length) / 60) AS hours,
  ROUND(AVG(length) % 60) AS minutes
From film;

# You need to gain insights related to rental dates:

#2.1 Calculate the number of days that the company has been operating.
#Hint: To do this, use the rental table, and the DATEDIFF() function to subtract the earliest date in the rental_date column from the latest date.

SELECT DATEDIFF(MAX(rental_date), MIN(rental_date)) AS days_operating
FROM rental;

# 2.2 Retrieve rental information and add two additional columns to show the month and weekday of the rental. Return 20 rows of results.

SELECT rental_id, rental_date,
  MONTH(rental_date) AS rental_month,
  DAYNAME(rental_date) AS rental_weekday
FROM rental
LIMIT 20;

# 3.1 retrieve the film titles and their rental duration. If any rental duration value is NULL, replace it with the string 'Not Available'. Sort the results of the film title in ascending order.

SELECT title, rental_duration,
	CASE
		WHEN rental_duration IS NULL THEN 'Not Available'
		ELSE 'available'
		END AS availability
FROM film
Order by title;

#CHALLENGE 2

#Next, you need to analyze the films in the collection to gain some more insights. Using the film table, determine:
#1.1 The total number of films that have been released.
SELECT COUNT(title)
From film;
#1.2 The number of films for each rating.
SELECT COUNT(title), rating
From film 
Group by rating;
#1.3 The number of films for each rating, sorting the results in descending order of the number of films. This will help you to better understand the popularity of different film ratings and adjust purchasing decisions accordingly.
SELECT COUNT(title) as number_of_films, rating
From film 
Group by rating
ORDER BY number_of_films DESC

# Using the film table, determine:
#2.1 The mean film duration for each rating, and sort the results in descending order of the mean duration. Round off the average lengths to two decimal places. This will help identify popular movie lengths for each category.
#2.2 Identify which ratings have a mean duration of over two hours in order to help select films for customers who prefer longer movies.
    