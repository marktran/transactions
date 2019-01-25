# frozen_string_literal: true

require 'test_helper'

class TestApplicationController < Minitest::Test
  include Rack::Test::Methods

  def app
    ApplicationController
  end

  def test_plaid_import_transactions
    VCR.use_cassette('plaid_exchange_token_import_transactions') do
      public_token = 'public-sandbox-4edeef52-93bd-466c-9cb8-f0438a876351'
      post '/plaid/import_transactions', public_token: public_token
      assert_equal 48, Transaction.count
    end
  end
end
