# frozen_string_literal: true

require 'test_helper'

class TestTransaction < Minitest::Test
  def test_calculate_recurring_hook_updates_record
    transaction1 = Transaction.create(
      date: '2018-12-31',
      description: 'Madison Bicycle Shop',
      amount: 500
    )

    refute transaction1.reload.recurring

    transaction2 = Transaction.create(
      date: '2018-12-01',
      description: 'Madison Bicycle Shop',
      amount: 500
    )

    assert transaction1.reload.recurring
    assert transaction2.reload.recurring
  end

  def test_clean_description_returns_string
    transaction = Transaction.new(description: 'Uber 063015 SF**POOL**')
    assert_equal 'Uber', transaction.clean_description
  end
end
