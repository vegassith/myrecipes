require 'test_helper'

class ChefTest < ActiveSupport::TestCase
  def setup
    @chef = Chef.new(chefname: "Mark", email: "mark@ymail.com")
  end

  test "chef should be vaild" do
    assert @chef.valid?
  end

  test "chef name should be present" do
    @chef.chefname = " "
    assert_not @chef.valid?
  end

  test "chef name length should not be too long" do
    @chef.chefname = "m" * 41
    assert_not @chef.valid?
  end

  test "chef name length should not be too short" do
    @chef.chefname = "mm"
    assert_not @chef.valid?
  end

  test "email should be present" do
    @chef.email = " "
    assert_not @chef.valid?
  end

  test "email should be within bounds" do
    @chef.email = "m" * 101 + "@example.com"
    assert_not @chef.valid?
  end

  test "email must be unique" do
    dup_chef = @chef.dup
    dup_chef.email = @chef.email.upcase
    @chef.save
    assert_not dup_chef.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@eee.com R_TDD-DS@eee.hello.org user@example.com first.last@eee.au laura+jow@monk.com]
    valid_addresses.each do |va|
      @chef.email = va
      assert @chef.valid?, '#{va.inspect}should be valid'

    end
  end

  test "email valdation should reject invalid addresses" do
    invalid_addresses = %w[user@eee,com R_TDD-DSeee.hello.org user@example]
    invalid_addresses.each do |ia|
      @chef.email = ia
      assert_not @chef.valid?, '#{ia.inspect}should be invalid'

    end

  end

end
