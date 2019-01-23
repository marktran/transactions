# frozen_string_literal: true

class Plaid::ImportTransactions < Plaid::Base
  attr_reader :access_token, :transactions

  DAYS_TO_IMPORT = 90

  def self.call(access_token:)
    new(access_token).call
  end

  def initialize(access_token)
    @access_token = access_token
    @transactions = []
  end

  def call
    fetch_data
    import_data
    attach_companies
  end

  def fetch_data
    now = Date.today

    @plaid_transactions = client.transactions.get(
      access_token,
      now - DAYS_TO_IMPORT,
      now
    ).transactions
  end

  def import_data
    @plaid_transactions.each do |t|
      transaction = Transaction.create(
        date: t.date,
        account_id: t.account_id,
        transaction_id: t.transaction_id,
        transaction_type: t.transaction_type,
        amount: t.amount,
        description: t.name,
        pending: t.pending
      )

      transactions << transaction
    end
  end

  def attach_companies
    transactions.each do |transaction|
      Transaction::AttachCompany.for(transaction).call
    end
  end
end
