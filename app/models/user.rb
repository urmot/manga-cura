class User < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_many :favorites
  has_many :comics, through: :favorites

  has_many :reads
  has_many :stories, through: :reads

  has_one :jobs

  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email,presence: true,
    uniqueness: { case_sensitive: false },
    format: { with: VALID_EMAIL_REGEX }

#  validate :birthday_valid?

#  def birthday_valid?
#    birthday = birthday_before_type_cast
#    return if birthday.blank?
    # YYMMDDで飛んでくる前提
    #birth_ary = birthday.split("-")   ?
    #y = birth_ary[0].to_i   ?
    #m = birth_ary[1].to_i   ?
    #d = birth_ary[2].to_i   ?
#    y = :birthday[0].to_i
#    m = :birthday[1].to_i
#    d = :birthday[2].to_i
#    unless  Date.valid_date?(y, m, d)
#      errors.add(:birthday, "日付の値が不正です")
#    end
#  end

  has_secure_password
  validates :password, presence: true
end
