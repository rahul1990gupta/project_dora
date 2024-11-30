class CreateEntries < ActiveRecord::Migration[8.0]
  def change
    create_table :entries do |t|
      t.string :title
      t.string :url
      t.datetime :published_at
      t.text :summary
      t.references :feed, null: false, foreign_key: true

      t.timestamps
    end
  end
end
