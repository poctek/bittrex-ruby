require 'spec_helper'

module Bittrex
  RSpec.describe 'Market Api' do
    before {set_bittrex_api_token}

    it '/market/buylimit' do
      pending 'Need Real Account'
      Market.buylimit
    end

    it '/market/selllimit' do
      pending 'Need Real Account'
      Market.selllimit
    end

    it '/market/cancel' do
      pending 'Need Real Account'
      Market.cancel
    end

    it '/market/getopenorders' do
      Order.open.size.should >= 0
    end
  end
end
