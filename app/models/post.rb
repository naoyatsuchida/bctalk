class Post < ApplicationRecord
  has_many :images,dependent: :destroy
  belongs_to :user
  accepts_nested_attributes_for :images

  validates_associated :images,allow_destroy: true
end
