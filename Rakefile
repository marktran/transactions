# frozen_string_literal: true

require 'dotenv'
Dotenv.load '.env'

case ENV['RACK_ENV']
when 'test'
  Dotenv.load '.env.test'
else
  Dotenv.load '.env.development'
end

namespace :db do
  desc 'Generate migration'
  task :generate, [:filename] do |_task, args|
    filename = args.filename
    time = Time.now.strftime("%Y%m%d%H%M%S%L")
    sh "touch db/migrate/#{time}_#{filename}.rb"
  end

  desc 'Run migrations'
  task :migrate, [:version] do |_task, args|
    require 'sequel/core'
    Sequel.extension :migration
    version = args[:version].to_i if args[:version]
    Sequel.connect(ENV.fetch('DATABASE_URL')) do |db|
      Sequel::Migrator.run(db, 'db/migrate', target: version)
    end
  end
end
