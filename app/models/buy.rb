class Buy < ApplicationRecord
    #アソシエーションの定義
    has_one   :item
    has_one    :user
end
