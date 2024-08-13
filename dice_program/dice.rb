class Die
  attr_reader :sides

  def initialize(sides)
    @sides = sides
  end

  def roll
    rand(1..sides)
  end
end

class DiceRoller
  attr_reader :dice, :results

  def initialize(dice)
    @dice = dice.map { |sides| Die.new(sides) }
    @results = []
  end

  def roll_all
    @results = dice.map(&:roll)
    {
      description: describe_rolls,
      values: results,
      total: results.sum
    }
  end

  private

  def describe_rolls
    dice.map(&:sides).join(', ')
  end
end

# CLI logic to get user input
def prompt_user_for_dice
  puts "How many dice would you like to roll?"
  num_dice = gets.chomp.to_i

  dice = []
  num_dice.times do |i|
    puts "Enter the number of sides for die ##{i + 1}:"
    sides = gets.chomp.to_i
    dice << sides
  end

  dice
end

def run_dice_roller
  dice = prompt_user_for_dice
  roller = DiceRoller.new(dice)
  result = roller.roll_all

  puts "You rolled dice with sides: #{result[:description]}"
  puts "The values rolled are: #{result[:values].join(', ')}"
  puts "The total value is: #{result[:total]}"
end

run_dice_roller if __FILE__ == $PROGRAM_NAME

