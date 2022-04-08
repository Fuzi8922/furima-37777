require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context "新規登録できるとき" do
      it "nickname、email、password、password_confirmation、first_name、last_name、first_name_kana、last_name_kana、birthdayが正しく存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context "新規登録できないとき" do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end

      it "emailが空だと登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end

      it "パスワードが空だと登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end

      it "パスワードが5文字以下だと登録できない" do
        @user.password = "111aa"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end

      it "パスワードが全角文字だと登録できない" do
        @user.password = "１１１ＡＡＡ"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password must be alphanumeric characters"
      end

      it "確認用パスワードと一致していないと登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      it "苗字が空だと登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end

      it "苗字が全角文字でないとと登録できない" do
        @user.last_name = "Yamada"
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't use half-width characters and alphanumeric characters"
      end

      it "名前が空だと登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end

      it "名前が全角文字でないとと登録できない" do
        @user.first_name = "Taro"
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't use half-width characters and alphanumeric characters"
      end

      it "苗字のカナが空だと登録できない" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana can't be blank"
      end

      it "苗字のカナがカタカナでないと登録できない" do
        @user.last_name_kana = "やまだ"
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana must be full-width katakana"
      end

      it "名前のカナが空だと登録できない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end

      it "名前のカナがカタカナでないと登録できない" do
        @user.first_name_kana = "たろう"
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana must be full-width katakana"
      end

      it "誕生日が空だと登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday is invalid"
      end
    end
  end
end


