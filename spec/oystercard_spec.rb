require 'oystercard'

describe Oystercard do

  it {is_expected.to respond_to(:balance)}

  it 'shows the initial balance of the card' do
    expect(subject.balance).to eq 0
  end

  it {is_expected.to respond_to(:top_up).with(1).argument}

  it 'should increase the balance by 10' do
    expect{subject.top_up 10}.to change {subject.balance}.by 10
  end

end
