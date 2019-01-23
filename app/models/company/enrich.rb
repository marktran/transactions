# frozen_string_literal: true

class Company::Enrich
  attr_reader :company

  def self.for(company)
    new(company)
  end

  def initialize(company)
    @company = company
  end

  def call
    # Cache enriched data for at least 7 days
    last_enrichment_in_days = (Time.now.to_i - company.enriched_at.to_i) / (24 * 60 * 60)
    return false if company.enriched_at && last_enrichment_in_days < 7

    return unless enrichment_data
    update_company
  end

  private

  def enrichment_data
    @enrichment_data ||= Clearbit::Enrichment::Company.find(
      domain: company.domain,
      stream: true
    )
  end

  def update_company
    company.update(
      name: enrichment_data['name'],
      legal_name: enrichment_data['legalName'],
      description: enrichment_data['description'],
      location: enrichment_data['location'],
      industry: enrichment_data['category']['industry'],
      type: enrichment_data['type'],
      logo_url: enrichment_data['logo'],
      facebook_url: "https://facebook.com/#{enrichment_data['facebook']['handle']}",
      twitter_url: "https://twitter.com/#{enrichment_data['twitter']['handle']}",
      enriched_at: DateTime.now
    )
  end
end
