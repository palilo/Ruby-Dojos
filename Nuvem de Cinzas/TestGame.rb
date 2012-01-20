require 'test/unit'
require 'set'
require_relative 'Game'
#Another way to require Main
#$LOAD_PATH << "."
#require 'Main'

class TestGame < Test::Unit::TestCase
	
	def test_empty_map
		assert_equal(map, Main.new.map)
	end
	
	def map
		'. . . . . . . . ' + "\n" +
		'. . . . . . . . ' + "\n" +
		'. . . . . . . . ' + "\n" +
		'. . . . . . . . ' + "\n" +
		'. . . . . . . . ' + "\n" +
		'. . . . . . . . ' + "\n" +
		'. . . . . . . . ' + "\n"
	end
	
	def test_map_with_cloud_at_left_corner
		game = Main.new
		game.put_cloud_at 0,0
		assert_equal(map_with_cloud_at_left_corner, game.map)
		
	end
	
	def map_with_cloud_at_left_corner
		'* . . . . . . . ' + "\n" +
		'. . . . . . . . ' + "\n" +
		'. . . . . . . . ' + "\n" +
		'. . . . . . . . ' + "\n" +
		'. . . . . . . . ' + "\n" +
		'. . . . . . . . ' + "\n" +
		'. . . . . . . . ' + "\n"
	end
	
	def test_map_with_two_clouds
		game = Main.new
		game.put_cloud_at 0,0		
		game.put_cloud_at 0,7
		assert_equal(map_with_two_clouds, game.map)
	end
	
	def map_with_two_clouds
		'* . . . . . . * ' + "\n" +
		'. . . . . . . . ' + "\n" +
		'. . . . . . . . ' + "\n" +
		'. . . . . . . . ' + "\n" +
		'. . . . . . . . ' + "\n" +
		'. . . . . . . . ' + "\n" +
		'. . . . . . . . ' + "\n"
	end
	
	def test_map_after_one_step
		game = Main.new
		game.put_cloud_at 0,0
		game.step
		assert_equal(map_after_one_step, game.map)
	end
	
	def map_after_one_step
		'* * . . . . . . ' + "\n" +
		'* . . . . . . . ' + "\n" +
		'. . . . . . . . ' + "\n" +
		'. . . . . . . . ' + "\n" +
		'. . . . . . . . ' + "\n" +
		'. . . . . . . . ' + "\n" +
		'. . . . . . . . ' + "\n"
	end
	
	def test_map_after_two_steps
		game = Main.new
		game.put_cloud_at 0,0
		game.step
		assert_equal(map_after_one_step, game.map)
		game.step
		assert_equal(map_after_two_steps, game.map)
	end
	
	def map_after_two_steps
		'* * * . . . . . ' + "\n" +
		'* * . . . . . . ' + "\n" +
		'* . . . . . . . ' + "\n" +
		'. . . . . . . . ' + "\n" +
		'. . . . . . . . ' + "\n" +
		'. . . . . . . . ' + "\n" +
		'. . . . . . . . ' + "\n"
	end
	
	def test_map_with_airport
		game = Main.new
		game.put_airport_at 0,0
		assert_equal(map_with_airport, game.map)
	end
	
	def map_with_airport
		'A . . . . . . . ' + "\n" +
		'. . . . . . . . ' + "\n" +
		'. . . . . . . . ' + "\n" +
		'. . . . . . . . ' + "\n" +
		'. . . . . . . . ' + "\n" +
		'. . . . . . . . ' + "\n" +
		'. . . . . . . . ' + "\n"
	end
	
	def test_aiport_covered_by_cloud
		game = Main.new
		game.put_cloud_at 0,0
		game.put_airport_at 0,1		
		assert_equal(map_with_airport_and_cloud, game.map)
		game.step
		assert_equal(map_with_covered_by_cloud, game.map)
	end
	
	def map_with_airport_and_cloud
		'* A . . . . . . ' + "\n" +
		'. . . . . . . . ' + "\n" +
		'. . . . . . . . ' + "\n" +
		'. . . . . . . . ' + "\n" +
		'. . . . . . . . ' + "\n" +
		'. . . . . . . . ' + "\n" +
		'. . . . . . . . ' + "\n"
	end
	
	def map_with_covered_by_cloud
		'* * . . . . . . ' + "\n" +
		'* . . . . . . . ' + "\n" +
		'. . . . . . . . ' + "\n" +
		'. . . . . . . . ' + "\n" +
		'. . . . . . . . ' + "\n" +
		'. . . . . . . . ' + "\n" +
		'. . . . . . . . ' + "\n"
	end
	
	def test_number_of_steps_to_cover_first_airport
		game = Main.new
		game.put_cloud_at 0,0
		game.put_airport_at 0,1
		game.steps
		assert_equal(1, game.day_first_airport_was_covered)
		assert_equal(1, game.day_all_airports_were_covered)
	end
	
	def test_number_of_steps_to_cover_several_airports
		game = Main.new
		game.put_cloud_at 0,0
		game.put_cloud_at 0,1
		game.put_cloud_at 1,0
		game.put_cloud_at 1,3
		game.put_cloud_at 3,4
		game.put_cloud_at 4,0
		game.put_cloud_at 4,1
		game.put_cloud_at 5,0
		game.put_airport_at 0,6
		game.put_airport_at 3,2
		game.put_airport_at 3,7
		game.put_airport_at 6,4
		assert_equal(map_full, game.map)
		game.steps
		assert_equal(2, game.day_first_airport_was_covered)
		assert_equal(4, game.day_all_airports_were_covered)
	end
		
	def map_full
		'* * . . . . A . ' + "\n" +
		'* . . * . . . . ' + "\n" +
		'. . . . . . . . ' + "\n" +
		'. . A . * . . A ' + "\n" +
		'* * . . . . . . ' + "\n" +
		'* . . . . . . . ' + "\n" +
		'. . . . A . . . ' + "\n"
	end
	
end