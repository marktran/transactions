# frozen_string_literal: true

require_relative './config/environment'

map('/') { run RootController }
map('/plaid') { run PlaidController }
