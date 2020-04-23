class Relationship < ApplicationRecord
  belongs_to :user
  belongs_to :follow, class_name: 'User' # class_nameとつけることでfollowクラスではなくUserクラスを参照するようにさせている

  validates :user_id, presence: true
  validates :follow_id, presence: true
end
