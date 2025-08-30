class ChangeUsersRoleDefaultToReader < ActiveRecord::Migration[8.0]
  def change
    change_column_default :users, :user_role, from: 0, to: 2
  end
end
