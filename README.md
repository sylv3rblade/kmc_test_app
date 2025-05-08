# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
## Dependencies
- Ruby 3.4.1
- Rails 8.0.2
- Postgresql

## Initial setup
```
bundle install
rails db:setup
```

## Running locally
```
rails tailwindcss:watch
rails s

or simply use foreman
bin/dev
```

## Running tests
```
bin/rspec
```