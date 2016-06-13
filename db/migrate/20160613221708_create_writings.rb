class CreateWritings < ActiveRecord::Migration
  def change
    create_table :writings do |t|
      t.references :book, index: true, foreign_key: true
      t.references :author, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
