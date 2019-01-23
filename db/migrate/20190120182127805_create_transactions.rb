# frozen_string_literal: true

Sequel.migration do
  change do
    create_table(:transactions) do
      primary_key :id
      Integer :company_id
      Date :date
      String :account_id
      String :transaction_id
      String :transaction_type
      Decimal :amount
      String :description
      Boolean :pending
      Boolean :recurring, default: false
      DateTime :created_at
      Datetime :updated_at
    end
  end
end
