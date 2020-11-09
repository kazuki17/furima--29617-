class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 with_options presence: true do
  validates :nickname
  validates :email
  validates :password         format: { with: /\A[a-z0-9]+\z/i, message: "は半角英数で入力してください。"}
  validates :password_confirmation

  name = /\A[ぁ-んァ-ン一-龥]/
  kana = /\A[ァ-ヶー－]+\z/

  validates :last_name,       format: { with: name, message: "is invalid. Input full-width characters."}
  validates :first_name,      format: { with: name, message: "is invalid. Input full-width characters."} 
  validates :last_name_kana,  format: { with: kana, message: "is invalid. Input full-width katakana characters."}
  validates :first_name_kana, format: { with: kana, message: "is invalid. Input full-width katakana characters."}
  validates :birth_date
 end 

  # アソシエーションの定義
  has_many   :items
  has_many   :purchase_historys
end
