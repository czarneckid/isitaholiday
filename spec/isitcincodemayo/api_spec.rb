require 'spec_helper'
require 'timecop'

describe 'IsItCincoDeMayo::API' do
  def app
    IsItCincoDeMayo::API
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
    describe '#isitcincodemayo/:timezone' do
      it 'should respond correctly if it is Cinco de Mayo' do
        get '/api/v1/check/isitcincodemayo'
        last_response.should be_ok
        JSON.parse(last_response.body)['status'].should == true
      end

      it 'should respond correctly if it is Cinco de Mayo with a timezone parameter' do
        get '/api/v1/check/isitcincodemayo', :timezone => 'America/Los_Angeles'
        last_response.should be_ok
        JSON.parse(last_response.body)['status'].should == true
      end

      it 'should respond correctly if it is not Cinco de Mayo' do
        Timecop.freeze(Time.local(2012, 5, 4, 12, 0, 0)) do
          get '/api/v1/check/isitcincodemayo'
          last_response.should be_ok
          JSON.parse(last_response.body)['status'].should == false
        end
      end
    end
  end
end