require "test_helper"

class UserTest < ActiveSupport::TestCase
  # def setup
  #   @admin   = users(:admin)
  #   @creator = users(:creator)
  #   @reader  = users(:reader)
  # end

  # test "fixtures are valid" do
  #   assert @admin.valid?
  #   assert @creator.valid?
  #   assert @reader.valid?
  # end

  # test "user_role enum works correctly" do
  #   assert @admin.admin?   || @admin.user_role == "admin",   "Admin should map to admin role"
  #   assert @creator.creator? || @creator.user_role == "creator", "Creator should map to creator role"
  #   assert @reader.reader? || @reader.user_role == "reader", "Reader should map to reader role"
  # end

  # ### Email validations
  # test "invalid without email" do
  #   u = User.new(name: "No Email", password: "a" * 20, user_role: :reader)
  #   assert_not u.valid?, "User without email should be invalid"
  # end

  # test "invalid with bad email format" do
  #   u = User.new(name: "Bad Email", email: "not-an-email", password: "a" * 20, user_role: :reader)
  #   assert_not u.valid?, "User with badly formatted email should be invalid"
  # end

  # test "invalid with duplicate email" do
  #   dup = User.new(name: "Duplicate", email: @admin.email, password: "a" * 20, user_role: :reader)
  #   assert_not dup.valid?, "Duplicate email should be invalid"
  # end

  # test "valid with proper email formats" do
  # %w[
  #   user@example.com
  #   USER@foo.COM
  #   first.last@foo.jp
  #   alice+bob@baz.cn
  # ].each do |valid_email|
  #   u = User.new(name: "Valid Email", email: valid_email, password: "a" * 20, user_role: :reader)
  #   assert u.valid?, "#{valid_email.inspect} should be valid"
  #   end
  # end

  # ### Password validations
  # test "invalid with short password" do
  #   u = User.new(name: "Short Pass", email: "short@example.com", password: "short", user_role: :reader)
  #   assert_not u.valid?, "Password shorter than 20 chars should be invalid"
  # end

  # test "valid with long password" do
  #   u = User.new(name: "Long Pass", email: "long@example.com", password: "a" * 20, user_role: :reader)
  #   assert u.valid?, "Password of 20 chars or more should be valid"
  # end

  # ### Associations
  # test "creator associations work" do
  #   assert_includes @creator.recipes.map(&:name), "Chilly Chili", "Creator should have a chili recipe"
  #   assert_equal recipes(:chili), @creator.comments.first.recipe, "Creator's first comment should belong to chili recipe"
  #   assert_equal recipes(:chili), @creator.favorites.first.recipe, "Creator's first favorite should belong to chili recipe"
  # end

  # test "reader associations work" do
  #   assert_includes @reader.recipes.map(&:name), "Taco Tuesday", "Reader should have a tacos recipe"
  #   assert_equal recipes(:tacos), @reader.comments.first.recipe, "Reader's first comment should belong to tacos recipe"
  #   assert_equal recipes(:cake), @reader.favorites.first.recipe, "Reader's first favorite should belong to cake recipe"
  # end

  # test "admin associations work" do
  #   assert_includes @admin.recipes.map(&:name), "You Had Me At Cake", "Admin should have a cake recipe"
  #   assert_equal recipes(:cake), @admin.comments.first.recipe, "Admin's first comment should belong to cake recipe"
  #   assert_equal recipes(:tacos), @admin.favorites.first.recipe, "Admin's first favorite should belong to tacos recipe"
  # end

  # ### JSON serialization
  # test "creator as_json includes id, email, user_role, recipes, comments, and favorites" do
  #   json = @creator.as_json
  #   assert_equal @creator.id, json["id"]
  #   assert_equal @creator.email, json["email"]
  #   assert_equal @creator.user_role, json["user_role"]

  #   # Recipes
  #   recipe_json = json["recipes"].find { |r| r["name"] == "Chilly Chili" }
  #   assert_not_nil recipe_json
  #   assert_equal recipes(:chili).directions.to_s, recipe_json["directions"]

  #   # Comments
  #   comment_json = json["comments"].first
  #   assert_equal comments(:chili_comment).body, comment_json["body"]
  #   assert_equal recipes(:chili).id, comment_json["recipe_id"]

  #   # Favorites
  #   fav_json = json["favorites"].first
  #   assert_equal favorites(:chili_favorite).id, fav_json["id"]
  #   assert_equal recipes(:chili).id, fav_json["recipe_id"]
  # end

  # test "reader as_json includes id, email, user_role, recipes, comments, and favorites" do
  #   json = @reader.as_json
  #   assert_equal @reader.id, json["id"]
  #   assert_equal @reader.email, json["email"]
  #   assert_equal @reader.user_role, json["user_role"]

  #   # Recipes
  #   recipe_json = json["recipes"].find { |r| r["name"] == "Taco Tuesday" }
  #   assert_not_nil recipe_json
  #   assert_equal recipes(:tacos).directions.to_s, recipe_json["directions"]

  #   # Comments
  #   comment_json = json["comments"].first
  #   assert_equal comments(:tacos_comment).body, comment_json["body"]
  #   assert_equal recipes(:tacos).id, comment_json["recipe_id"]

  #   # Favorites
  #   fav_json = json["favorites"].first
  #   assert_equal favorites(:cake_favorite).id, fav_json["id"]
  #   assert_equal recipes(:cake).id, fav_json["recipe_id"]
  # end

  # test "admin as_json includes id, email, user_role, recipes, comments, and favorites" do
  #   json = @admin.as_json
  #   assert_equal @admin.id, json["id"]
  #   assert_equal @admin.email, json["email"]
  #   assert_equal @admin.user_role, json["user_role"]

  #   # Recipes
  #   recipe_json = json["recipes"].find { |r| r["name"] == "You Had Me At Cake" }
  #   assert_not_nil recipe_json
  #   assert_equal recipes(:cake).directions.to_s, recipe_json["directions"]

  #   # Comments
  #   comment_json = json["comments"].first
  #   assert_equal comments(:cake_comment).body, comment_json["body"]
  #   assert_equal recipes(:cake).id, comment_json["recipe_id"]

  #   # Favorites
  #   fav_json = json["favorites"].first
  #   assert_equal favorites(:tacos_favorite).id, fav_json["id"]
  #   assert_equal recipes(:tacos).id, fav_json["recipe_id"]
  # end
end
