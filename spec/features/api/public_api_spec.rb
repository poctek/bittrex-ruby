require 'spec_helper'

module Bittrex::Api
  RSpec.describe 'Public Api' do
    before {set_bittrex_api_token}

    it '/public/getmarkets' do
      Public.getmarkets.size.should > 100
    end

    it '/public/getcurrencies' do
      Public.getcurrencies.size.should > 100
    end

    it '/public/getticker' do
      Public.getticker('BTC-ETH').should be
    end

    it '/public/getmarketsummaries' do
      Public.getmarketsummaries.size.should > 100
    end

    it '/public/getmarketsummary' do
      Public.getmarketsummary('BTC-ETH').first.tap do |o|
        o['High'].should be
        o['MarketName'].should == 'BTC-ETH'
      end
    end

    it '/public/getorderbook' do
      Public.getorderbook('BTC-ETH', 'both', 50).tap do |o|
        o.size.should == 2
        o['buy'].size.should >= 50
        o['sell'].size.should >= 50
      end
    end

    it '/public/getmarkethistory' do
      Public.getmarkethistory('BTC-ETH').size.should > 10
    end

    context 'Error handling' do
      it 'No market' do
        expect{Public.getmarkethistory('AAA-BTS')}.to raise_error(RuntimeError) do |e|
          e.message.should == '{"success"=>false, "message"=>"INVALID_MARKET", "result"=>nil}'
        end
      end
    end
  end
end

