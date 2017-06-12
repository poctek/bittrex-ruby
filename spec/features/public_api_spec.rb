require 'spec_helper'

RSpec.describe 'Public Api' do
  before {set_bittrex_api_token}

  it '/public/getmarkets' do
    Bittrex::Market.all.size.should > 199
  end

  it '/public/getcurrencies' do
    Bittrex::Currency.all.size.should > 261
  end

  it '/public/getticker' do
    Bittrex::Quote.current('BTC-ETH').should be
  end

  it '/public/getmarketsummaries' do
    Bittrex::Summary.all.size.should > 199
  end

  xit '/public/getmarketsummary' do
    fail '미지원'
  end

  xit '/public/getmarkethistory' do
    fail '미지원'
  end
end

