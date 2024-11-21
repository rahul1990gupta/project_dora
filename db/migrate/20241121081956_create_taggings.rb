class CreateTaggings < ActiveRecord::Migration[8.0]
  def change
    create_table :taggings do |t|
      t.timestamps
      t.belongs_to :tag, null: false, foreign_key: true
      t.belongs_to :link, null: false, foreign_key: true
    end
  end
end
