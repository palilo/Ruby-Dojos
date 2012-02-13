class Magicka
	
	def initialize string_input
		@wizard = Wizard.new
		proccess_string string_input
	end
	
	def proccess_string string_input 
		inputs = string_input.split
		amount_combinations = (inputs[i = 0]).to_i
		if amount_combinations > 0 
			combinations = parse_combinations inputs[(i + 1)..(i + amount_combinations)]
			i += amount_combinations
		end
		amount_opposed = (inputs[i = i + 1]).to_i
		if amount_opposed > 0 
			opposed = parse_opposed inputs[(i + 1)..(i + amount_opposed)]
			i += amount_opposed
		end
		amount_elements = inputs[i = i + 1]
		if amount_elements.to_i > 0 
			elements = parse_elements inputs[i = i + 1]	
		end
	end
	
	def parse_combinations string		
		string.each { |element|
			@wizard.add_combination element[0], element[1], element[2]
		}
	end
	
	def parse_opposed string
		string.each { |element|
			@wizard.add_opposed_elements element[0], element[1]
		}
	end
	
	def parse_elements string
		(0..((string.size) -1)).each { |index| @wizard.add_base_element string[index] }
	end
	
	def invoke
		@wizard.invoke
		@wizard.element_list
	end
	
end

class Wizard
	
	attr_reader :element_list
	
	def initialize 
		@element_list = Array.new
		@base_elements = Array.new
		@combinations = Hash.new
		@oposed = Hash.new
	end
	
	def add_base_element element
		@base_elements << element
	end
	
	def add_combination *elemen
		base1, base2, combined = elemen
		@combinations[base1+base2] = combined
		@combinations[base2+base1] = combined
	end
	
	def invoke
		@base_elements.each { |element| 
			@element_list << element
			combine_elements
			clean_if_contains_opposed
		}
	end
	
	def combine_elements
		#pensar em processar um buffer de tamanho dois
		if @element_list.length <= 1
			return
		end
		
		last, before_last = @element_list[-1], @element_list[-2]
		if combined = @combinations[last+before_last] 
			@element_list.delete_at -2
			@element_list.delete_at -1
			@element_list << combined
		end
	end
	
	def add_opposed_elements base1, base2
		if @oposed[base1]
			@oposed[base1] = @oposed[base1] << base2
		else
			@oposed[base1] = [base2]
		end
		
		if @oposed[base2]
			@oposed[base2] = @oposed[base2] << base1
		else
			@oposed[base2] = [base1]
		end
	end
	
	def clean_if_contains_opposed
		clean_list = false
		@element_list.each { |element|
			if oposed_element = @oposed[element]
				clean_list = (@element_list - oposed_element).size < @element_list.size			
			end
		}
		if clean_list
			@element_list = Array.new
		end
	end
	
end