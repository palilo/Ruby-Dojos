class Candy

	def initialize *string_numbers
		@numbers = string_numbers.collect{|string| 
			Integer(string)
		}
	end
	
	def xor
		result = 0
		@numbers.each{ |number| result ^= number}
		result
	end
	
	def sum_bigger_pile
		@numbers = @numbers.sort
		@numbers.delete_at 0
		@numbers.inject{|sum, number| sum + number}
	end
	
	def split
		if xor == 0 
			sum_bigger_pile
		else
			"NO"
		end
	end

end