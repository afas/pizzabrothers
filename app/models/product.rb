class Product < ActiveRecord::Base

  scope :pizza, -> { where(category_id: 1)}


end
