class Point
	
	attr_reader :x
	attr_reader :y
	
	def initialize(x, y)
		@x = x
		@y = y
	end
	
	def + (anotherPoint)
		Point.new(self.x + anotherPoint.x, self.y + anotherPoint.y)
	end
	
	def adjacent_points
		Array.new.push(up, down, left, right)
	end
	
	def up
		self + Point.new(-1,0)
	end
	
	def down
		self + Point.new(1,0)
	end
	
	def left
		self + Point.new(0,-1)
	end
	
	def right
		self + Point.new(0,1)
	end
	
end