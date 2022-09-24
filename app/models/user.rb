class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    
    has_many :favorites, dependent: :destroy
    has_many :catches, dependent: :destroy
    has_many :catch_comments, dependent: :destroy
    
    has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
    has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
    # 一覧画面で使う
    has_many :followings, through: :relationships, source: :followed
    has_many :followers, through: :reverse_of_relationships, source: :follower
    
    # フォローしたときの処理
    def follow(user_id)
      relationships.create(followed_id: user_id)
    end
    # フォローを外すときの処理
    def unfollow(user_id)
      relationships.find_by(followed_id: user_id).destroy
    end
    # フォローしているか判定
    def following?(user)
      followings.include?(user)
    end
    
    
    def self.guest    
      find_or_create_by!(email: 'guest@example.com',name: 'ゲスト') do |user|
      user.password = SecureRandom.urlsafe_base64
      #ゲストユーザー作成
      #user.confirmed_at = Time.now 
      #confirmedを利用する場合使用
      end
    end
end
