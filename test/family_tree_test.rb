require "minitest/autorun"
require_relative "../model/family_tree"

class FamilyTreeTest < Minitest::Test

  def setup
    member_array = []

    @family_tree = FamilyTree.new("Test")
    Member.new("King Arthur", "Male", "Queen Margret", nil, nil, @family_tree)
  end

 	def test_find_member_class
    assert_instance_of Member, @family_tree.find_by_name("King Arthur")
  end

 	def test_find_member_name
    assert_equal "King Arthur", @family_tree.find_by_name("King Arthur").name
  end

 	def test_find_member_gender
    assert_equal "Male", @family_tree.find_by_name("King Arthur").gender
  end

 	def test_find_member_father_name
    assert_nil @family_tree.find_by_name("King Arthur").father_name
  end

 	def test_find_member_mother_name
    assert_nil @family_tree.find_by_name("King Arthur").mother_name
  end

 	def test_find_member_married_to
    assert_equal "Queen Margret", @family_tree.find_by_name("King Arthur").married_to
  end

 	def test_find_member_not_found
    assert_nil @family_tree.find_by_name("King")
  end


end