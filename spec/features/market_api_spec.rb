require 'spec_helper'

RSpec.describe 'Market Api' do
  before {set_bittrex_api_token}

  xit '/market/buylimit' do
    fail '미지원'
  end

  xit '/market/selllimit' do
    fail '미지원'
  end

  xit '/market/cancel' do
    fail '미지원'
  end

  it '/market/getopenorders' do
    Bittrex::Order.open.size.should >= 0
  end
end
