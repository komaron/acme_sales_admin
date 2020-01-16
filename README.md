# Acme Cult Hero Supplies
Sales Admin

### Background
Your company just acquired Acme Cult Hero Supplies. They have been using a CSV worksheet to track sales data, and you need to transform that into a web application to track revenue.

### Requirements
- Provides an interface for a user to upload the salesdata.csv file in this directory
- Parses and persists the information in the salesdata.csv file to a database
- Calculates and displays the total sales revenue to the user

## Dependencies
- Rails
- PostgreSQL
- Devise
- Bulma

## Getting Started
Install dependent gems.
`bundle install`

Set up the database
`rails db:setup`

Migrations
`rails db:migrate`

Launch a console
`bundle exec rails console`

Launch a rails server
`bundle exec rails server`

Run tests
`bundle exec rails test`

P.S. Yes I know the front end looks terrible :)
