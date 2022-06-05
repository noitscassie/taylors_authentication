require 'rubygems'
require 'bundler/setup'

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts 'Run `bundle install` to install missing gems'
  exit e.status_code
end

require 'taylors_authentication'
require 'active_record'
require 'active_support'

require 'minitest/autorun'
require 'pry'

db_config = YAML.load_file(File.expand_path('database.yml', __dir__)).fetch('postgresql')
ActiveRecord::Base.establish_connection(db_config)

def setup_db
  ActiveRecord::Base.connection.create_table :sessions do |t|
    t.column :created_at, :datetime
    t.column :updated_at, :datetime
  end
end

def teardown_db
  tables =
    if ActiveRecord::VERSION::MAJOR >= 5
      ActiveRecord::Base.connection.data_sources
    else
      ActiveRecord::Base.connection.tables
    end

  tables.each do |table|
    ActiveRecord::Base.connection.drop_table(table)
  end
end

class Session < ActiveRecord::Base
  self.table_name = 'sessions'
  authenticable
end
