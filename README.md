## Installation

You will need:
* Ruby 2.7.1
* PostgreSQL 12
* Ruby on Rails 6.0.3.3

Then run this following commands:
```bash
bundle install
bundle exec rails db:create db:migrate
bundle exec rails server
```


## Specs
All tests were made using RSpec

```bash
bundle exec rspec
```

## Application URL
https://cashback-ruby.herokuapp.com/

## Functionalities

| Path | Description |
| ------ | ----------- |
| /   | Redirect to admin offers index  |
| /user/offers | Show all User Offers  |
| /admin/offers | Show all Admin Offers Operations  |
