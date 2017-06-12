require 'spec_helper'

describe Bittrex::Market do
  let(:data){ fixture(:market) }
  let(:subject){ Bittrex::Market.new(data) }

  describe '#initialization' do
    it {expect(subject.name).to eq('BTC-LTC')}
    it {expect(subject.currency).to eq('LTC')}
    it {expect(subject.base).to eq('BTC')}
    it {expect(subject.currency_name).to eq('Litecoin')}
    it {expect(subject.base_name).to eq('Bitcoin')}
    it {expect(subject.minimum_trade).to eq(0.01)}
    it {expect(subject.active).to eq(true)}
    it {expect(subject.created_at).to eq(Time.parse('2014-02-13T00:00:00')) }
  end
end
