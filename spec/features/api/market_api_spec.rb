# frozen_string_literal: true
require 'spec_helper'

module Bittrex::Api
  RSpec.describe 'Market Api' do
    before {set_bittrex_api_token}
    xit '/market/buylimit' do
      # Market.buylimit(market, quantity, rate)
      pending
    end

    xit '/market/selllimit' do
      # Market.selllimit(market, quantity, rate)
    end

    xit '/market/cancel' do
      # Market.cancel(uuid)
    end

    xit '/market/getopenorders' do
      # Market.getopenorders(nil).size.should == 0
      # Market.getopenorders('BTC').size.should == 0
    end
  end
end
