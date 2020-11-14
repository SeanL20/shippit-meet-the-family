require_relative 'model/family_tree'

def main
	data_file =  File.join(__dir__, 'data', 'family_tree_data.csv')

	family_tree = FamilyTree.new("Arthur_family_tree")
	family_tree.import(data_file)
end

main