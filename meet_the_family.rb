require_relative 'model/input_function'

def main
	data_file =  File.join(__dir__, 'data', 'family_tree_data.csv')
	input_file = ARGV[0]

	# Initialize Family Tree
	family_tree = FamilyTree.new("Arthur_family_tree")
	# Import The Data From The family Tree Csv So It Can Be Used.
	family_tree.import(data_file)

	# Initialize Input Function So That It Would Be About To Call The Input Functionas
	input_function = InputFunction.new(family_tree, input_file)
	#Call The Method Input Call To Read The File & Use The FUnctions Of The First Word Of Each Line As A Function.
	input_function.input_call
end

main