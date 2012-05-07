require 'grape'
require 'active_support'
require 'active_support/time'
require 'time'
require 'tzinfo'
require 'isitaholiday/holidays'

module IsItAHoliday
  class API < Grape::API    
    prefix 'api'
    version 'v1'
    format :json
    error_format :json
    rescue_from :all

    resource :status do
      get '/ping' do
        {:status => 'pong'}
      end
    end

    resource :check do
      get '/:holiday' do
        params[:timezone] ||= 'America/New_York'

        holiday_information = HOLIDAYS[params[:holiday].downcase.to_sym]
        if holiday_information
          is_it_the_holiday = false

          case holiday_information[:type]
          when :month_day
            Time.use_zone(params[:timezone]) do
              is_it_the_holiday = (Time.zone.now.day == holiday_information[:rules][:day] && Time.zone.now.month == holiday_information[:rules][:month])
            end
          end

          {:status => is_it_the_holiday, :name => holiday_information[:name]}
        else
          {:status => false, :name => 'Unknown holiday'}
        end
      end
    end
  end
end