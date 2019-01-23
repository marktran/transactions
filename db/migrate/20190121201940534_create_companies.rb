# frozen_string_literal: true

Sequel.migration do
  change do
    create_table(:companies) do
      primary_key :id
      String :domain, null: false
      String :name
      String :legal_name
      String :description
      String :location
      String :industry
      String :type
      String :logo_url
      String :facebook_url
      String :twitter_url
      DateTime :enriched_at
      DateTime :created_at
      DateTime :updated_at
    end
  end
end
