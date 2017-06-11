require 'spec_helper'

RSpec.describe 'Market Api' do
  before {set_bittrex_api_token}

  it '/market/buylimit' do
    fail '미지원'
  end

  it '/market/selllimit' do
    fail '미지원'
  end

  it '/market/cancel' do
    fail '미지원'
  end

  it '/market/getopenorders' do
    Bittrex::Order.open.size.should > 0
  end
end
