# frozen_string_literal: true

require 'test_helper'

class TestCompany < Minitest::Test
  def test_domain_presence_validation
    company = Company.new(domain: nil)
    refute company.valid?
    assert_equal 'is not present', company.errors[:domain].first
  end
end
