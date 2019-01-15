# Repository Context

My first time building a REST API, with a language and framework (Ruby on Rails) that I've never used before. By: Abdeali Daginawala

# Environment Setup

There a quite a few steps to set up the API for local usuage, so bear with me. I used gems mysql2 and faker, but when the project is cloned, the gems should come with it. Note: I use Git Bash as my command line interface.

1. Install Ruby on Rails (I was doing this on Windows, so I used: http://railsinstaller.org/en)

2. A local database hoster for MySQL (I used Xampp: https://www.apachefriends.org/index.html)
    * Since Ruby uses database migration, and this project is local, there are some additional steps to set up the API.
    * Through the Xampp control panel, start Apache and MySQL.
    * Navigate to localhost/phpmyadmin and create a database called: coffee_market
    * Note: the username used in my project is root, with no password.

3. Clone the project locally (git clone https://github.com/DevelopersTopHat/coffee_market_API.git)

4. Run the command: rails server
    * This will start hosting the app locally

5. Run the command: rails db:migrate
    * This should create the table in the mysql database
    * You can check that the table has been created through phpmyadmin 

6. Populate the database with this command: rails db:seed
    * Using the faker gem, I populate the database with coffee products
    * If you check the table in phpmyadmin, it database table should have rows of coffee products

7. At this point all the set up should be complete, but you can run the command 'rails routes' to see the various endpoints that were made.  

# Querying the API

If all the setup steps were completed, the API should now be query-able. I used Postman to query the API (https://www.getpostman.com).

Before you can query the API, the localhost rails server should be active as well as the MySQL database.

1. rails server

2. Through the Xampp control panel, start MySQL.

# Challenge Criteria
```
To query for all coffee products in the table:

GET http://localhost:3000/api/v1/products
```
```
To query a single item in the table (the number value at the end is the item ID):

GET http://localhost:3000/api/v1/products/5
```
```
To add a new item (row) to the database table:

POST http://localhost:3000/api/v1/products

With the header key: Content-Type
and the header value: application/json

The body of the Json must contain the 
attributes: title (string), price (float), inventory_count (integer), description (text)
```
```
To update an item (row) in the database table:

PUT http://localhost:3000/api/v1/products/1

With the header key: Content-Type
and the header value: application/json

The body of the Json can contain any of the following 
attributes: title (string), price (float), inventory_count (integer), description (text)
```
```
To query all in-stock items:

GET http://localhost:3000/api/v1/in_stock
```
```
To query and purchase an item:

PUT http://localhost:3000/api/v1/purchase/1

Note: the item must be in the table and in-stock in order to be purchased, or the query will fail.
```