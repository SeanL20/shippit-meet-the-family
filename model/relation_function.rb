require_relative 'family_tree'
require 'csv'

class RelationFunction
	attr_accessor :family_tree

	def initialize(family_tree)
		@family_tree = family_tree
		@family_members = family_tree.family_members
	end

	def get_pateral_uncle(member_name)
		father = get_father(member_name)
		brother_array = []
		if father != nil
			brother_array = get_brothers(father.name)
		end
		return brother_array
	end

	def get_materal_uncle(member_name)
		mother = get_mother(member_name)
		brother_array = []
		if mother != nil
			brother_array = get_brothers(mother.name)
		end
		return brother_array
	end

	def get_pateral_aunt(member_name)
		father = get_father(member_name)
		sister_array = []
		if father != nil
			sister_array = get_sisters(father.name)
		end
		return sister_array
	end

	def get_materal_aunt(member_name)
		mother = get_mother(member_name)
		sister_array = []
		if mother != nil
			sister_array = get_sisters(mother.name)
		end
		return sister_array
	end

	def get_sister_in_law(member_name)
		member = @family_tree.find_by_name(member_name)
		partner_sisters = get_sisters(member.married_to)
		siblings_wife = get_siblings_wife(member_name)

		member_array = partner_sisters + siblings_wife
		
		return member_array
	end

	def get_brother_in_law(member_name)
		member = @family_tree.find_by_name(member_name)
		partner_brothers = get_brothers(member.married_to)
		siblings_husband = get_siblings_husband(member_name)

		member_array = partner_brothers + siblings_husband
		
		return member_array
	end

	def get_sons(member_name)
		member = @family_tree.find_by_name(member_name)
		member_array = []
		@family_members.each do |fam_mem|
			# check if the family member name is the same as the parameter before returning nil or the family member.
			if (fam_mem.father_name == member.name || fam_mem.mother_name == member.name) && fam_mem.gender == "Male"
				member_array << fam_mem
			end
		end
		return member_array
	end

	def get_daughters(member_name)
		member = @family_tree.find_by_name(member_name)
		member_array = []
		@family_members.each do |fam_mem|
			# check if the family member name is the same as the parameter before returning nil or the family member.
			if (fam_mem.father_name == member.name || fam_mem.mother_name == member.name) && fam_mem.gender == "Female"
				member_array << fam_mem
			end
		end
		return member_array
	end

	def get_siblings(member_name)
		member_array = get_members_with_same_parents(member_name)
		return member_array
	end

	private
		def get_mother(member_name)
			member = @family_tree.find_by_name(member_name)
			@family_members.each do |fam_mem|
				# check if the family member name is the same as the parameter before returning nil or the family member.
				if fam_mem.name == member.mother_name
					return fam_mem
				end
			end
			return nil
		end

		def get_father(member_name)
			member = @family_tree.find_by_name(member_name)
			@family_members.each do |fam_mem|
				# check if the family member name is the same as the parameter before returning nil or the family member.
				if fam_mem.name == member.father_name
					return fam_mem
				end
			end
			return nil
		end

		def get_members_with_same_parents(member_name)
			member = @family_tree.find_by_name(member_name)
			member_array = []
			if member.father_name != nil && member.mother_name != nil
				# remove the member from the array of members in the variable family_members
				family_members_without_member = @family_members - [member]
				family_members_without_member.each do |fam_mem|
					# check if the family member name is the same as the parameter before returning nil or the family member.
					if fam_mem.father_name == member.father_name && fam_mem.mother_name == member.mother_name
						member_array << fam_mem
					end
				end
			end
			return member_array
		end

		def get_daughters(member_name)
			member = @family_tree.find_by_name(member_name)
			member_array = []
			@family_members.each do |fam_mem|
				# check if the family member name is the same as the parameter before returning nil or the family member.
				if (fam_mem.father_name == member.name || fam_mem.mother_name == member.name) && fam_mem.gender == "Female"
					member_array << fam_mem
				end
			end
			return member_array
		end

		def get_brothers(member_name)
			brother_array = []
			if member_name != nil
				member_array = get_siblings(member_name)
				member_array.each do |member|
					if member.gender == "Male"
						brother_array << member
					end
				end
			end
			return brother_array
		end

		def get_siblings_husband(member_name)
			member_array = get_siblings(member_name)
			siblings_husband_array = []
			member_array.each do |member|
				if member.married_to != nil && @family_tree.find_by_name(member.married_to).gender == "Male"
					siblings_husband_array << @family_tree.find_by_name(member.married_to)
				end
			end
			return siblings_husband_array
		end

		def get_sisters(member_name)
			sister_array = []
			if member_name != nil
				member_array = get_siblings(member_name)
				member_array.each do |member|
					if member.gender == "Female"
						sister_array << member
					end
				end
			end
			return sister_array
		end

		def get_siblings_wife(member_name)
			member_array = get_siblings(member_name)
			siblings_wife_array = []
			member_array.each do |member|
				if member.married_to != nil && @family_tree.find_by_name(member.married_to).gender == "Female"
					siblings_wife_array << @family_tree.find_by_name(member.married_to)
				end
			end
			return siblings_wife_array
		end
end