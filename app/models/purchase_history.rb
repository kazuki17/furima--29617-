class PurchaseHistory < ApplicationRecord

  has_one    :buys
  belongs_to :user
end
