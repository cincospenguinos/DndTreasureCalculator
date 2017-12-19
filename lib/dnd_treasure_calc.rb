require 'yaml'

require 'dnd_treasure_calc/version'
require 'dnd_treasure_calc/dice'
require 'dnd_treasure_calc/coins'

module DndTreasureCalc

  D_100 = Dice.new(1, 100).freeze
  COINS = %i(copper silver electrum gold platinum).freeze
  INDIVIDUAL_TABLES = YAML.load_file('assets/individual_tables.yml')
  HORDE_TABLES = YAML.load_file('assets/horde_tables.yml')

  # Calculate individual treasure at challenge rating provided
  def DndTreasureCalc.individual(challenge_rating)
    table = individual_table_for(challenge_rating)
    roll = D_100.roll
    table.each do |threshold, dice|
      if roll <= threshold
        coins = []

        dice.each do |d|
          die = Dice.new(d[:rolls], d[:faces])
          amount = die.roll * d[:multiplier]
          coins << Coins.new(amount, d[:type])
        end

        return coins
      end
    end

    raise RuntimeError, "#{roll} did not meet any of the thresholds!"
  end

  # Calculate horde treasure at challenge rating provided
  def DndTreasureCalc.horde(challenge_rating)
    raise RuntimeError, 'Not yet implemented.'
  end

  def DndTreasureCalc.individual_table_for(challenge_rating)
    idx = get_index(challenge_rating)
    INDIVIDUAL_TABLES[idx]
  end

  def DndTreasureCalc.horde_table_for(challenge_rating)
    idx = get_index(challenge_rating)
    HORDE_TABLES[idx]
  end

  def DndTreasureCalc.get_index(challenge_rating)
    idx = challenge_rating / 5
    idx = 3 if idx > 3
    idx
  end
end
