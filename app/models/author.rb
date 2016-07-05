class Author < ActiveRecord::Base
  has_many :writings
  has_many :comics, through: :writings
end
