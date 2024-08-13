require 'rspec'
require_relative '../dice.rb'

RSpec.describe Die do
  describe '#roll' do
    it 'returns a value between 1 and the number of sides' do
      die = Die.new(6)
      100.times do
        expect(die.roll).to be_between(1, 6)
      end
    end

    it 'returns random results' do
      die = Die.new(6)
      rolls = Array.new(100) { die.roll }
      expect(rolls.uniq.size).to be > 1
    end
  end
end

RSpec.describe DiceRoller do
  describe '#roll_all' do
    it 'returns a result object with description, values, and total' do
      roller = DiceRoller.new([6, 8, 10])
      result = roller.roll_all

      expect(result[:description]).to eq('6, 8, 10')
      expect(result[:values].size).to eq(3)
      expect(result[:total]).to eq(result[:values].sum)
    end

    it 'calculates the correct total' do
      roller = DiceRoller.new([6, 8])
      result = roller.roll_all

      expect(result[:total]).to eq(result[:values].sum)
    end

    it 'returns different results for multiple rolls' do
      roller = DiceRoller.new([6, 8])
      first_result = roller.roll_all[:values]
      second_result = roller.roll_all[:values]

      expect(first_result).not_to eq(second_result)
    end
  end
end
