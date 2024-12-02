class CreateDishes < ActiveRecord::Migration[8.0]
  def change
    create_table :dishes do |t|
      t.string :name
      t.string :meal_type
      t.string :season

      t.timestamps
    end
  end
end
