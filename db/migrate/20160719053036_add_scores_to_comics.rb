class AddScoresToComics < ActiveRecord::Migration
  def up
    add_column :comics, :score_day, :float, default: 0
    add_column :comics, :score_day_man, :float, default: 0
    add_column :comics, :score_day_women, :float, default: 0
    add_column :comics, :score_month, :float, default: 0
    add_column :comics, :score_month_man, :float, default: 0
    add_column :comics, :score_month_women, :float, default: 0
  end

  def down
    remove_column :comics, :score_day
    remove_column :comics, :score_day_man
    remove_column :comics, :score_day_women
    remove_column :comics, :score_month
    remove_column :comics, :score_month_man
    remove_column :comics, :score_month_women
  end
end
