class AddStatusToGoals < ActiveRecord::Migration[8.0]
  def change
    add_column :goals, :status, :string, null: false, default: "pending"
  end
end
