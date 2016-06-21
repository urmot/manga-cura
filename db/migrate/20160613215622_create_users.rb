class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :pass, null: false
      t.string :name, null: false
      t.string :gender
      t.date :birthday
      t.string :email, null: false
      t.boolean :notice_confide

      t.timestamps null: false
    end
  end
end
