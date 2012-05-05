$LOAD_PATH << '.'

require 'rack/test'
require 'rspec'

require 'isitcincodemayo/api'

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|
  config.include Rack::Test::Methods
end
