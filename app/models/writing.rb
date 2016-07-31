class Writing < ActiveRecord::Base
  self.table_name = "writing"
  belongs_to :comic
  belongs_to :author
end
