USE sakila;

#1 Step 1: Create a View
# First, create a view that summarizes rental information for each customer. The view should include the customer's ID, name, email address, and total number of rentals (rental_count).
CREATE VIEW rental_summary AS
SELECT c.customer_id, CONCAT(c.first_name, c.last_name) AS customer_name,
    c.email, COUNT(r.rental_id) AS rental_count
FROM customer as c
JOIN rental as r 
ON c.customer_id = r.customer_id
GROUP BY c.customer_id;
    
SELECT * FROM rental_summary;

# Step 2: Create a Temporary Table
# Next, create a Temporary Table that calculates the total amount paid by each customer (total_paid). The Temporary Table should use the rental summary view created in Step 1 to join with the payment table and calculate the total amount paid by each customer.
-- Create a temporary table for total amount paid
CREATE TEMPORARY TABLE temp_total_paid AS
SELECT customer_id, SUM(amount) as total_paid 
FROM rental_summary
INNER JOIN payment  
USING (customer_id)
GROUP BY customer_id;

SELECT * 
FROM temp_total_paid;

# Step 3: Create a CTE and the Customer Summary Report
# Create a CTE that joins the rental summary View with the customer payment summary Temporary Table created in Step 2. The CTE should include the customer's name, email address, rental count, and total amount paid.


WITH cte_report AS (
SELECT customer_name, email, rental_count, total_paid
FROM rental_summary
INNER JOIN payment
USING(customer_id))
SELECT customer_name, email, rental_count, total_paid, total_paid / rental_count
FROM cte_report;