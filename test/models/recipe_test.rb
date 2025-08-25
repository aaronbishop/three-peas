require "test_helper"

class RecipeTest < ActiveSupport::TestCase
  def setup
    @recipe = Recipe.new(name: "Testy Zesty Casserole")
  end

  test "recipe validity" do
    assert @recipe.valid?
  end
=begin
  test "blank recipe name" do
    @recipe = ""
    assert_not @recipe.valid?
  end
=end
end
