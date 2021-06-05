require_relative 'station'

class Oystercard 
  attr_reader :balance, :entry_station, :journeys, :exit_station
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  MINIMUM_CHARGE = 5

  def initialize
    @balance = 0
    @in_journey #= false
    @journeys = [ ]
  end

  def top_up(amount)
    fail "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if amount + balance > MAXIMUM_BALANCE
    @balance += amount
  end

  def in_journey?
    # @in_journey
    !!entry_station
    # default value is nill
    # it will make anything into boolean. without anything 
    # !! validates to true or false rather than an automatic true or nil == false
    # if someone touched in its true, if not, its a nill. for readability.
  end

  def touch_in(station)
    raise "Need topping up, ye" if balance < MINIMUM_BALANCE
    @entry_station = station
    @in_journey = true
  end

  def touch_out(station)
    deduct(MINIMUM_CHARGE)
    @exit_station = station
    @in_journey = false
    @journeys << {entry_station: @entry_station, exit_station: @exit_station}
    @entry_station = nil
  end

  private
  def deduct(amount)
    @balance -= amount 
  end

end
