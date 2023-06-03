USE sakila;

CREATE TABLE rentals_may AS
SELECT rental_id, rental_date, inventory_id, customer_id, return_date, staff_id, last_update
FROM sakila.rental;

DELETE FROM sakila.rentals_may;

INSERT INTO sakila.rentals_may (rental_id, rental_date, inventory_id, customer_id, return_date, staff_id, last_update) 
SELECT rental_id, rental_date, inventory_id, customer_id, return_date, staff_id, current_date() FROM sakila.rental
WHERE MONTH(rental_date) = 5;

CREATE TABLE rentals_june AS
SELECT rental_id, rental_date, inventory_id, customer_id, return_date, staff_id, last_update
FROM sakila.rental;

DELETE FROM sakila.rentals_june;

INSERT INTO sakila.rentals_june (rental_id, rental_date, inventory_id, customer_id, return_date, staff_id, last_update) 
SELECT rental_id, rental_date, inventory_id, customer_id, return_date, staff_id, current_date() FROM sakila.rental
WHERE MONTH(rental_date) = 6;

SELECT MONTH(rental_date), COUNT(rental_id) FROM sakila.rentals_may
GROUP BY MONTH(rental_date);

SELECT MONTH(rental_date), COUNT(rental_id) FROM sakila.rentals_june
GROUP BY MONTH(rental_date);


