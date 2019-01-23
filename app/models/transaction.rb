# frozen_string_literal: true

class Transaction < Sequel::Model
  plugin :timestamps, update_on_create: true
  many_to_one :company

  def after_create
    super
    Transaction::CalculateRecurring.for(self).call
  end

  def clean_description
    description
      .then { |s| s.gsub /\d{4,}/, '' }
      .then { |s| s.gsub /..\*\*POOL\*\*/, '' }
      .then { |s| s.squeeze ' ' }
      .then(&:strip)
  end
end
