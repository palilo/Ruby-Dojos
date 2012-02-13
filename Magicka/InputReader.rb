require_relative 'Magicka'

class InputReader
	
	def initialize file_path
		out_file_name = File.basename(file_path, ".in") + "_out.txt"		
		file = File.open file_path, "r"
		
		number_of_tests = file.gets.to_i
		File.open(out_file_name , "w") do |outFile|
			(1..number_of_tests).each { |index|
				m = Magicka.new file.gets
				outFile.puts "Case ##{index}: #{m.invoke.to_s}".gsub(/\"/, "")
			}
		end
	end
end

if not File.exists? ARGV[0] then exit end
InputReader.new ARGV[0]