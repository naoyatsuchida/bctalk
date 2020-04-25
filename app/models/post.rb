class Post < ApplicationRecord
  has_many :images,dependent: :destroy
  belongs_to :user
  accepts_nested_attributes_for :images
  has_many :likes
  has_many :liked_users, through: :likes, source: :user

  validates_associated :images,allow_destroy: true

  def self.search(word)
    if word
      Post.where('title  LIKE(?)', "%#{word}%")
    else
      Post.all
    end

  end
end
