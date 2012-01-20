require_relative 'Point'

class Main
	
	attr_reader :day_first_airport_was_covered
	attr_reader :day_all_airports_were_covered
	
	def initialize()
		@map = initial_map
		@airports = 0
		@day_first_airport_was_covered = 0
	end	
	
	def initial_map
		map = Array.new
		for i in 0..6
			map[i] = Array.new
			for j in 0..7
				map[i][j] = '.'
			end
		end
		map
	end
	
	def map
		printable_map = ""
		@map.each { |line| 		
			line.each { |cell| 
				printable_map += cell.to_s + " "
			}
			printable_map += "\n"
		}
		printable_map
	end
	
	def put_cloud_at x, y
		if @map[x][y] == "A"
			@airports -= 1
		end
		@map[x][y] = Cloud.new(Point.new(x,y))
	end
	
	def put_airport_at x, y
		@map[x][y] = "A"
		@airports += 1
	end
	
	def step
		points = Array.new
		for i in 0..6			
			for j in 0..7
				if @map[i][j].instance_of?(Cloud)
					points += @map[i][j].adjacent_points
				end
			end
		end
		put_clouds_at clean_points_array(points)
	end
	
	def steps
		i = 1
		initial_number_of_airports = @airports
		while !@day_all_airports_were_covered
			step
			if (@airports < initial_number_of_airports) && (@day_first_airport_was_covered == 0)
				@day_first_airport_was_covered = i
			end
			if @airports == 0
				@day_all_airports_were_covered = i
			end
			i += 1
		end
	end
	
	def put_clouds_at(points_array)		
		points_array.each { |point| put_cloud_at point.x, point.y}
	end
	
	def clean_points_array(points_array)	
	
		points_array.select { |point| (0..6).include?(point.x) && (0..7).include?(point.y)}
	end
end

class Cloud
	attr_reader :position
	
	def initialize(position)
		@position = position
	end
	
	def adjacent_points
		@position.adjacent_points
	end
	
	def to_s
		"*"
	end
	
end