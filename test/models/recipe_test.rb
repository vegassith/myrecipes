require 'test_helper'

class RecipeTest < ActiveSupport::TestCase

  def setup
    @chef = Chef.create(chefname: "bob", email: "bob@example.com")
    @recipe = @chef.recipes.build(name: "chicken parm", summary: "this is my family recipe for chicken parm",
              description: "heat oil, add chicken until golden brown")
  end

  test "recipe should be vaild" do
    assert @recipe.valid?
  end

  test "chef_id should be present" do
    @recipe.chef_id = nil
    assert_not @recipe.valid?
  end

  test "name should be present" do
    @recipe.name = " "
    assert_not @recipe.valid?
  end

  test "name length should not be too long" do
    @recipe.name = "m" * 101
    assert_not @recipe.valid?
  end

  test "name length not be too short" do
    @recipe.name = "mmm"
    assert_not @recipe.valid?
  end

  test "summary should be present" do
      @recipe.summary = " "
    assert_not @recipe.valid?
  end

  test "summary length should not be over 150" do
    @recipe.summary = "m" * 9
    assert_not @recipe.valid?
  end

  test "summary length should not be too short" do
    @recipe.summary = "mmmmm"
    assert_not @recipe.valid?
  end

  test "description should be present" do
    @recipe.description = " "
    assert_not @recipe.valid?
  end

  test "description should not be too long" do
    @recipe.description = "m" * 501
    assert_not @recipe.valid?
  end

  test "description should not be too short" do
    @recipe.description = "m" * 19
    assert_not @recipe.valid?
  end
end