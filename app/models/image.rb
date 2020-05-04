class Image < ApplicationRecord
  belongs_to :post, optional: true
  belongs_to :message,optional: true
  mount_uploader :src, ImageUploader

  validates :src,presence: true

end
