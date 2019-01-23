# frozen_string_literal: true

class PlaidController < ApplicationController
  post '/import_transactions' do
    access_token = Plaid::ExchangeToken.call(public_token: params[:public_token])
    Plaid::ImportTransactions.call(access_token: access_token)
    halt 200
  end
end
