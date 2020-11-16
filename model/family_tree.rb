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

	def import(csv_data)
		CSV.foreach(csv_data, :headers => true) do |data|
			# Create New Members From Each Line Of The CSV.
			Member.new(data["Name"], data["Gender"], data["Married_to"], data["Father_Name"], data["Mother_Name"], self)
		end
	end
end