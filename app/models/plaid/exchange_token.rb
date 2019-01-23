# frozen_string_literal: true

class Plaid::ExchangeToken < Plaid::Base
  def self.call(public_token:)
    new.call(public_token)
  end

  def call(public_token)
    exchange_token_response = client.item.public_token.exchange(public_token)
    exchange_token_response['access_token']
  end
end
