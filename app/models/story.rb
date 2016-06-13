class Story < ActiveRecord::Base
  belongs_to :book

  has_many :reads
  has_many :users, through: :reads
end
