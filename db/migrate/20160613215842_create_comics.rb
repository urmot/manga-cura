class CreateComics < ActiveRecord::Migration
  def change
    create_table :comics do |t|
      t.string :title, null: false
      t.string :description
      t.string :image_url
      t.string :url
      t.integer :score

      t.timestamps null: false
    end
  end
end
