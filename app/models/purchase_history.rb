class PurchaseHistory < ApplicationRecord
  has_one    :item
  has_one    :buys
  belongs_to :user
end
