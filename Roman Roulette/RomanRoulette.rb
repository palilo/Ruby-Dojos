class RomanRoulette

	attr_reader :survivor
		
	def initialize n, k
		@circle = Array.new
		(1..n).each { |i| @circle << i }
		@skip = k
		@last_kill = 0
		@survivor = calculate_survivor
	end
	
	def calculate_survivor
		if @circle.length == 1
			return @circle[0]
		end
		kill
		calculate_survivor
	end
	
	def kill
		@last_kill = next_index_to_kill
		@circle.delete_at @last_kill
	end
	
	def next_index_to_kill
		(@last_kill + @skip - 1) % @circle.length
	end 
end