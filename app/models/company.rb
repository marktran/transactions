# frozen_string_literal: true

class Company < Sequel::Model
  plugin :timestamps, update_on_create: true
  plugin :validation_helpers

  one_to_many :transactions

  def validate
    super
    validates_presence [:domain]
  end

  def enrich
    # Cache enrichment data for at least 7 days
    last_enrichment_in_days = (Time.now.to_i - enriched_at.to_i) / (24 * 60 * 60)
    return false if enriched_at && last_enrichment_in_days < 7

    response = Clearbit::Enrichment::Company.find(domain: domain, stream: true)
    return unless response

    update(
      name: response['name'],
      legal_name: response['legalName'],
      description: response['description'],
      location: response['location'],
      industry: response['category']['industry'],
      type: response['type'],
      logo_url: response['logo'],
      facebook_url: "https://facebook.com/#{response['facebook']['handle']}",
      twitter_url: "https://twitter.com/#{response['twitter']['handle']}",
      enriched_at: DateTime.now
    )
  end
end
