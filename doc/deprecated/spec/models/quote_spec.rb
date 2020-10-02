require 'spec_helper'

describe Bittrex::Quote do
  let(:data){ fixture(:quote) }
  let(:subject){ Bittrex::Quote.new('BTC-HPY', data) }

  describe '#initialization' do
    it {expect(subject.market).to eq('BTC-HPY')}
    it {expect(subject.bid).to eq(0.01607601)}
    it {expect(subject.ask).to eq(0.01633299)}
    it {expect(subject.last).to eq(0.01635099)}
  end
end
