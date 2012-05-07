require 'spec_helper'
require 'timecop'

describe 'IsItAHoliday::API' do
  def app
    IsItAHoliday::API
  end
  
  describe 'status' do
    describe '#ping' do
      it 'should respond with pong' do
        get '/api/v1/status/ping'
        last_response.should be_ok
        JSON.parse(last_response.body)['status'].should == 'pong'
      end
    end
  end

  describe 'check' do
    describe '/:holiday/' do
      it 'should respond correctly if it is Cinco de Mayo' do
        Timecop.freeze(Time.local(2012, 5, 5, 12, 0, 0)) do
          get '/api/v1/check/cincodemayo/'
          last_response.should be_ok
          JSON.parse(last_response.body).tap do |json|
            json['status'].should == true
            json['name'].should == 'Cinco de Mayo'
          end

          get '/api/v1/check/CincoDeMayo/'
          last_response.should be_ok
          JSON.parse(last_response.body).tap do |json|
            json['status'].should == true
            json['name'].should == 'Cinco de Mayo'
          end
        end
      end

      it 'should respond correctly if it is Christmas' do
        Timecop.freeze(Time.local(2012, 12, 25, 12, 0, 0)) do
          get '/api/v1/check/christmas/'
          last_response.should be_ok
          JSON.parse(last_response.body).tap do |json|
            json['status'].should == true
            json['name'].should == 'Christmas'
          end
        end
      end

      it 'should respond correctly if it is Halloween' do
        Timecop.freeze(Time.local(2012, 10, 31, 12, 0, 0)) do
          get '/api/v1/check/halloween/'
          last_response.should be_ok
          JSON.parse(last_response.body).tap do |json|
            json['status'].should == true
            json['name'].should == 'Halloween'
          end
        end
      end

      it 'should respond correctly if it is an unknown holiday' do
        get '/api/v1/check/gooble-gobble/'
        last_response.should be_ok
        JSON.parse(last_response.body).tap do |json|
          json['status'].should == false
          json['name'].should == 'Unknown holiday'
        end
      end

      it 'should respond correctly if it is Cinco de Mayo with a timezone parameter' do
        Timecop.freeze(Time.local(2011, 5, 5, 12, 0, 0)) do
          get '/api/v1/check/cincodemayo', :timezone => 'America/Los_Angeles'
          last_response.should be_ok
          JSON.parse(last_response.body).tap do |json|
            json['status'].should == true
            json['name'].should == 'Cinco de Mayo'
          end
        end
      end

      it 'should respond correctly if it is not Cinco de Mayo' do
        Timecop.freeze(Time.local(2012, 5, 4, 12, 0, 0)) do
          get '/api/v1/check/cincodemayo'
          last_response.should be_ok
          JSON.parse(last_response.body).tap do |json|
            json['status'].should == false
            json['name'].should == 'Cinco de Mayo'
          end
        end
      end

      it 'should respond correctly about Thanksgiving' do
        Timecop.freeze(Time.local(2012, 11, 22, 12, 0, 0)) do
          get '/api/v1/check/thanksgiving'
          last_response.should be_ok
          JSON.parse(last_response.body).tap do |json|
            json['status'].should == true
            json['name'].should == 'Thanksgiving'
          end
        end

        Timecop.freeze(Time.local(2012, 11, 21, 12, 0, 0)) do
          get '/api/v1/check/thanksgiving'
          last_response.should be_ok
          JSON.parse(last_response.body).tap do |json|
            json['status'].should == false
            json['name'].should == 'Thanksgiving'
          end
        end
      end
    end
  end
end