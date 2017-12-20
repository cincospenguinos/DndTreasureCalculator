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
      coins.convert_to(@type) ? 0 : convert_to(coins.type)
      Coins.new(@amount + coins.amount, @type)
    end

    # Converts this coin to the type provided
    def convert_to(type)
      return false if @@conversions[@type].nil? || @@conversions[@type][type].nil?
      return true if @type == type
      @amount *= @@conversions[@type][type]
      @type = type
    end
  end
end