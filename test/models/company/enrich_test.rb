# frozen_string_literal: true

require 'test_helper'

class TestCompanyEnrich < Minitest::Test
  def test_enrich_updates_company
    VCR.use_cassette('lyft_enrichment') do
      company = Company.create(domain: 'lyft.com')
      Company::Enrich.for(company).call

      assert_equal 'lyft.com', company.domain
      assert_equal 'Lyft', company.name
      assert_equal 'Lyft Inc.', company.legal_name
      assert_equal 'Lyft is an on-demand transportation company based in San Francisco, California.', company.description
      assert_equal 'San Francisco State University, Creative Arts, 1600 Holloway Ave, San Francisco, CA 94132, USA', company.location
      assert_equal 'Diversified Consumer Services', company.industry
      assert_equal 'private', company.type
      assert_equal 'https://logo.clearbit.com/lyft.com', company.logo_url
      assert_equal 'https://facebook.com/lyft', company.facebook_url
      assert_equal 'https://twitter.com/lyft', company.twitter_url
      assert_kind_of Time, company.enriched_at
      assert_kind_of Time, company.created_at
      assert_kind_of Time, company.updated_at
    end
  end

  def test_duplicate_enrich_calls
    VCR.use_cassette('lyft_enrichment') do
      company = Company.create(domain: 'lyft.com')
      Company::Enrich.for(company).call
      refute Company::Enrich.for(company).call
    end
  end
end
