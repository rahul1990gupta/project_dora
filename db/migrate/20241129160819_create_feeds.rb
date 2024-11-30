class CreateFeeds < ActiveRecord::Migration[8.0]
  def change
    create_table :feeds do |t|
      t.string :url
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
