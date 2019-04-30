class Image < ApplicationRecord

  belongs_to :product, optional: true

  validates :image, presence: true
end
