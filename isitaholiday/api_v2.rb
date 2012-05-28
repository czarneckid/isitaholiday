require 'grape'
require 'active_support'
require 'active_support/time'
require 'time'
require 'tzinfo'
require 'chronic'
require 'holidays'

::Holidays.load_all

module IsItAHoliday
  class API::V2 < Grape::API
    prefix 'api'
    version 'v2'
    format :json
    error_format :json
    rescue_from :all

    resource :status do
      get '/ping' do
        {:status => 'pong'}
      end
    end

    resource :holidays do
      get '/today' do
        params[:timezone] ||= 'America/New_York'

        Time.use_zone(params[:timezone]) do
          @holidays = ::Holidays.on(Time.zone.now, :any)
        end

        {:status => true, :holidays => @holidays}
      end

      get '/:holiday' do
        params[:timezone] ||= 'America/New_York'

        Time.use_zone(params[:timezone]) do
          @holidays = ::Holidays.on(Time.zone.now, :any, :observed, :informal)
          holiday_information = @holidays.select {|holiday| holiday[:name].gsub(%r/ /, '_').underscore.eql?(params[:holiday])}
          if holiday_information.size > 0
            {:status => true, :holidays => holiday_information}
          else
            {:status => false}
          end
        end
      end
    end
  end
end