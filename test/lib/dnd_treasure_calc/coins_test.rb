# coins_test.rb
require_relative '../../test_helper'
require 'dnd_treasure_calc/coins'
describe DndTreasureCalc do
  it 'must add up correctly' do
    coin1 = DndTreasureCalc::Coins.new(12, :copper)
    coin2 = DndTreasureCalc::Coins.new(13, :copper)

    coin1 += coin2
    assert_equal(25, coin1.amount)
    assert_equal(:copper, coin1.type)

    coin2 = DndTreasureCalc::Coins.new(1, :gold)
    coin1 += coin2

    assert_equal(125, coin1.amount)
    assert_equal(:copper, coin1.type)
  end
end