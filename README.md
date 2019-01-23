# Transactions

## Overview
This app fetches [test] transactions from Plaid's sandbox environment, enriches the company data using [Clearbit](https://clearbit.com), and provides a UI for viewing the transactions

## Tech stack
- Sinatra
- [Sequal](https://sequel.jeremyevans.net)
- SQLite
- [Slim Templates](http://slim-lang.com)
- MiniTest

## Getting started
1. `cp .env.example .env` then fill in vars in `.env`
2. `env RACK_ENV=development rake db:migrate`
3. `bundle exec foreman start`
4. http://localhost:9292

## Testing
1. `env RACK_ENV=test rake db:migrate`
2. `bundle exec rake test`
