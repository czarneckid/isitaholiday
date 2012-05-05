require 'grape'
require 'active_support'
require 'active_support/time'
require 'time'
require 'tzinfo'

module IsItCincoDeMayo
  class API < Grape::API    
    prefix 'api'
    version 'v1'
    error_format :json
    rescue_from :all

    resource :status do
      get '/ping' do
        {:status => 'pong'}
      end
    end

    resource :check do
      get 'isitcincodemayo' do
        params[:timezone] ||= 'America/New_York'

        isitcincodemayo = false
        Time.use_zone(params[:timezone]) do
          isitcincodemayo = Time.zone.now.day == 5 && Time.zone.now.month == 5
        end

        {:status => isitcincodemayo}
      end
    end
  end
end