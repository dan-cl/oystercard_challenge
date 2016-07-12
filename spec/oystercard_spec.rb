require 'oystercard'

describe Oystercard do
  subject(:card) {described_class.new}

  describe 'initialize' do

    it 'check new card has balance 0' do
      expect(subject.balance).to eq(0)
    end

  end

  describe '#top_up' do
      it { is_expected.to respond_to(:top_up).with(1).argument}

      it 'increases the balance by the top up amount' do
        expect{subject.top_up(10)}.to change{ subject.balance }.by 10

      end

      it 'will not allow a balance greater than 90' do
        maximum_balance = Oystercard::MAXIMUM_BALANCE
        subject.top_up(maximum_balance)
        expect {subject.top_up(1)}.to raise_error "Balance can not be greater than #{maximum_balance}"
      end

  end
end
