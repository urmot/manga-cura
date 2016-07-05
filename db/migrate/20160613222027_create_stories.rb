class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.references :comic, index: true, foreign_key: true
      t.integer :chapter
      t.integer :number, null: false
      t.string :title, null: false
      t.binary :image
      t.string :url, null: false
      t.date :date

      t.timestamps null: false
    end
  end
end
