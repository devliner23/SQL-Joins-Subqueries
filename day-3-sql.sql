-- Day 3 Questions 

select first_name, last_name, district
from customer 
full join address 
on customer.address_id = address.address_id 
where district = 'Texas';


select first_name, last_name, amount, customer.customer_id 
from customer 
right join payment 
on customer.customer_id = payment.customer_id 
where amount > 6.99;

select customer.first_name, customer.last_name, country
from customer
full join address 
on customer.address_id = address.address_id 
full join city 
on address.city_id = city.city_id 
full join country 
on city.country_id = country.country_id 
where country = 'Nepal';

select staff.first_name, staff.last_name, staff.staff_id, payment_id
from staff 
full join payment
on staff.staff_id = payment.staff_id
group by first_name, last_name, staff.staff_id, payment_id

select first_name, last_name from staff 
where staff_id in (
	select staff_id
	from payment 
	group by staff_id
	having count(payment_id) > 1
	order by count(payment_id)
)

select * from film_category
select * from film

select rating, sum(film_id)
from film 
group by rating 
having sum(film_id) > 1
order by sum(film_id)

select first_name, last_name from customer 
where customer_id in (
	select customer_id 
	from payment 
	group by payment, customer_id
	having count(payment) = 1
	order by payment
)

select first_name, last_name, amount 
from customer 
full join payment 
on customer.customer_id = payment.customer_id 
group by first_name, last_name, amount
having amount > 6.99
order by amount

select rental.rental_id, rental.customer_id 
from rental 
full join payment 
on rental.customer_id = payment.customer_id 
group by rental.rental_id, rental.customer_id, amount
having amount = 0 
order by customer_id