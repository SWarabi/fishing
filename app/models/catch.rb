class Catch < ApplicationRecord
  has_one_attached :image
  has_many :favorites, dependent: :destroy
  belongs_to :user
  has_many :catch_comments, dependent: :destroy
  
  geocoded_by :address;
  after_validation :geocode
  
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
