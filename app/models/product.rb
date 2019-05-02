class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  has_many :likes
  has_many :comments
  has_many :images
  belongs_to :category
  accepts_nested_attributes_for :images
  has_one :brand
  has_one :evalution
  belongs_to :user
  belongs_to_active_hash :prefecture

  validates :name,              presence: true
  validates :price,             presence: true
  validates :prefecture,        presence: true
 
end
