ENV['SINATRA_ENV'] ||= "development"

configure :development do 
  set :database, 'sqlite3:db/development.db'
end

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
)

require './app'
require_all 'models'
