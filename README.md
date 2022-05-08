# README

Project Title: Ecommerce app

Description: Simple Ecommerce app with CRUD operations on Users, Products and cart.Using stripe API to process payment for the purchase.
 
Technologies: Ruby on Rails, HTML,CSS, Bootstrap and Stripe.

Ruby version: 2.7.2
Rails version: 5.2.7

#Environment variables 

cloudinary:
   - cloud_name:
   - api_key:
   - api_secret:

stripe:
   - publishable_key:
   - secret_key:


#How to run application

1. Clone this repository
2. run 'bundle install'
3. run  'EDITOR="code --wait" bin/rails credentials:edit' and set your enviromental variables 
4. run 'rails db:create'
5. run 'rails db:migrate'
6. run 'rails s' to start your rails server.
