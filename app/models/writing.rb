class Writing < ActiveRecord::Base
  belongs_to :comic
  belongs_to :author
end
