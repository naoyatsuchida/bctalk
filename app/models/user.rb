class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

          belongs_to :industry #ユーザーは一つの業界に所属している
          belongs_to :occupation #ユーザーは一つの業界に所属している
          has_many :posts
       
          validates :email,:nickname,:industry_id,:occupation_id ,presence: true
          VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
          validates :email, uniqueness: true,format: { with: VALID_EMAIL_REGEX }
          validates :password,:password_confirmation, length:{minimum:6}         
end
