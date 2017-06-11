require 'spec_helper'

RSpec.describe 'Account API' do
  before {set_bittrex_api_token}

  it '/account/getbalances' do
    Bittrex::Wallet.all.size.should > 1
  end

  it '/account/getbalance' do
    ap Bittrex::Wallet.get(currency: 'BTC')
  end

  it '/account/getdepositaddress' do
    fail '미지원 '
  end

  it '/account/withdraw' do
    fail '미지원'
  end

  it '/account/getorder' do
    fail '미지원'
  end

  it '/account/getorderhistory' do
    Bittrex::Order.history.should be
  end

  it '/account/getwithdrawalhistory' do
    Bittrex::Withdrawl.all.size.should == 0
  end

  it '/account/getdeposithistory' do
    Bittrex::Deposit.all.size.should > 1
  end
end

