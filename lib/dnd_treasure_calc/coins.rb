# coins.rb
module DndTreasureCalc
  class Coins

    attr_accessor :amount
    attr_reader :type

    @@conversions = YAML.load_file('assets/conversions.yml')

    def initialize(amount, type)
      raise RuntimeError, "#{type} is not a valid coin type" unless COINS.include?(type)
      @amount = amount
      @type = type
    end

    def +(coins)
      raise RuntimeError, "#{coins} is not an instance of Coins" unless coins.is_a?(Coins)
      coins.convert_to(@type) if coins.type != @type
      Coins.new(@amount + coins.amount, @type)
    end

    def convert_to(type)
      raise RuntimeError, 'Not implemented'
    end

  end
end