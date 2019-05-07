class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  has_many :likes, dependent: :destroy
  has_many :comments
  has_many :images
  belongs_to :category
  accepts_nested_attributes_for :images
  has_one :evalution
  belongs_to :user
  belongs_to_active_hash :prefecture

  validates :name,          presence: true
  validates :price,         presence: true, format: { with: /\A[0-9]{3,7}\z/ }
  validates :description,   presence: true
  validates :category_id,   presence: true
  validates :product_state, presence: true
  validates :size,          presence: true
  validates :how_long,      presence: true
  
 def like_user(user_id)
  likes.find_by(user_id: user_id)
 end
 
end
