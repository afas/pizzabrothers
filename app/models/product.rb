class Product < ActiveRecord::Base

  scope :pizza, -> { where(category_id: 1).order("id DESC")}

  mount_uploader :photo, PhotoUploader


end
