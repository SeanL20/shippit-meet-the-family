class Member
	attr_accessor :name, :gender, :married_to, :father_name, :mother_name, :family_tree

	def initialize(name, gender, married_to, father_name, mother_name, family_tree)
		@name = name
		@gender = gender
		@married_to = married_to
		@father_name = father_name
		@mother_name = mother_name
		@family_tree = family_tree

		@family_tree.family_members << self
	end
end