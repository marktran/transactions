# frozen_string_literal: true

class Company < Sequel::Model
  plugin :timestamps, update_on_create: true
  plugin :validation_helpers

  one_to_many :transactions

  def validate
    super
    validates_presence [:domain]
  end
end
