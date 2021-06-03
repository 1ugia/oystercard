# oystercard

A Makers Week 2 pair programming challenge.

* **Languages used**: Ruby
* **Testing frameworks**: RSpec

### Functional Representation of User Stories

Objects  | Messages
------------- | -------------
Oystercard | initialize, balance, top_up(value), MAXIMUM_VALUE, deduct(value)
Oystercard | touch_in, touch_out, in_journey, MINIMUM_VALUE

### Domain Model

```
Oystercard <-- initialize --> sets balance to 0
Oystercard <-- balance --> value
Oystercard <-- top_up(value) --> balance
Oystercard <-- MAXIMUM_BALANCE = 90 --> balance 
Oystercard <-- deduct(value) --> balance
Oystercard <-- touch_in/touch_out --> journey? --> status
Oystercard <-- MINIMUM_BALANCE = 1 --> balance

```