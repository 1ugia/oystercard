# oystercard

A Makers Week 2 pair programming challenge.

* **Languages used**: Ruby
* **Testing frameworks**: RSpec

### Functional Representation of User Stories

Objects  | Messages
------------- | -------------
Oystercard | initialize, balance, top_up(value), MAXIMUM_VALUE, deduct(value)
Oystercard | touch_in(station), touch_out(station), in_journey, MINIMUM_VALUE, MINIMUM_CHARGE
Sation | name, station

### Domain Model

```
Oystercard <-- initialize --> sets balance to 0
Oystercard <-- balance --> value
Oystercard <-- top_up(value) --> balance
Oystercard <-- MAXIMUM_BALANCE = 90 --> balance 
Oystercard <-- deduct(value) --> balance
Oystercard <-- touch_in(station)/touch_out(station) --> journey? --> status
Oystercard <-- MINIMUM_BALANCE = 1 --> balance
Oystercard <-- touch_out --> MINIMUM_CHARGE --> balance
Station <-- name --> station

```