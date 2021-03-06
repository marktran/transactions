# Transactions

## Overview
This app fetches [test] transactions from Plaid's sandbox environment, enriches the company data using [Clearbit](https://clearbit.com), and provides a UI for viewing the transactions

![Screenshot](https://mrktrn.com/scrnshts/s20192401-224434.488920239.png)
![Screenshot](https://mrktrn.com/scrnshts/s20192401-224505.440705454.png)

## Getting started
1. `cp .env.example .env` then fill in vars in `.env`
2. `bundle exec rake db:migrate`
3. `bundle exec foreman start`
4. http://localhost:9292

## Testing
1. `env RACK_ENV=test bundle exec rake db:migrate`
2. `bundle exec rake test`

## Stack
- Sinatra
- [Sequal](https://sequel.jeremyevans.net)
- SQLite
- [Slim Templates](http://slim-lang.com)
- [Stimulus JS](https://stimulusjs.org)
- [Tachyons](https://tachyons.io)
- MiniTest
