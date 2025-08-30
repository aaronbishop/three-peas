require "test_helper"

class RecipeTest < ActiveSupport::TestCase
  # def setup
  #   @chili = recipes(:chili)
  #   @tacos = recipes(:tacos)
  #   @cake  = recipes(:cake)
  # end

  # ### Validity
  # test "fixtures are valid" do
  #   assert @chili.valid?
  #   assert @tacos.valid?
  #   assert @cake.valid?
  # end

  # test "invalid without name" do
  #   r = Recipe.new(directions: "stuff", user: users(:creator))
  #   assert_not r.valid?
  # end

  # test "invalid without directions" do
  #   r = Recipe.new(name: "Nameless Dish", user: users(:creator))
  #   assert_not r.valid?
  # end

  # ### Associations
  # test "belongs to a user" do
  #   assert_equal users(:creator), @chili.user
  #   assert_equal users(:admin), @cake.user
  # end

  # test "has many ingredients" do
  #   assert_equal 2, @chili.ingredients.count
  #   assert_includes @chili.ingredients.map(&:name), "Kidney Beans"
  #   assert_includes @chili.ingredients.map(&:name), "Jalapeños"
  # end

  # test "has many comments" do
  #   assert_equal 1, @chili.comments.count
  #   assert_equal "So good it was... chilling", @chili.comments.first.body
  #   assert_equal users(:creator), @chili.comments.first.user
  # end

  # test "has many favorites" do
  #   assert_equal 1, @tacos.favorites.count
  #   assert_equal users(:admin), @tacos.favorites.first.user
  # end

  # ### Dependent Destroy
  # test "destroying recipe cleans up ingredients, comments, and favorites" do
  #   recipe = recipes(:tacos)
  #   assert_difference("Ingredient.count", -recipe.ingredients.count) do
  #     assert_difference("Comment.count", -recipe.comments.count) do
  #       assert_difference("Favorite.count", -recipe.favorites.count) do
  #         recipe.destroy
  #       end
  #     end
  #   end
  # end

  # ### JSON serialization
  # test "as_json includes top-level attributes" do
  #   json = @chili.as_json

  #   assert_equal @chili.id, json["id"]
  #   assert_equal "Chilly Chili", json["name"]
  #   assert_includes @chili.directions.to_s, "Simmer beans"  # ✅ updated
  #   assert_equal 20, json["prep_time"]
  #   assert_equal 45, json["cook_time"]
  #   assert_equal 6, json["servings"]
  #   assert_equal "https://example.com/spicy-chili", json["url"]
  # end

  # test "as_json includes ingredients" do
  #   json = @tacos.as_json
  #   ing_names = json["ingredients"].map { |i| i["name"] }

  #   assert_includes ing_names, "Ground Cow"
  #   assert_includes ing_names, "Flour Tortillas Are Better"
  # end

  # test "as_json includes comments with nested user" do
  #   json = @cake.as_json
  #   comment = json["comments"].first

  #   assert_equal "Choc full of flavor", comment["body"]
  #   assert_equal users(:admin).id, comment["user"]["id"]
  #   assert_equal users(:admin).email, comment["user"]["email"]
  # end

  # test "as_json includes favorites with user_id" do
  #   json = @chili.as_json

  #   assert json.key?("favorites"), "Favorites should be included in Recipe#as_json"
  #   fav = json["favorites"].first

  #   assert_equal favorites(:chili_favorite).id, fav["id"]
  #   assert_equal favorites(:chili_favorite).user_id, fav["user_id"]
  # end
end
