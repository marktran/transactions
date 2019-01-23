# frozen_string_literal: true

require 'test_helper'

class TestTransactionCalculateRecurring < Minitest::Test
  def test_call_updates_recurring_transactions
    transaction1 = Transaction.create(
      date: '2018-12-31',
      description: 'Madison Bicycle Shop',
      amount: 500
    )

    transaction2 = Transaction.create(
      date: '2018-12-01',
      description: 'Madison Bicycle Shop',
      amount: 500
    )

    transaction3 = Transaction.create(
      date: '2018-11-01',
      description: 'Madison Bicycle Shop',
      amount: 500
    )

    Transaction::CalculateRecurring.for(transaction3).call
    assert transaction1.reload.recurring
    assert transaction2.reload.recurring
    assert transaction3.reload.recurring
  end
end
