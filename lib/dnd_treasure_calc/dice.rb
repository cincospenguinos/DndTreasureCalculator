# dice.rb

module DndTreasureCalc
  class Dice

    @@rand = Random.new

    def initialize(rolls, faces, modifier=0)
      @rolls = rolls
      @faces = faces
      modifier = modifier
    end

    def roll
      total = 0
      @rolls.times { total += @@rand.rand(@faces) + 1 }
      total += modifier
      total
    end

    def self.seed=(seed)
      @@rand = Random.new(seed)
    end
  end
end