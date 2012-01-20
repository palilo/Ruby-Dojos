class RomanRoulette

	attr_reader :survivor
		
	def initialize n, k
		circle = CircularList.new
		circle.puts (1..n)
		@k = k
		@survivor = calculate_survivor circle, 0
	end
	
	def calculate_survivor circle, position
		if circle.length == 1
			return circle.get 0
		end
		
		index_to_kill = position + @k - 1
		circle.delete_at index_to_kill 
		
		calculate_survivor circle, index_to_kill
	end
	
end

class CircularList
	
	def initialize
		@list = Array.new
	end
	
	def puts sequence
		sequence.each { | element |
			self << element	
		}
	end
	
	def << element
		@list << element
	end
	
	def length
		@list.length
	end
	
	def get i
		if i > length 
			@list[(i % length) + 1]
		else
			@list[i % length]
		end
	end
	
	def delete_at i
		if i > length  
			@list.delete_at ((i % length) + 1)
		else
			@list.delete_at (i % length)	
		end
	end
end
