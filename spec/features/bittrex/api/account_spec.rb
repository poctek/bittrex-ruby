# frozen_string_literal: true
require 'spec_helper'

module Bittrex::Api
  RSpec.describe 'Account API' do

    it '/account/getbalances' do
      Account.getbalances.size.should > 1
    end

    it '/account/getbalance' do
      Account.getbalance('BTC').size.should > 1
    end

    it '/account/getdepositaddress' do
      Account.getdepositaddress('BTC').size.should > 1
    end

    it '/account/withdraw' do
      pending 'This api is not ready for acceptance test'
      Account.withdraw(currency quantity address paymentid)
    end

    it '/account/getorder' do
      last_order = Bittrex::Api::Account.getorderhistory.last
      Account.getorder(last_order['OrderUuid'])['OrderUuid'].should == last_order['OrderUuid']
    end

    it '/account/getordersex' do
      size = 50
      orders = Account.getorderhistory.take(size)
      Account.getordersex(orders.map{|i| i['OrderUuid']}).should have(size).items
    end

    it '/account/getordersex' do
      size = 50
      orders = Account.getorderhistory.take(size)
      Account.getordersex(orders.map{|i| i['OrderUuid']}).should have(size).items
    end

    # https://bittrex.com/Api/v2.0/auth/orders/GetOrderHistory
    it '/account/getorderhistory' do
      Account.getorderhistory.size.should > 0
    end

    it '/account/getwithdrawalhistory' do
      Account.getwithdrawalhistory.size.should > 0
    end

    it '/account/getdeposithistory' do
      Account.getdeposithistory.size.should > 0
    end

    context 'error handling' do
      it 'return empty list on #getordersex' do
        Account.getordersex(['aaa']).should == []
      end

      it 'fire error on #getorder' do
        expect{Account.getorder('aaa')}.to raise_error(RuntimeError) do |e|
          e.message.should == '{"success"=>false, "message"=>"UUID_INVALID", "result"=>nil}'
        end
      end
    end
  end

end
