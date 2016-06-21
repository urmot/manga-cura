class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.string :description
      t.binary :image
      t.string :url, null: false
      t.integer :score

      t.timestamps null: false
    end
  end
end
