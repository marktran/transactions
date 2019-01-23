# frozen_string_literal: true

class RootController < ApplicationController
  get '/' do
    @transactions = Transaction.all
    slim :index
  end
end
