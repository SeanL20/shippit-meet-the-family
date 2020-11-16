require_relative 'family_tree'

class InputFunction
	def initialize(family_tree, input_file)
		@family_tree = family_tree
		@input_file = input_file
	end

	def input_call()

		File.foreach(@input_file) do |line|
			input = line.split(' ')
			function = input.first

			if function == "ADD_CHILD"
				add_child(input[1], input[2], input[3])
			elsif function == "GET_RELATIONSHIP"
				get_relationships(input[1], input[2])
			end
		end
	end

	def add_child(mother_name, child_name, child_gender)
		if @family_tree.find_by_name(mother_name) != nil && @family_tree.find_by_name(mother_name).gender != "Male"
			mother = @family_tree.find_by_name(mother_name)

			Member.new(child_name, child_gender, nil, mother.name, mother.married_to, @family_tree)
			puts "CHILD_ADDED"
		elsif @family_tree.find_by_name(mother_name) != nil && @family_tree.find_by_name(mother_name).gender == "Male"
			puts "CHILD_ADDITION_FAILED"
		elsif @family_tree.find_by_name(mother_name) == nil
			puts "PERSON_NOT_FOUND"
		end
	end

	def get_relationships(member_name, relationship)
		if @family_tree.find_by_name(member_name) != nil
			output = check_relationship(member_name, relationship)
		else
			puts "PERSON_NOT_FOUND"
		end
	end

	def check_relationship(member_name, relationship)
		case relationship
		when "Paternal-Uncle"
			# puts @family_tree.get_mother(member_name)
			member_array = @family_tree.get_pateral_aunt(member_name)
			convert_array_to_string(member_array)
		when "Materal-Uncle"
		when "Paternal-Aunt"
			member_array = @family_tree.get_pateral_aunt(member_name)
			convert_array_to_string(member_array)
		when "Materal-Aunt"
			member_array = @family_tree.get_materal_aunt(member_name)
			convert_array_to_string(member_array)
		when "Sister-In-Law"
			member_array = @family_tree.get_sister_in_law(member_name)
			convert_array_to_string(member_array)
		when "Brother-In-Law"
			member_array = @family_tree.get_brother_in_law(member_name)
			convert_array_to_string(member_array)
		when "Son"
			member_array = @family_tree.get_sons(member_name)
			convert_array_to_string(member_array)
		when "Daughter"
			member_array = @family_tree.get_daughters(member_name)
			convert_array_to_string(member_array)
		when "Sibling"
			member_array = @family_tree.get_siblings(member_name)
			convert_array_to_string(member_array)
		else
		  puts "NONE"
		end
	end

	def convert_array_to_string(member_array)
		if member_array != []
			puts member_array.map { |e| e.name }.join(" ")
		else
			puts "NONE"			
		end
	end
end