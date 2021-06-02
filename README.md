# oystercard

A Makers Week 2 pair programming challenge.

* **Languages used**: Ruby
* **Testing frameworks**: RSpec

### Functional Representation of User Stories

Objects  | Messages
------------- | -------------
Oystercard | initialize, balance, top_up(value), maximum_value

### Domain Model

```
Oystercard <-- initialize --> sets balance to 0
Oystercard <-- balance --> value
Oystercard <-- top_up(value) --> balance
Oystercard <-- maximum == 90 --> balance 
```