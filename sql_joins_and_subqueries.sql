--1. List all customers who live in Texas (use JOINS).
select *
from customer;

select *
from address;

select *
from city;

select customer.first_name, customer.last_name, customer.address_id 
from customer 
full join address 
on customer.address_id = address.address_id 
full join city 
on address.city_id = city.city_id
where district = 'Texas';

--2. Get all payments above $6.99 with the Customer's full name.
select *
from Customers; 

select *
from payment;

select Customers.customer_id, Customers.full_name, payment.customer_id, payment.amount 
from Customers 
full join payment 
on Customers.customer_id = payment.customer_id 
where amount >= 6.99;

--3. Show all customers names who have made payments over $175 (use Subqueries).
select *
from customer;

select *
from payment
where amount >=175;

select customer_id, staff_id, amount, rental_id, payment_id
from payment 
where amount >= 175;

select *
from customer 
where customer_id in ( 
						select customer_id 
						from payment 
						group by customer_id 
						having sum(amount) > 175
						order by sum(amount) desc);

					
--4. List all customers that live in Nepal (use the city table)
select *
from city;

select *
from country;

select *
from customer;

select *
from address;

select *
from city 
where country_id in (select country_id
						from country 
						where country = 'Nepal');
					
					
select *
from customer 
where address_id in (select address_id 
					  from address 
					  where city_id in (select city_id 
					  					  from city 
					  					  where country_id in (select country_id 
					  					  						from country 
					  					  						where country = 'Nepal')));
--5. Which staff member had the most transactions?
select *

select *
from staff 
where staff_id in (select staff_id
					from payment 
					group by staff_id
					having max(amount) >= 0);



--6. How many movies of each rating are there?
select *
from film;

select title, rating
from film;

select count(rating), title
from film
group by title
order by count(rating) desc;

select max(rating), title
from film 
group by title 
order by max(rating) asc;                                                                                     


--7. Show all customers who have made a single payment above $6.99 (use subqueries)
select *
from customer 
where customer_id in (select customer_id
						from payment 
						group by customer_id
						having sum(amount) > 6.99
						order by sum(amount) asc);


--8. How many free rentals did our stores give away?
select *
from rental 
where rental_id in (select rental_id 
					from payment 
					group by rental_id
					having min(amount) = 0
					order by min(amount) desc);


