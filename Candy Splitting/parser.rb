require_relative 'Candy'

class Parser
	
	def initialize file_path
		out_file_name = File.basename(file_path, ".in") + "_out.txt"		
		file = File.open file_path, "r"
		
		number_of_tests = file.gets.to_i
		File.open(out_file_name , "w") do |outFile|
			(1..number_of_tests).each { |index|
				file.gets #ignore
				c = Candy.new *file.gets.split
				outFile.puts "Case ##{index}: #{c.split}"
			}
		end
	end

end

if not File.exists? ARGV[0] then exit end
Parser.new ARGV[0]