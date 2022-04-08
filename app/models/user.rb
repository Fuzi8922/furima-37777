class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_format_of :birthday, with: /\A\d{4}-\d{2}-\d{2}\z/

  with_options presence: true do
    validates :nickname
    validates :first_name
    validates :last_name
    validates :first_name_kana
    validates :last_name_kana
  end

  with_options format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'must be full-width katakana' } do
    validates :first_name_kana
    validates :last_name_kana
  end

  with_options format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/,
                         message: "can't use half-width characters and alphanumeric characters" } do
    validates :first_name
    validates :last_name
  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'must be alphanumeric characters'
end
