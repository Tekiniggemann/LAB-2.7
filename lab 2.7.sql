USE sakila;

-- 1 How many films are there for each of the categories in the category table. Use appropriate join to write this query
SELECT *, COUNT(film_id)
FROM sakila.category c
JOIN sakila.film_category f
ON c.category_id = f.category_id
GROUP BY f.category_id
ORDER BY COUNT(film_id) DESC;

-- 2 Display the total amount rung up by each staff member in August of 2005.
SELECT s.staff_id, SUM(amount) AS 'TOTAL AMOUNT'
FROM sakila.payment p
JOIN sakila.staff s
ON p.staff_id = s.staff_id
WHERE MONTH(p.payment_date) = 8 AND YEAR (p.payment_date) = 2005
GROUP BY s.staff_id;

-- 3 Which actor has appeared in the most films?
SELECT a.actor_id, first_name, last_name, COUNT(film_id)
FROM sakila.actor a
JOIN sakila.film_actor f
ON a.actor_id = f.actor_id
GROUP BY a.actor_id
ORDER BY COUNT(film_id) DESC
LIMIT 1;

-- 4 Most active customer (the customer that has rented the most number of films)
SELECT c.first_name, c.last_name, COUNT(rental_id)
FROM sakila.customer c
JOIN sakila.rental r
ON c.customer_id = r.customer_id
GROUP BY c.customer_id
ORDER BY COUNT(rental_id) DESC
LIMIT 1;

-- 5 Display the first and last names, as well as the address, of each staff member.
SELECT first_name, last_name, address
FROM sakila.staff s
JOIN sakila.address a
ON s.address_id = a.address_id;

-- 6 List each film and the number of actors who are listed for that film.
SELECT f.title, COUNT(actor_id)
FROM sakila.film f
JOIN sakila.film_actor fa
ON f.film_id = fa.film_id
GROUP BY f.film_id
ORDER BY f.title ASC;

-- 7 Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
SELECT c.last_name, c.first_name, SUM(amount) AS 'TOTAL PAID'
FROM sakila.payment p
JOIN sakila.customer c
ON p.customer_id = c.customer_id
GROUP BY c.last_name 
ORDER BY c.last_name ASC;

-- 8 List number of films per category.
SELECT c.name, COUNT(film_id)
FROM sakila.film_category f
JOIN sakila.category c 
ON f.category_id = c.category_id
GROUP BY c.name;
