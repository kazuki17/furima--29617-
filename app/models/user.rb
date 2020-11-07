class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname, presence: true
         validates :encrypted_password, presence: true
         validates :reset_password_token, presence: true
         validates :reset_password_sent_at, presence: true
         validates :last_name, presence: true
         validates :last_name_kana, presence: true
         validates :first_name_kana, presence: true
         validates :birth_date, presence: true
         validates :remember_created_at, presence: true


  #アソシエーションの定義
  has_many   :item
  has_one    :buy
end
