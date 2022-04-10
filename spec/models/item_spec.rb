require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context '出品できるとき' do

      it '商品画像、商品名、商品の説明文、カテゴリー、状態、配送料を負担する側、発送元の地域、発送までの日数、価格の情報が正しく存在すれば登録できる' do
        expect(@item).to be_valid
      end

    end

    context '出品できないとき' do

      it 'userが紐付いていないと出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "User must exist"
      end

      it '商品画像がないと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end

      it '商品名がないと登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end

      it '商品の説明がないと登録できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Explanation can't be blank"
      end

      it '商品の値段がないと登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end

      it '商品の値段は全角の文字では登録できない' do
        @item.price = '値段'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not a number'
      end

      it '商品の値段は英字では登録できない' do
        @item.price = 'price'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not a number'
      end

      it '商品の値段は300円未満では登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be greater than or equal to 300'
      end

      it '商品の値段は9,999,999円を超えると登録できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be less than or equal to 9999999'
      end

      it '商品カテゴリーのidがないと登録できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end

      it '商品カテゴリーのidが1だと登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end

      it '商品状態のidがないと登録できない' do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition can't be blank"
      end

      it '商品状態のidが1だと登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition can't be blank"
      end

      it '配送料を負担するユーザーがどちらであるかのidがないと登録できない' do
        @item.shipping_cost_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping cost can't be blank"
      end

      it '配送料を負担するユーザーがどちらであるかのidが1だと登録できない' do
        @item.shipping_cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping cost can't be blank"
      end

      it '発送元地域のidがないと登録できない' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end

      it '発送元地域のidが1だと登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end

      it '発送までの日数のidがないと登録できない' do
        @item.estimated_shipping_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Estimated shipping can't be blank"
      end

      it '発送までの日数のidが1だと登録できない' do
        @item.estimated_shipping_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Estimated shipping can't be blank"
      end
    end
  end
end
