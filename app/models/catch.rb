class Catch < ApplicationRecord
  has_one_attached :image
  has_many :favorites, dependent: :destroy
  belongs_to :user
  has_many :catch_comments, dependent: :destroy
  has_many :notifications, dependent: :destroy
  
  geocoded_by :address;
  after_validation :geocode
  
  def create_notification_like!(current_user)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and post_id = ? and action = ? ", current_user.id, user_id, id, 'like'])
    # いいねされていない場合のみ、通知レコードを作成
    if temp.blank?
      notification = current_user.active_notifications.new(
        post_id: id,
        visited_id: user_id,
        action: 'like'
      )
      # 自分の投稿に対するいいねの場合は、通知済みとする
      if notification.visitor_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end
  end
  
  
  with_options presence: true, on: :publicize do
    validates :fish
    validates :gear
    validates :day
    validates :time
    validates :point
  end
  
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
