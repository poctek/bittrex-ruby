# frozen_string_literal: true
require 'spec_helper'

module Bittrex
  RSpec.describe 'Account API' do
    before {set_bittrex_api_token}

    it '/account/getbalances' do
      Wallet.all.size.should > 1
    end

    it '/account/getbalance' do
      Wallet.get(currency: 'BTC').tap do |o|
        o.currency.should == 'BTC'
        o.should be
      end
    end

    it '/account/getdepositaddress' do
      Bittrex.client.get('account/getdepositaddress', currency: 'BTC')['Currency'].should == 'BTC'
    end

    xit '/account/withdraw' do
      fail '미지원'
    end

    it '/account/getorder' do
      last_order = Order.history.last
      Order.get(last_order.id).id.should == last_order.id
    end

    it '/account/getorderhistory' do
      Order.history.size.should > 1
    end

    it '/account/getwithdrawalhistory' do
      Withdrawl.all.size.should == 0
    end

    it '/account/getdeposithistory' do
      Deposit.all.size.should > 1
    end
  end

end
