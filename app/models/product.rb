class Product < ApplicationRecord

 has_many :likes
 has_many :comments
 has_many :images
 accepts_nested_attributes_for :images
 has_one :category
 has_one :brand
 has_one :evalution
 has_one :prefecture
 belongs_to :user

 validates :name,              presence: true
 validates :price,             presence: true
 validates :prefecture,        presence: true

 extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
 
end
