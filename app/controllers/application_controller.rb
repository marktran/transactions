# frozen_string_literal: true

class ApplicationController < Sinatra::Base
  set :root, File.expand_path('../../', __dir__)
  set :views, -> { File.join(root, 'app/views') }
  set :public_folder, -> { File.join(root, 'public') }

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @transactions = Transaction.order(Sequel.desc(:date)).all
    slim :index
  end

  post '/plaid/import_transactions' do
    access_token = Plaid::ExchangeToken.call(public_token: params[:public_token])
    Plaid::ImportTransactions.call(access_token: access_token)
    halt 200
  end
end
