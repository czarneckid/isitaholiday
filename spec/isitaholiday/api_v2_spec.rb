require 'spec_helper'
require 'timecop'
require 'isitaholiday/api_v2'

describe 'IsItAHoliday::API::V2' do
  def app
    IsItAHoliday::API::V2
  end

  describe 'holidays' do
    describe 'today' do
      it 'should respond with all the holidays on may 31st' do
        Timecop.freeze(Time.local(2012, 5, 28, 12, 0, 0)) do
          get '/api/v2/holidays/today'
          last_response.should be_ok
          JSON.parse(last_response.body).tap do |json|
            json['status'].should == true
            json['holidays'].size.should == 8
          end
        end
      end
    end

    describe '/:holiday/' do
      it 'should respond correctly if it is Valentines Day' do
        Timecop.freeze(Time.local(2012, 2, 14, 12, 0, 0)) do
          get "/api/v2/holidays/valentine's_day/"
          last_response.should be_ok
          JSON.parse(last_response.body).tap do |json|
            json['status'].should == true
            json['holidays'].size.should == 1
          end
        end
      end

      it 'should respond correctly if it is Cinco de Mayo' do
        Timecop.freeze(Time.local(2012, 5, 5, 12, 0, 0)) do
          get '/api/v2/holidays/cinco_de_mayo/'
          last_response.should be_ok
          JSON.parse(last_response.body).tap do |json|
            json['status'].should == true
            json['holidays'].size.should == 1
          end
        end
      end

      it 'should respond correctly if it is Christmas' do
        Timecop.freeze(Time.local(2012, 12, 25, 12, 0, 0)) do
          get '/api/v2/holidays/christmas_day/'
          last_response.should be_ok
          JSON.parse(last_response.body).tap do |json|
            json['status'].should == true
            json['holidays'].size.should == 4
          end
        end
      end

      it 'should respond correctly if it is not a holiday' do
        Timecop.freeze(Time.local(2012, 12, 2, 12, 0, 0)) do
          get '/api/v2/holidays/foo_bar/'
          last_response.should be_ok
          JSON.parse(last_response.body).tap do |json|
            json['status'].should == false
          end
        end
      end
    end
  end
end