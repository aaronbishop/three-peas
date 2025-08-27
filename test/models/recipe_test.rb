require "test_helper"

class RecipeTest < ActiveSupport::TestCase
  def setup
    @recipe = Recipe.new(name: "Testy Zesty Casserole")
  end

=begin
  test "recipe validity" do
    assert @recipe.valid?
  end
=end
=begin
  test "blank recipe name" do
    @recipe = ""
    assert_not @recipe.valid?
  end
=end
end
