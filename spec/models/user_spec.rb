require 'rails_helper'
describe User do

  # ニックネームがカラ
  describe '#create' do
    it "is invalid without a nickname" do
      user = User.new(nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("is too short (minimum is 1 character)")
    end
  end
  
  # ニックネームが長い
  describe '#create' do
    it "is valid with a nickname that has more than 30 characters" do
      user = User.new(nickname: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      user.valid?
      expect(user.errors[:nickname]).to include("is too long (maximum is 30 characters)")
    end
  end

  # 性がカラ
  describe '#create' do
    it "is invalid without a lastname" do
      user = User.new(lastname: "")
      user.valid?
      expect(user.errors[:lastname]).to include("is too short (minimum is 1 character)")
    end
  end

  # 性が長い
  describe '#create' do
    it "is valid with a lastname that has more than 30 characters" do
      user = User.new(lastname: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      user.valid?
      expect(user.errors[:lastname]).to include("is too long (maximum is 30 characters)")
    end
  end

  # 名がカラ
  describe '#create' do
    it "is invalid without a firstname" do
      user = User.new(firstname: "")
      user.valid?
      expect(user.errors[:firstname]).to include("is too short (minimum is 1 character)")
    end
  end

  # 名が長い
  describe '#create' do
    it "is valid with a firstname that has more than 30 characters" do
      user = User.new(firstname: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      user.valid?
      expect(user.errors[:firstname]).to include("is too long (maximum is 30 characters)")
    end
  end

  # 性カナがカラ
  describe '#create' do
    it "is invalid without a lastname_kana" do
      user = User.new(lastname_kana: "")
      user.valid?
      expect(user.errors[:lastname_kana]).to include("is too short (minimum is 1 character)")
    end
  end

  # 性カナが長い
  describe '#create' do
    it "is valid with a lastname_kana that has more than 30 characters" do
      user = User.new(lastname_kana: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      user.valid?
      expect(user.errors[:lastname_kana]).to include("is too long (maximum is 30 characters)")
    end
  end

  # 名カナがカラ
  describe '#create' do
    it "is invalid without a firstname_kana" do
      user = User.new(firstname_kana: "")
      user.valid?
      expect(user.errors[:firstname_kana]).to include("is too short (minimum is 1 character)")
    end
  end

  # 名カナが長い
  describe '#create' do
    it "is valid with a firstname_kana that has more than 30 characters" do
      user = User.new(firstname_kana: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      user.valid?
      expect(user.errors[:firstname_kana]).to include("is too long (maximum is 30 characters)")
    end
  end

  # 生年月日がカラ
  describe '#create' do
    it "is invalid without a birthday" do
      user = User.new(birthday: "")
      user.valid?
      expect(user.errors[:birthday]).to include("is too short (minimum is 8 characters)")
    end
  end

  # 生年月日が長い
  describe '#create' do
    it "is valid with a birthday that has more than 30 characters" do
      user = User.new(birthday: "2000/12/310")
      user.valid?
      expect(user.errors[:birthday]).to include("is too long (maximum is 10 characters)")
    end
  end

  # 電話番号がカラ
  describe '#create' do
    it "is invalid without a tel_number" do
      user = User.new(tel_number: "")
      user.valid?
      expect(user.errors[:tel_number]).to include("is the wrong length (should be 11 characters)")
    end
  end

  # 電話番号が長い
  describe '#create' do
    it "is valid with a tel_number that has more than 11 characters" do
      user = User.new(tel_number: "090123456789")
      user.valid?
      expect(user.errors[:tel_number]).to include("is the wrong length (should be 11 characters)")
    end
  end

  # 郵便番号がカラ
  describe '#create' do
    it "is invalid without a postal_code" do
      user = User.new(postal_code: "")
      user.valid?
      expect(user.errors[:postal_code]).to include("is the wrong length (should be 8 characters)")
      end
  end

  # 郵便番号が長い
  describe '#create' do
    it "is valid with a postal_code that has more than 11 characters" do
      user = User.new(postal_code: "090123456789")
      user.valid?
      expect(user.errors[:postal_code]).to include("is the wrong length (should be 8 characters)")
    end
  end

  # 都道府県は値で取得するが、文字列が入った場合
  describe '#create' do
    it "is expected to validate numericality of prefecture_id" do
      user = User.new(prefecture_id: "あああ")
      user.valid?
      expect(user.errors[:prefecture_id]).to include("is not a number")
    end
  end

  # 市区町村がカラ
  describe '#create' do
    it "is invalid without a city" do
      user = User.new(city: "")
      user.valid?
      expect(user.errors[:city]).to include("is too short (minimum is 1 character)")
    end
  end
  
  # 市区町村が長い
  describe '#create' do
    it "is valid with a city that has more than 30 characters" do
      user = User.new(city: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      user.valid?
      expect(user.errors[:city]).to include("is too long (maximum is 30 characters)")
    end
  end

  # 番地がカラ
  describe '#create' do
    it "is invalid without a city_block" do
      user = User.new(city_block: "")
      user.valid?
      expect(user.errors[:city_block]).to include("is too short (minimum is 1 character)")
    end
  end
  
  # 番地が長い
  describe '#create' do
    it "is valid with a city_block that has more than 30 characters" do
      user = User.new(city_block: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      user.valid?
      expect(user.errors[:city_block]).to include("is too long (maximum is 30 characters)")
    end
  end
  
end