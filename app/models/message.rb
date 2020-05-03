class Message < ApplicationRecord
  has_many :images, dependent: :destroy
  belongs_to :user
  belongs_to :group


end
