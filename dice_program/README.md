## Introduction
This code part of coding test in interview preparation

## Problem
We would like to have a dice-rolling simulator capable of simulating the rolling of a set of
dice of any combination of sides. Some examples:
- Rolling a single 6-sided die.
- Rolling two 8-sided dice.
- Rolling a single 6-sided die and a 20-sided die.

#### Acceptance Criteria:
Consider the below as the detailed requirements. In most cases, these can be directly applied as unit testing ideas, though they may not cover the complete set of unit tests that should be written.
- The end product of a “roll” is a result object with a description of what dice were rolled,
- the value from each die, and the total of all the values.
- The result should be random. (How to test this is up to the developer.)
- Rolling a die with n sides should result in a value between 1 and n (inclusive).
- If a CLI or web UI is added:
  - The user should be able to specify how many dice are to be rolled.
  - The user should be able to specify how many sides each die has.
  - The result should display the separate value for each die as well as the overall total of all values.

## How to Run
```ruby
cd dice_program
bundle install
ruby dice.rb
```

## Run Test
```ruby
rspec spec/dice_spec.rb
```