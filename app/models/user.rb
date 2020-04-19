class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

          belongs_to :industry #ユーザーは一つの業界に所属している
          belongs_to :occupation #ユーザーは一つの業界に所属している
          has_many :posts
          has_many :groups,through: :group_users
          has_many :group_users
          has_many :messages
         
          mount_uploader :image, ImageUploader
          validates :email,:nickname,:industry_id,:occupation_id ,presence: true
          VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
          validates :email, uniqueness: true,format: { with: VALID_EMAIL_REGEX }       
end
