$LOAD_PATH << '.'

require 'rack'
require 'isitaholiday/api'

run Rack::Cascade.new([
  IsItAHoliday::API
])
