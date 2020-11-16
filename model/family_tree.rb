require_relative 'member'
require 'csv'

class FamilyTree
	attr_accessor :family_members, :name

	def initialize(name)
		@name = name
		@family_members = []
	end

	def find_by_name(member_name)
		family_members.each do |fam_mem|
			# check if the family member name is the same as the parameter before returning nil or the family member.
			if fam_mem.name == member_name
				return fam_mem
			end
		end
		return nil
	end

	def get_mother(member_name)
		member = find_by_name(member_name)
		family_members.each do |fam_mem|
			# check if the family member name is the same as the parameter before returning nil or the family member.
			if fam_mem.name == member.mother_name
				return fam_mem
			end
		end
		return nil
	end

	def get_father(member_name)
		member = find_by_name(member_name)
		family_members.each do |fam_mem|
			# check if the family member name is the same as the parameter before returning nil or the family member.
			if fam_mem.name == member.father_name
				return fam_mem
			end
		end
		return nil
	end

	def get_members_with_same_parents(member_name)
		member = find_by_name(member_name)
		member_array = []
		family_members_without_self = family_members
		family_members_without_self.delete(member)
		family_members_without_self.each do |fam_mem|
			# check if the family member name is the same as the parameter before returning nil or the family member.
			if fam_mem.father_name == member.father_name && fam_mem.mother_name == member.mother_name
				member_array << fam_mem
			end
		end
		return member_array
	end

	def get_siblings(member_name)
		member_array = get_members_with_same_parents(member_name)
		return member_array
	end

	def get_sons(member_name)
		member = find_by_name(member_name)
		member_array = []
		family_members.each do |fam_mem|
			# check if the family member name is the same as the parameter before returning nil or the family member.
			if (fam_mem.father_name == member.name || fam_mem.mother_name == member.name) && fam_mem.gender == "Male"
				member_array << fam_mem
			end
		end
		return member_array
	end

	def get_daughters(member_name)
		member = find_by_name(member_name)
		member_array = []
		family_members.each do |fam_mem|
			# check if the family member name is the same as the parameter before returning nil or the family member.
			if (fam_mem.father_name == member.name || fam_mem.mother_name == member.name) && fam_mem.gender == "Female"
				member_array << fam_mem
			end
		end
		return member_array
	end

	def import(csv_data)
		CSV.foreach(csv_data, :headers => true) do |data|
			# Create New Members From Each Line Of The CSV.
			Member.new(data["Name"], data["Gender"], data["Married_to"], data["Father_Name"], data["Mother_Name"], self)
		end
	end
end