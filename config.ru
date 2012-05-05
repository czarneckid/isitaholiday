$LOAD_PATH << '.'

require 'rack'
require 'isitcincodemayo/api'

run Rack::Cascade.new([
  IsItCincoDeMayo::API
])
