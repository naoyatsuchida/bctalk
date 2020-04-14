class Group < ApplicationRecord
  has_many :messages,dependet: :destroy
  has_many :users,through: :group_users
  has_many :group_users
end
