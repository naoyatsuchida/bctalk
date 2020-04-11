class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         belongs_to :industry #ユーザーは一つの業界に所属している
         belongs_to :occupation #ユーザーは一つの業界に所属している
         has_many :posts
         #バリデーションは後で
end
