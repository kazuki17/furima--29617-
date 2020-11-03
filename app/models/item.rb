class Item < ApplicationRecord
  has_one_attached :image
  validates :text, presence: true
  validates :image, presence: true
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre

  #空の投稿を保存できないようにする
  validates :title, :text, :genre, presence: true

  #選択が「--」のままになっていないか
  with_options numericality: { other_than: 1 } do
    validates :genre_id
  end
end
