source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.0'

gem 'clearbit'
gem 'plaid'
gem 'racksh'
gem 'rake'
gem 'require_all'
gem 'sequel'
gem 'sinatra'
gem 'sinatra-contrib'
gem 'slim'
gem 'sqlite3'

group :development do
  gem 'dotenv'
  gem 'foreman'
end

group :test do
  gem 'database_cleaner', github: 'DatabaseCleaner/database_cleaner'
  gem 'minitest'
  gem 'rack-test'
  gem 'vcr'
  gem 'webmock'
end
