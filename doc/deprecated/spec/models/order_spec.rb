require 'spec_helper'

describe Bittrex::Order do
  let(:data){ fixture(:order) }
  let(:subject){ Bittrex::Order.new(data) }

  attr_reader :type, :id, :quantity, :rate, :total, :fill, :raw, :executed_at

  context '#initialization' do
    it {expect(subject.id).to eq('1af0399d-e845-4xxx-9d85-aa332d831e95')}
    it {expect(subject.type).to eq('LIMIT_SELL')}
    it {expect(subject.exchange).to eq('BTC-HPY')}
    it {expect(subject.quantity).to eq(371810.26006413)}
    it {expect(subject.remaining).to eq(371810.26006413)}
    it {expect(subject.limit).to eq(0.00000016)}
    it {expect(subject.price).to eq(0.0)}
    it {expect(subject.total).to eq(nil)}
    it {expect(subject.fill).to eq(nil)}
    it {expect(subject.executed_at).to eq(Time.parse('2014-06-21T04:08:08.75')) }
  end
end
