require 'spec_helper'

module Bittrex
  RSpec.describe 'Market Api' do
    before {set_bittrex_api_token}

    it '/market/buylimit' do
      pending '미지원'
      Market.buylimit
    end

    it '/market/selllimit' do
      pending '미지원'
      Market.selllimit
    end

    it '/market/cancel' do
      pending '미지원'
      Market.cancel
    end

    it '/market/getopenorders' do
      Order.open.size.should >= 0
    end
  end
end
