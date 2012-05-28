$LOAD_PATH << '.'

require 'rack/test'
require 'rspec'

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|
  config.include Rack::Test::Methods
end
