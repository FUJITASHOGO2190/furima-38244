class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  
  belongs_to :user

  with_options presence: true do
    validates :user_id
    validates :image
    validates :name
    validates :description
    validates :category_id
    validates :condition_id
    validates :shipping_cost_id
    validates :prefecture_id
    validates :scheduled_day_id
   
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end

  
 
end
