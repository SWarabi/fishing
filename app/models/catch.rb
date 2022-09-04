class Catch < ApplicationRecord
   has_one_attached :image
   validates :fish,presence:true
   validates :gear,presence:true
   validates :day,presence:true
   validates :time,presence:true
   validates :point,presence:true
end
