class Book < ActiveRecord::Base
  has_many :favorites
  has_many :users, through: :favorites

  has_many :writings
  has_many :authors, through: :writings

  has_many :classifications
  has_many :categories, through: :classifications

  has_many :stories, dependent: :destroy

end
