require_relative 'parents'

Class Member
	attr_acessor :name, :gender, :spouse

	def initialize(name, gender, spouse, parents)
		@name = name
		@gender = gender
		@spouse = spouse
		@parents = parents
	end
end