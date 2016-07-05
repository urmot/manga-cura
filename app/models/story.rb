class Story < ActiveRecord::Base
  belongs_to :comic

  has_many :reads
  has_many :users, through: :reads
end
