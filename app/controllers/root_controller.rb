# frozen_string_literal: true

class RootController < ApplicationController
  get '/' do
    @transactions = Transaction.order(Sequel.desc(:date)).all
    slim :index
  end
end
