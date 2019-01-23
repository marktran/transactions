# frozen_string_literal: true

require 'test_helper'

class TestTransactionAttachCompany < Minitest::Test
  def test_call_attaches_enriched_company
    VCR.use_cassette('uber_attach_company') do
      transaction = Transaction.create(description: 'Uber 063015 SF**POOL**')
      Transaction::AttachCompany.for(transaction).call
      assert_equal 'uber.com', transaction.company.domain
      assert_equal 'https://twitter.com/Uber', transaction.company.twitter_url
    end
  end
end
