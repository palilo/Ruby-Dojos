require 'test/unit'
require_relative 'Magicka'

class TestMagicka < Test::Unit::TestCase
	
	def test_invoke_one_element
		w = Wizard.new
		w.add_base_element "A"
		w.invoke
		assert_equal(["A"], w.element_list)
	end
	
	def test_invoke_two_elements
		w = Wizard.new
		w.add_base_element "A"
		w.add_base_element "Q"
		w.invoke
		assert_equal(["A", "Q"], w.element_list)
	end
	
	def test_invoke_combined_elements
		w = Wizard.new
		w.add_base_element "A"
		w.add_base_element "Q"
		w.add_combination "A", "Q", "T"
		w.invoke
		assert_equal(["T"], w.element_list)
	end
	
	def test_invoke_opposed_elements
		w = Wizard.new
		w.add_opposed_elements "A", "Q"
		w.add_base_element "A"
		w.add_base_element "Q"
		w.invoke
		assert_equal([], w.element_list)
	end
	
	def test_invoke_opposed_elements_2
		w = Wizard.new
		w.add_opposed_elements "A", "Q"
		w.add_base_element "Q"
		w.add_base_element "A"
		w.invoke
		assert_equal([], w.element_list)
	end
	
	def test_invoke_opposed_elements_not_sequential
		w = Wizard.new
		w.add_opposed_elements "A", "Q"
		w.add_base_element "A"
		w.add_base_element "F"
		w.add_base_element "T"
		w.add_base_element "Q"
		w.invoke
		assert_equal([], w.element_list)
	end
	
	def test_invoke_using_input
		m = Magicka.new "0 0 2 EA"
		assert_equal( ["E", "A"], m.invoke )
	end
	
	def test_invoke_with_combination
		m = Magicka.new "1 QRI 0 4 RRQR"
		assert_equal(["R", "I", "R"], m.invoke )
	end
	
	def test_invoke_with_combination_and_opposed_equal
		m = Magicka.new "1 QFT 1 QF 7 FAQFDFQ"
		assert_equal(["F", "D", "T"], m.invoke)
	end
	
	def test_invoke_with_combination_and_opposed
		m = Magicka.new "1 EEZ 1 QE 7 QEEEERA"
		assert_equal(["Z", "E", "R", "A"], m.invoke)
	end
	
	def test_invoke_with_opposed
		m = Magicka.new "0 1 QW 2 QW"
		assert_equal([], m.invoke)
	end
	
	def test_invoke_big_sequence
		m = Magicka.new "2 QRI EEZ 2 QW EF 10 QWWREEQRTY"
		assert_equal(["R", "T", "Y"], m.invoke)
	end
	
	def test_large_practice_14
		m = Magicka.new "0 4 QW QE RW RE 14 EASDFASDFASDFQ"
		assert_equal([], m.invoke)
	end
	
	def test_large_practice_16
		m = Magicka.new "14 AWC WSB EQI QWK SFJ DDM FRL DQO ASP FAU RQT RWV RRY DAZ 3 AQ FQ RW 86 AAESFDDDQFAQWRRFADARWRQDDDASFEWDDWDDRWAWWSDDRWRWAWDREDQDFREQSFDDRRWSDDAFRDDDQASARRSSRR"
		assert_equal(["E", "O", "D", "L", "I", "J", "M", "Y", "B", "M", "U", "R", "M", "O", "P", "A", "Y", "S", "S", "Y"], m.invoke)
	end
	
	def test_bug
		m = Magicka.new "0 3 AQ FQ RW 15 VLZAVTMZJEWMWMR"
		assert_equal([], m.invoke)
	end
	
end
