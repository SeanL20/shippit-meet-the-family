require_relative 'parents'

Class Member
	attr_acessor :name, :gender, :married_to

	def initialize(name, gender, married_to, parents)
		@name = name
		@gender = gender
		@married_to = married_to
		@parents = parents
		@family_tree = family_tree

		@family_tree.member << self
	end
end