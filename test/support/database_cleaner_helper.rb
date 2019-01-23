# frozen_string_literal: true

DatabaseCleaner.allow_remote_database_url = true
DatabaseCleaner.strategy = :truncation

module DatabaseCleanerHelper
  def before_setup
    super
    DatabaseCleaner.start
  end

  def after_teardown
    DatabaseCleaner.clean
    super
  end
end

class Minitest::Test
  include DatabaseCleanerHelper
end
