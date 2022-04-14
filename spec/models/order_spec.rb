require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item,user_id: user.id)
    @order = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
  end

  context '購入できる場合' do
    it 'token、post_code、prefecture_id、municipalities、address、building_address、phone_number、user_id、item_idが正しく存在すれば購入できること' do
      expect(@order).to be_valid
    end

    it 'building_addressは存在しなくても購入できること' do
      @order.building_address = nil
      expect(@order).to be_valid
    end
  end

  context '購入できない場合' do
    it 'tokenが空だと購入できないこと' do
      @order.token = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Token can't be blank")
    end

    it 'post_codeが空だと購入できないこと' do
      @order.post_code = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Post code can't be blank")
    end

    it 'post_codeが全角の文字だと購入できないこと' do
      @order.post_code = '郵便番号'
      @order.valid?
      expect(@order.errors.full_messages).to include('Post code is invalid. Enter it as follows (e.g. 123-4567)')
    end

    it 'post_codeが英字だと購入できないこと' do
      @order.post_code = 'postcode'
      @order.valid?
      expect(@order.errors.full_messages).to include('Post code is invalid. Enter it as follows (e.g. 123-4567)')
    end

    it 'post_codeにハイフンが含まれていないと購入できないこと' do
      @order.post_code = 1_234_567
      @order.valid?
      expect(@order.errors.full_messages).to include('Post code is invalid. Enter it as follows (e.g. 123-4567)')
    end

    it 'prefecture_idが空だと購入できないこと' do
      @order.prefecture_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Prefecture can't be blank")
    end

    it 'prefecture_idが1だと購入できないこと' do
      @order.prefecture_id = 1
      @order.valid?
      expect(@order.errors.full_messages).to include("Prefecture can't be blank")
    end

    it 'municipalitiesが空だと購入できないこと' do
      @order.municipalities = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Municipalities can't be blank")
    end

    it 'addressが空だと購入できないこと' do
      @order.address = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Address can't be blank")
    end

    it 'phone_numberが空だと購入できないこと' do
      @order.phone_number = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number can't be blank")
    end

    it 'phone_numberが全角の文字だと購入できないこと' do
      @order.phone_number = '電話番号'
      @order.valid?
      expect(@order.errors.full_messages).to include('Phone number is invalid. Input only number')
    end

    it 'phone_numberが英字だと購入できないこと' do
      @order.phone_number = 'number'
      @order.valid?
      expect(@order.errors.full_messages).to include('Phone number is invalid. Input only number')
    end

    it 'phone_numberにハイフンが含まれていると購入できないこと' do
      @order.phone_number = 0o00 - 123 - 456
      @order.valid?
      expect(@order.errors.full_messages).to include('Phone number is invalid. Input only number')
    end

    it 'phone_numberが10桁未満だと購入できないこと' do
      @order.phone_number = 123
      @order.valid?
      expect(@order.errors.full_messages).to include('Phone number is invalid. Input only number')
    end

    it 'phone_numberが12桁より多いと購入できないこと' do
      @order.phone_number = 123_456_789_101_112
      @order.valid?
      expect(@order.errors.full_messages).to include('Phone number is invalid. Input only number')
    end

    it 'user_id が空だと購入できないこと' do
      @order.user_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("User can't be blank")
    end

    it 'item_idが空だと購入できないこと' do
      @order.item_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Item can't be blank")
    end

  end
end
