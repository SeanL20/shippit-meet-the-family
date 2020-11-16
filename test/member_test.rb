require "minitest/autorun"
require_relative "../model/family_tree"

class MemberTest < Minitest::Test

  def setup
    member_array = [
      ["King Arthur", "Male", nil, nil, "Queen Margret"],
      ["Queen Margret", "Female", nil, nil, "King Arthur"],
      ["Bill", "Male", "King Arthur", "Queen Margret", "Flora"],
      ["Flora", "Female", nil, nil, "Bill"]
    ]

    @members = []

    family_tree = FamilyTree.new("Test")

    member_array.each do |name, gender, father_name, mother_name, married_to|
      @members << Member.new(name, gender, married_to, father_name, mother_name, family_tree)
    end
  end

 	def test_size
    assert_equal 4, @members.count
  end

 	def test_first_element_name
    assert_instance_of Member, @members[0]
  end

  def test_first_element_name
    assert_equal "King Arthur", @members[0].name
  end

 	def test_first_element_gender
    assert_equal "Male", @members[0].gender
  end

 	def test_first_element_father_name
    assert_nil @members[0].father_name
  end

 	def test_first_element_mother_name
    assert_nil @members[0].mother_name
  end

 	def test_first_element_married_to
    assert_equal "Queen Margret", @members[0].married_to
  end


end