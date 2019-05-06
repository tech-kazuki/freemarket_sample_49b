class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user, optional: true
  belongs_to_active_hash :prefecture
  
  validates :family_name,           presence: true, format: { with: /\A[^ -~｡-ﾟ]+\z/ , message: "全角で入力してください" }
  validates :first_name,            presence: true, format: { with: /\A[^ -~｡-ﾟ]+\z/ , message: "全角で入力してください" }
  validates :family_name_katakana,  presence: true, format: { with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/ , message: "全角カタカナで入力してください" }
  validates :first_name_katakana,   presence: true, format: { with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/ , message: "全角カタカナで入力してください" }
  validates :postal_code,           presence: true, format: { with: /\A\d{3}-\d{4}\z/, message: '例）123-1234' }
  validates :city,                  presence: true
  validates :prefecture_id,         presence: true
end
