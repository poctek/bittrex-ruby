require 'spec_helper'

describe Bittrex::Deposit do
  let(:data){ fixture(:deposit) }
  let(:subject){ Bittrex::Deposit.new(data) }

  describe '#initialization' do
    it {expect(subject.id).to eq(2045339)}
    it {expect(subject.currency).to eq('BTC')}
    it {expect(subject.quantity).to eq(0.31074098)}
    it {expect(subject.address).to eq('17m3mcA3wo5kk637TgEysxxx2c89SDCRZDB')}
    it {expect(subject.transaction_id).to eq('416ba84218c178e7befbe22b23bf1123a23ec2bc68678586a27cebdxxxb6')}
    it {expect(subject.confirmations).to eq(2)}
    it {expect(subject.executed_at).to eq(Time.parse('2014-06-16T22:57:17.457')) }
  end
end
