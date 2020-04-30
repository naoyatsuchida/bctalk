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

          has_many :relationships
          has_many :followings, through: :relationships, source: :follow #自分がフォローしているuser
          #↑followingsクラスを架空で作り、中間テーブルのrelationを経由している
          #だがこのままだとfollowingsクラスのテーブルを探しに行ってしまうので
          #source: :followとすることで中間テーブルのfollow_idに適応させている

          has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
          has_many :followers, through: :reverse_of_relationships, source: :user
          has_many :comments
          has_many :likes, dependent: :destroy
          has_many :liked_posts, through: :likes, source: :post
          
          

          mount_uploader :image, ImageUploader
          validates :email,:nickname,:industry_id,:occupation_id ,presence: true
          VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
          validates :email, uniqueness: true,format: { with: VALID_EMAIL_REGEX }       

          def follow(other_user)
            unless self == other_user
              self.relationships.find_or_create_by(follow_id: other_user.id)
            end
          end
        
          def unfollow(other_user)
            relationship = self.relationships.find_by(follow_id: other_user.id)
            relationship.destroy if relationship
          end
        
          def following?(other_user)
            self.followings.include?(other_user)
          end

          def already_liked?(post)
            self.likes.exists?(post_id: post)
          end
end
