# coins.rb
module DndTreasureCalc
  class Coins
    attr_accessor :amount
    attr_reader :type

    def initialize(amount, type)
      raise RuntimeError, "#{type} is not a valid coin type" unless COINS.include?(type)
      @amount = amount
      @type = type
    end

    def +(coins)
      raise RuntimeError, "#{coins} is not an instance of Coins" unless coins.is_a?(Coins)
      raise RuntimeError, 'Not implemented'
    end

    def convert_to(type)
      raise RuntimeError, 'Not implemented'
    end
  end
end