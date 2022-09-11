class Catch < ApplicationRecord
   has_one_attached :image
   has_many :favorites, dependent: :destroy
   belongs_to :user
   has_many :catch_comments, dependent: :destroy
   
   validates :fish,presence:true
   validates :gear,presence:true
   validates :day,presence:true
   validates :time,presence:true
   validates :point,presence:true
   
   def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
   end
end
