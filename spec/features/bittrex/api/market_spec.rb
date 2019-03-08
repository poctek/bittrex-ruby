# frozen_string_literal: true
require 'spec_helper'

module Bittrex::Api
  RSpec.describe 'Market Api' do
    it '/market/buylimit' do
      pending 'This api is not ready for acceptance test'
      Market.buylimit(market, quantity, rate)
    end

    it '/market/selllimit' do
      pending 'This api is not ready for acceptance test'
      Market.selllimit(market, quantity, rate)
    end

    it '/market/cancel' do
      pending 'This api is not ready for acceptance test'
      Market.cancel(uuid)
    end

    it '/market/getopenorders' do
      Market.getopenorders('BTC-ETH').size.should >= 0
    end
  end
end
