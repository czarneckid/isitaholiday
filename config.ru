$LOAD_PATH << '.'

require 'rack'
require 'isitaholiday/api'
require 'isitaholiday/api_v2'

run Rack::Cascade.new([
  IsItAHoliday::API,
  IsItAHoliday::API::V2
])
