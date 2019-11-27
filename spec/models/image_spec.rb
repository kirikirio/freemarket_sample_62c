require 'rails_helper'


describe Image do
  describe '#create' do
    context 'can save' do
      # image,item_idがある場合登録出来る
    it 'is valid with a image, item_id' do
      # FactoryBot.create(:item)
      expect(FactoryBot.build(:image)).to be_valid
    end
  end

    context 'can not save' do
      # imageがないと保存されない
      it 'is invalid without a image' do
        FactoryBot.create(:item)
        image = FactoryBot.build(:image, image: '')
        image.valid?
        expect(image.errors[:image]).to include("can't be blank") 
      end
    end
    

  end
end