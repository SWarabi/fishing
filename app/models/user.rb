class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    
    has_many :favorites, dependent: :destroy
    has_many :catches, dependent: :destroy
    has_many :catch_comments, dependent: :destroy
    
    def self.guest    
      find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      #ゲストユーザー作成
      #user.confirmed_at = Time.now 
      #confirmedを利用する場合使用
      end
    end
end
