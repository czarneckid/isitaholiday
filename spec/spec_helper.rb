$LOAD_PATH << '.'

require 'sinatra'
require 'rack/test'
require 'rspec'

require 'isitcincodemayo/api'

set :environment, :test
set :run, false
set :raise_errors, true
set :logging, false

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|
  config.include Rack::Test::Methods
end
