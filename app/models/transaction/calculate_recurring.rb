# frozen_string_literal: true

class Transaction::CalculateRecurring
  attr_reader :transaction

  def self.for(transaction)
    new(transaction)
  end

  def initialize(transaction)
    @transaction = transaction
  end

  def call
    return false if days_between_transactions.empty?
    return false unless days_between_transactions.all? { |x| x == 30 }
    similar_transactions.each { |x| x.update(recurring: true) }
  end

  private

  def similar_transactions
    @similar_transactions ||= Transaction
      .where(description: transaction.description, amount: transaction.amount)
      .order(:date)
      .all
  end

  def days_between_transactions
    similar_transactions.map.with_index do |x, i|
      (i - 1).negative? ? nil : (x.date - similar_transactions[i-1].date).to_i
    end.compact
  end
end
