require 'oystercard'

describe Oystercard do
  context 'adding money to the card' do
    it 'returns 0 when you ask for the initial balance' do
      expect(subject.balance).to eq 0
    end
    
    it 'has an initial balance of 0 automagically' do
      expect(subject).to have_attributes(:balance => 0)
    end

    it { is_expected.to respond_to(:top_up).with(1).argument }

    it 'should give us balance after topping up' do
      expect { subject.top_up(50) }.to change { subject.balance }.by 50
    end 

    it 'raises an error if the maximum balance is exceeded' do
      maximum_balance = Oystercard::MAXIMUM_BALANCE
      subject.top_up(maximum_balance)
      expect{ subject.top_up 1 }.to raise_error "Maximum balance of #{maximum_balance} exceeded"
    end
  end

  context 'subtracting money from the card' do
    it { is_expected.to respond_to(:deduct).with(1).argument }

    it 'to deduct amount from balance' do
      subject.top_up(20)
      expect { subject.deduct(10) }.to change { subject.balance }.by -10
    end

  end
  
  context 'touching card in and out' do

    it 'is initially not in a journey' do
      expect(subject).not_to be_in_journey
    end

    it 'touches card in' do 
      subject.top_up(10)
      subject.touch_in
      expect(subject).to be_in_journey
    end

    it 'touches card out' do
      subject.top_up(10)
      subject.touch_in
      subject.touch_out
      expect(subject).not_to be_in_journey
    end

    it 'raises an error if card has less than £1' do
      minimum_balance = Oystercard::MINIMUM_BALANCE
      expect{ subject.touch_in }.to raise_error "Need topping up, ye"
    end
  end

end

=begin
Issue Comments:
NameError - Raised when a given name is invalid or undefined.
uninitialized constant Oystercard - 
./spec/oystercard_spec.rb
line number - 3

Suggest resolve:
To create an Oystercard class.

Stack trace:
- shows the order of the error. 
- Ruby reads from top to bottom.

=end
