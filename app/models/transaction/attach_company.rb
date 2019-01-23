# frozen_string_literal: true

class Transaction::AttachCompany
  attr_reader :transaction

  def self.for(transaction)
    new(transaction)
  end

  def initialize(transaction)
    @transaction = transaction
  end

  def call
    return unless domain

    company = Company.find_or_create(domain: domain)
    Company::Enrich.for(company).call
    transaction.update(company: company)
  end

  private

  def domain
    @domain ||= begin
      response = Clearbit::NameDomain.find(name: transaction.clean_description)
      response&.dig('domain')
    end
  end
end
