# Jungle

A mini e-commerce application built with Rails 6.1 for purposes of teaching Rails by example. 
Features category and item pages which can be used to browse plants. 
After adding plants to a cart, view my cart and pay with stripe. 
Admins may create new products and product categories using a built-in form. 


## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.
Use any date in the future for Credit Card expiry date.
Use any numbers for Credit Card security pin.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe
- Bcrypt
- Cypress-rails

## Example 

Welcome!
![start of home page](docs/start_of_home_page.png)

Browsing plants
![end of home page](docs/end_of_home_page.png)

My cart
![my cart](docs/start_of_my_cart.png)

Ready to check out
![end of my cart](docs/end_of_my_cart.png)

Pay with stripe
![Pay with stripe](docs/pay_with_stripe.png)

Order confirmation
![Order confirmation](docs/order_confirmation.png)