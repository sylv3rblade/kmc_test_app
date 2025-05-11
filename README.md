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
## Required dependencies
- Ruby 3.4.1
- Rails 8.0.2
- Postgresql
- Redis

## Initial setup
```
bundle install
rails db:setup
```

## Running locally
```
#run each one individually
rails tailwindcss:watch
rails s
sidekiq

or simply use foreman
bin/dev # need to use pry-remote for binding.pry to work
```

## Running tests
```
bin/rspec
```

## extra notes
there is a bug with updating the creator, because i'm using the creator count as the index temporarily (havent thought of a good way to handle it), when you render it's fine but when you update the creator, it might not match the correct odd/even class


