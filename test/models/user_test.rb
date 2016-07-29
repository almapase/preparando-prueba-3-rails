require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "the user trainer1 has three pokemons" do
    trainer = users(:trainer1)
    assert_equal 3, trainer.pokemons.size
  end

  test "the user trainer1 has a caterpie" do
    trainer = users(:trainer1)
    p = trainer.pokemons.collect(&:name)
    assert (p.include? "Caterpie")
  end
end
