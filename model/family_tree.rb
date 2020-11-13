require_relative 'person'

Class FamilyTree
	attr_acessor :family_members, :name

	def initialize(name)
		@name = name
		@family_members = []
	end

	def find_by_name(name)
		family_members.each do |fam_mem|
			fam_mem.name == name ? return fem_mem : return nil
		end
	end
end