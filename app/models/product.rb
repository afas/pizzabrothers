class Product < ActiveRecord::Base

  scope :pizza, -> { where(category_id: 1)}
  default_scope { order(:product_order) }

  mount_uploader :photo, PhotoUploader

end
