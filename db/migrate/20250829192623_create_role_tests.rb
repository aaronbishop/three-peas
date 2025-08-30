class CreateRoleTests < ActiveRecord::Migration[8.0]
  def change
    create_table :role_tests do |t|
      t.integer :status

      t.timestamps
    end
  end
end
