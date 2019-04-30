class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  has_one :prefecture
  belongs_to :user
  belongs_to_active_hash :prefecture
end
