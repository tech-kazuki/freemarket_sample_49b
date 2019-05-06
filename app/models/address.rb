class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user, optional: true
  belongs_to_active_hash :prefecture
  
  validates :postal_code,   presence: true, format: { with: /\A\d{3}-\d{4}\z/, message: '例）123-1234' }
  validates :city,          presence: true
  validates :prefecture_id, presence: true
end
