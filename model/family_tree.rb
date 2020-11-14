require_relative 'member'
require 'csv'

class FamilyTree
	attr_accessor :family_members, :name

	def initialize(name)
		@name = name
		@family_members = []
	end

	def find_by_name(name)
		family_members.each do |fam_mem|
			if fam_mem.name == name
				return fam_mem
			end
		end
		return nil
	end

	def import(csv_data)
		CSV.foreach(csv_data, :headers => true) do |data|
			Member.new(data["Name"], data["Gender"], data["Married_To"], data["Father_Name"], data["Mother_Name"], self)
		end
	end
end