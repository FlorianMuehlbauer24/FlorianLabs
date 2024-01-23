USE sakila;

#1 Display all available tables in the Sakila database.
SHOW Tables;

#2 Retrieve all the data from the tables actor, film and customer.
SELECT * FROM actor, film, customer;

#3 Retrieve the following columns from their respective tables:
#3.1 Titles of all films from the film table
SELECT title 
FROM film;

# 3.2 List of languages used in films, with the column aliased as language from the language table
SELECT language_id from film AS language;

# 3.3 List of first names of all employees from the staff table 
SELECT first_name from staff;

# 4. Retrieve unique release years
SELECT DISTINCT `release_year`from film;

# Counting records for database insights:

# 5.1 Determine the number of stores that the company has.

SELECT COUNT(DISTINCT store_id)
FROM Store;

#5.2 Determine the number of employees that the company has.

SELECT COUNT(DISTINCT staff_id)
FROM staff;

#5.3 Determine how many films are available for rent and how many have been rented.
SELECT COUNT(DISTINCT inventory_id)
FROM rental;

SELECT COUNT(DISTINCT rental_id)
FROM rental;


#5.4 Determine the number of distinct last names of the actors in the database.
SELECT COUNT(DISTINCT last_name)
FROM actor;

#6 Retrieve the 10 longest films.

SELECT title, length
From film
ORDER BY length DESC
LIMIT 10;


# Use filtering techniques in order to:
#7.1 Retrieve all actors with the first name "SCARLETT".
SELECT first_name, last_name
From actor
WHERE first_name = 'SCARLETT';