require 'spec_helper'

describe Bittrex::Currency do
  let(:data){ fixture(:currency) }
  let(:subject){ Bittrex::Currency.new(data) }

  describe '#initialization' do
    it {expect(subject.name).to eq('Bitcoin')}
    it {expect(subject.abbreviation).to eq('BTC')}
    it {expect(subject.transaction_fee).to eq(0.00000008)}
    it {expect(subject.minimum_confirmation).to eq(5)}
    it {expect(subject.active).to eq(true)}
  end
end
