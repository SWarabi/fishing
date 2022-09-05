class Favorite < ApplicationRecord
   validates_uniqueness_of :catch_id, scope: :user_id
  belongs_to :user
  belongs_to :catch
  
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
