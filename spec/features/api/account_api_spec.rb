# frozen_string_literal: true
require 'spec_helper'

module Bittrex::Api
  RSpec.describe 'Account API' do
    before {set_bittrex_api_token}

    it '/account/getbalances' do
      Account.getbalances.size.should > 1
    end

    it '/account/getbalance' do
      Account.getbalance('BTC').size.should > 1
    end

    it '/account/getdepositaddress' do
      Account.getdepositaddress('BTC').size.should > 1
    end

    xit '/account/withdraw' do
      pending #'This api is not ready for acceptance test ex) Account.withdraw(currency quantity address paymentid)'
    end

    it '/account/getorder' do
      last_order = Bittrex::Api::Account.getorderhistory.last
      Account.getorder(last_order['OrderUuid'])['OrderUuid'].should == last_order['OrderUuid']
    end

    it '/account/getorderhistory' do
      Account.getorderhistory.size.should > 0
    end

    it '/account/getwithdrawalhistory' do
      Account.getwithdrawalhistory.size.should == 0
    end

    it '/account/getdeposithistory' do
      Account.getdeposithistory.size.should > 0
    end
  end

end
