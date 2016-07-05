class User < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_many :favorites
  has_many :comics, through: :favorites

  has_many :reads
  has_many :stories, through: :reads

  has_one :jobs

  validates :name, presence: true, length: { maximum: 50 }
  validates :email,presence: true,
    uniqueness: { case_sensitive: false },
    format: { with: VALID_EMAIL_REGEX }
  validates :pass, presence: true
end
