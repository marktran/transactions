# frozen_string_literal: true

require 'rake/testtask'
require 'dotenv'

case ENV['RACK_ENV']
when 'test'
  Dotenv.load '.env.test', '.env'
when 'development'
  Dotenv.load '.env.development', '.env'
else
  puts 'Error: no environment specified (`env RACK_ENV=`)'
  return false
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

Rake::TestTask.new(:test) do |t|
  t.libs << 'test'
  t.test_files = FileList['test/**/*_test.rb']
end

task default: :test
