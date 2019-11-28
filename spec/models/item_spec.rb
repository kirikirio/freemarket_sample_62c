require 'rails_helper'

# RSpec.describe Item, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end
describe Item do
  describe '#create' do
    context 'can save' do

      # すべてのデータがある場合、登録出来る
      it 'is valid with all' do

          expect(FactoryBot.build(:item)).to be_valid
      end

      # brand_idが空でも登録出来る
      it 'is valid without a brand_id' do

          expect(FactoryBot.build(:item, brand_id: nil)).to be_valid
      end

      # nameが40文字以下であれば登録できる
      it 'is valid with a name up to 40 characters' do
        text = 'a' * 40
        item = FactoryBot.build(:item, name: text)
        
        expect(item).to be_valid
      end

      # descriptionが1000文字以下であれば登録できる
      it 'is valid with a description up to 1000 characters' do
        text = 'a' * 1000
        item = FactoryBot.build(:item, description: text)
        
        expect(item).to be_valid
      end

      # priceが300以上であれば登録できる
      it 'is invalid with a price that is more than 300' do
        item = FactoryBot.build(:item, price: 300)
        expect(item).to be_valid
      end

      # priceが9,999,999以下であれば登録できる
      it 'is invalid with a price up to 9999999' do
        item = FactoryBot.build(:item, price: 9999999)
        expect(item).to be_valid
      end

    end

    context 'can not save' do
      # nameがなければ登録できない
      it 'is invalid without a name' do
        item = FactoryBot.build(:item, name: '')
          item.valid?
          expect(item.errors[:name]).to include("can't be blank")
      end
  
      # priceがなければ登録できない
      it 'is invalid without price' do
        item = FactoryBot.build(:item, price: '')
          item.valid?
          expect(item.errors[:price]).to include("can't be blank")
      end

      # descriptionがなければ登録できない
      it 'is invalid without a description' do
        item = FactoryBot.build(:item, description: '')
          item.valid?
          expect(item.errors[:description]).to include("can't be blank")
      end

      # item_status_idがなければ登録できない
      it 'is invalid without a item_status_id' do
        item = FactoryBot.build(:item, item_status_id: '')
          item.valid?
          expect(item.errors[:item_status_id]).to include("can't be blank")
      end

      # sale_status_idがなければ登録できない
      it 'is invalid without a sale_status_id' do
        item = FactoryBot.build(:item, sale_status_id: '')
          item.valid?
          expect(item.errors[:sale_status_id]).to include("can't be blank")
      end

      # item_status_idがなければ登録できない
      it 'is invalid without a size_id' do
        item = FactoryBot.build(:item, item_status_id: '')
          item.valid?
          expect(item.errors[:item_status_id]).to include("can't be blank")
      end

      # delively_status_idがなければ登録できない
      it 'is invalid without a delivery_status_id' do
        item = FactoryBot.build(:item, delivery_status_id: '')
          item.valid?
          expect(item.errors[:delivery_status_id]).to include("can't be blank")
      end

      # prefecture_idがなければ登録できない
      it 'is invalid without a prefecture_id' do
        item = FactoryBot.build(:item, prefecture_id: '')
          item.valid?
          expect(item.errors[:prefecture_id]).to include("can't be blank")
      end

      # category_idがなければ登録できない
      it 'is invalid without a category_id' do
        item = FactoryBot.build(:item, category_id: '')
          item.valid?
          expect(item.errors[:category_id]).to include("can't be blank")
      end

      # delibery_feeがなければ登録できない
      it 'is invalid without a delivery_fee' do
        item = FactoryBot.build(:item, delivery_fee: '')
          item.valid?
          expect(item.errors[:delivery_fee]).to include("can't be blank")
      end

      # nameが41文字以上であれば登録できない
      it 'is invalid with a name that has more than 41 characters' do
        text = 'a' * 41
        item = FactoryBot.build(:item, name: text)
        item.valid?
        expect(item.errors[:name]).to include("is too long (maximum is 40 characters)")
      end

      # descriptionが1001文字以上であれば登録できない
      it 'is invalid with a name that has more than 1001 characters' do
        text = 'a' * 1001
        item = FactoryBot.build(:item, description: text)
        item.valid?
        expect(item.errors[:description]).to include("is too long (maximum is 1000 characters)")
      end

      # priceが文字列であれば登録できない
      it 'is invalid with a price that is string' do
        item = FactoryBot.build(:item, price: 'a')
        item.valid?
        expect(item.errors[:price]).to include("is not a number")
      end

      # priceが300未満であれば登録できない
      it 'is invalid with a price that is less than 300' do
        item = FactoryBot.build(:item, price: 299)
        item.valid?
        expect(item.errors[:price]).to include("must be greater than or equal to 300")
      end

      # priceが10,000,000以上であれば登録できない
      it 'is invalid with a price that is less than 300' do
        item = FactoryBot.build(:item, price: 10000000)
        item.valid?
        expect(item.errors[:price]).to include("must be less than or equal to 9999999")
      end
      
    end
  end
end