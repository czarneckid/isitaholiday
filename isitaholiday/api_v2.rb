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
    content_type :json, "application/json; charset=UTF-8"

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
      get '/:holiday' do
        params[:timezone] ||= 'America/New_York'

        Time.use_zone(params[:timezone]) do
          holidays = ::Holidays.on(Time.zone.now, :any, :observed, :informal)
          unless 'today'.eql?(params[:holiday])
            holidays = holidays.select {|holiday| holiday[:name].gsub(%r/ /, '_').underscore.eql?(params[:holiday])}
          end

          if holidays.size > 0
            {:status => true, :holidays => holidays}
          else
            {:status => false}
          end
        end
      end
    end
  end
end