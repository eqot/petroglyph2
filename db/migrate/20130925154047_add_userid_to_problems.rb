class AddUseridToProblems < ActiveRecord::Migration
  def change
    add_column :problems, :user_id, :integer
    add_index :problems, [:user_id, :created_at]
  end
end
