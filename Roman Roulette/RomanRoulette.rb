class RomanRoulette

	attr_reader :survivor
	STARTING_POINT = 0
		
	def initialize amount_of_people, steps_to_kill
		circleOfDeath = CircularList.new
		circleOfDeath.puts (1..amount_of_people)
		@steps_to_kill = steps_to_kill
		@survivor = calculate_survivor circleOfDeath, STARTING_POINT
	end
	
	def calculate_survivor circleOfDeath, position
		if circleOfDeath.length == 1
			return circleOfDeath.get 0
		end
		
		index_to_kill = position + @steps_to_kill - 1
		circleOfDeath.delete_at index_to_kill 
		
		calculate_survivor circleOfDeath, index_to_kill
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
		@list[real_index_of i]
	end
	
	def delete_at i
		@list.delete_at real_index_of i
	end
	
	def real_index_of i
		i > length ? ((i % length) + 1) : (i % length)
	end
end
