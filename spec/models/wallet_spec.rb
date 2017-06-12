require 'spec_helper'

describe Bittrex::Wallet do
  let(:data){ fixture(:wallet) }
  let(:subject){ Bittrex::Wallet.new(data) }

  describe '#initialization' do
    it {expect(subject.id).to eq('3dab465d-d0f2-4xxx-819f-aafad450f05b')}
    it {expect(subject.currency).to eq('CRYPT')}
    it {expect(subject.balance).to eq(115.0)}
    it {expect(subject.available).to eq(0.0)}
    it {expect(subject.pending).to eq(0.0)}
    it {expect(subject.address).to eq(nil)}
    it {expect(subject.requested).to eq(false)}
  end
end
