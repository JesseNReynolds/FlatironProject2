ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
require 'http'
require 'net/http'
require 'json'
require 'date'

Bundler.require(:default, ENV['SINATRA_ENV'])

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
)

require './app/controllers/application_controller'
require_all 'app'
