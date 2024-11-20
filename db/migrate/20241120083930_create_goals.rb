class CreateGoals < ActiveRecord::Migration[8.0]
  def change
    create_table :goals do |t|
      t.string :title
      t.string :type
      t.date :end_date
      t.belongs_to :user, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
