class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  has_one :address
  has_one :card

  validates :nickname,              presence: true
  validates :email,                 presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i , message: "正しいメールアドレスを入力してください" }
  validates :encrypted_password,    presence: true, length: { minimum: 6 }
  validates :family_name,           presence: true, format: { with: /\A[^ -~｡-ﾟ]+\z/ , message: "全角で入力してください" }
  validates :first_name,            presence: true, format: { with: /\A[^ -~｡-ﾟ]+\z/ , message: "全角で入力してください" }
  validates :family_name_katakana,  presence: true, format: { with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/ , message: "全角カタカナで入力してください" }
  validates :first_name_katakana,   presence: true, format: { with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/ , message: "全角カタカナで入力してください" }
  validates :birthday_year,         presence: true
  validates :birthday_month,        presence: true
  validates :birthday_date,         presence: true
  validates :provider,              presence: true
  validates :uid,                   presence: true

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.encrypted_password = Devise.friendly_token[0,20]
      user.nickname = auth.info.name
    end
  end
  
end
