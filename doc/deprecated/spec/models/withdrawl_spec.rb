require 'spec_helper'

describe Bittrex::Withdrawl do
  let(:data){ fixture(:withdrawl) }
  let(:subject){ Bittrex::Withdrawl.new(data) }

  describe '#initialization' do
    it {expect(subject.id).to eq('c7f7b806-36cf-4xxx-b198-fcdeb1220762')}
    it {expect(subject.currency).to eq('BTC')}
    it {expect(subject.quantity).to eq(0.0098)}
    it {expect(subject.address).to eq('14UKkY9xxxvk79X7u1zYpxxxRUEQ8F7Lh5')}
    it {expect(subject.authorized).to eq(true)}
    it {expect(subject.pending).to eq(false)}
    it {expect(subject.canceled).to eq(false)}
    it {expect(subject.invalid_address).to eq(false)}
    it {expect(subject.transaction_cost).to eq(0.0002)}
    it {expect(subject.transaction_id).to eq('0b34fc4xxx102d0f80efddafexxx6b77c6ce170100b2a579ab5b5f493a383392')}
    it {expect(subject.executed_at).to eq(Time.parse('2014-06-26T05:37:55.083')) }
  end
end
