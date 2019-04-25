class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :email, presence: true
  validates :family_name, presence: true
  validates :first_name, presence: true
  validates :family_name_katakana, presence: true
  validates :first_name_katakana, presence: true
  validates :birthday_year, presence: true
  validates :birthday_month, presence: true
  validates :birthday_date, presence: true
end
