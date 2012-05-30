require 'test/unit'
require 'Candy'

class CandyTest < Test::Unit::TestCase
	
	def test_binary_xor
		c = Candy.new "1", "9"
		assert_equal(0b1000, c.xor)
	end
	
	def test_binary_xor_equal_zero
		c = Candy.new "3", "5", "6"
		assert_equal(0, c.xor)
	end
	
	def test_binary_xor_diferent_than_zero
		c = Candy.new "1", "2", "3", "4", "5"
		assert_equal(0b0001, c.xor)
	end
	
	def test_return_sum
		c = Candy.new "3", "5", "6"
		assert_equal(11, c.sum_bigger_pile)
	end
	
	def test_split_failure
		c = Candy.new "1", "2", "3", "4", "5"
		assert_equal("NO", c.split)
	end
	
	def test_split_success
		c = Candy.new "3", "5", "6"
		assert_equal(11, c.split)
	end
	
end
