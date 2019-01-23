# frozen_string_literal: true

ENV['RACK_ENV'] ||= 'development'

require 'bundler/setup'
require 'dotenv'

Bundler.require :default, ENV['RACK_ENV']

case ENV['RACK_ENV']
when 'test'
  Dotenv.load '.env.test', '.env'
else
  Dotenv.load '.env.development', '.env'
end

Sequel.connect ENV['DATABASE_URL']

require_all 'config/initializers'
require_all 'app'
