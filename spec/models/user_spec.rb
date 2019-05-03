require 'rails_helper'
require 'faker'

describe User do
  describe '#create' do
    it "is invalid without a nickname" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end
  end

  describe '#create' do
    it "is invalid without a email" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end
  end

  describe '#create' do
    it "is invalid without right email" do
      user = build(:user, email: "pppadress.com")
      user.valid?
      expect(user.errors[:email]).to include("正しいメールアドレスを入力してください")
    end
  end

  describe '#create' do
    it "is invalid without a family_name" do
      user = build(:user, family_name: nil)
      user.valid?
      expect(user.errors[:family_name]).to include("can't be blank")
    end
  end

  describe '#create' do
    it "is invalid without a encrypted_password" do
      user = build(:user, encrypted_password: nil)
      user.valid?
      expect(user.errors[:encrypted_password]).to include("can't be blank")
    end
  end

  describe '#create' do
    it "is invalid without family_name of zenkaku" do
      user = build(:user, family_name: "ﾔﾏﾀﾞ")
      user.valid?
      expect(user.errors[:family_name]).to include("全角で入力してください")
    end
  end

  describe '#create' do
    it "is invalid without a first_name" do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end
  end

  describe '#create' do
    it "is invalid without first_name of katakana" do
      user = build(:user, first_name: "ｱﾔ")
      user.valid?
      expect(user.errors[:first_name]).to include("全角で入力してください")
    end
  end

  describe '#create' do
    it "is invalid without a family_name_katakana" do
      user = build(:user, family_name_katakana: nil)
      user.valid?
      expect(user.errors[:family_name_katakana]).to include("can't be blank")
    end
  end

  describe '#create' do
    it "is invalid without a first_name_katakana" do
      user = build(:user, first_name_katakana: nil)
      user.valid?
      expect(user.errors[:first_name_katakana]).to include("can't be blank")
    end
  end

  describe '#create' do
    it "is invalid without a birthday_year" do
      user = build(:user, birthday_year: nil)
      user.valid?
      expect(user.errors[:birthday_year]).to include("can't be blank")
    end
  end

  describe '#create' do
    it "is invalid without a birthday_month" do
      user = build(:user, birthday_month: nil)
      user.valid?
      expect(user.errors[:birthday_month]).to include("can't be blank")
    end
  end

  describe '#create' do
    it "is invalid without a birthday_date" do
      user = build(:user, birthday_date: nil)
      user.valid?
      expect(user.errors[:birthday_date]).to include("can't be blank")
    end
  end

  describe '#create' do
    it "is invalid without katakana of family_name_katakana" do
      user = build(:user, family_name_katakana: "やまだ")
      user.valid?
      expect(user.errors[:family_name_katakana]).to include("全角カタカナで入力してください")
    end
  end

  describe '#create' do
    it "is invalid without katakana of first_name_katakana" do
      user = build(:user, first_name_katakana: "あや")
      user.valid?
      expect(user.errors[:first_name_katakana]).to include("全角カタカナで入力してください")
    end
  end

end