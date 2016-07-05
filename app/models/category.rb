class Category < ActiveRecord::Base
  has_many :classifications
  has_many :comics, through: :classifications
end
