require 'spec_helper'

describe Bittrex::Summary do
  let(:data){ fixture(:summary) }
  let(:subject){ Bittrex::Summary.new(data) }

  describe '#initialization' do
    it {expect(subject.name).to eq('LTC-ZEIT')}
    it {expect(subject.high).to eq(0.00000023)}
    it {expect(subject.low).to eq(0.00000020)}
    it {expect(subject.volume).to eq(1406611.43827056)}
    it {expect(subject.last).to eq(0.00000020)}
    it {expect(subject.base_volume).to eq(0.30179011)}
    it {expect(subject.created_at).to eq(Time.parse('2014-06-26T05:22:57.673')) }
  end
end
