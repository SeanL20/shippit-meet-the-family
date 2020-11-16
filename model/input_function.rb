require_relative 'family_tree'

class InputFunction
	def initialize(family_tree, input_file)
		@family_tree = family_tree
		@input_file = input_file
	end

	def input_call()
		File.open(@input_file).each do |line|
			input = line.split(' ')
			function = input.first

			if function == "ADD_CHILD"
				add_child(input[1], input[2], input[3])
			elsif function == "GET_RELATIONSHIPS"
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

	def get_relationships(name, relationship)
		if @family_tree.find_by_name(mother_name) != nil
			
		else
			puts "PERSON_NOT_FOUND"
		end
	end
end