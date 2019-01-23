# frozen_string_literal: true

require 'test_helper'

class TestPlaidImport < Minitest::Test
  def test_call_imports_transactions
    VCR.use_cassette('plaid_import_transactions') do
      access_token = 'access-sandbox-1fba8b33-ceff-4374-8c9f-f4d10476277e'
      Plaid::Import.call(access_token: access_token)
      transactions = Transaction.all
      assert_equal 48, transactions.size
      assert_equal 'United Airlines', transactions[5].description
      assert_equal 'United Airlines, Inc.', transactions[5].company.legal_name
    end
  end
end
