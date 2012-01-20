require 'test/unit'
require_relative 'RomanRoulette'

class TestRomanRoulette < Test::Unit::TestCase
	
	def test_example
		roulette = RomanRoulette.new 1, 2
		assert_equal(1, roulette.survivor)
	end
	
	def test_example2
		roulette = RomanRoulette.new 5, 2
		assert_equal(3, roulette.survivor)
	end
	
end
