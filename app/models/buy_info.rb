class BuyInfo < ApplicationRecord

    has_many :buy_items
    belongs_to :user, optional: true
end
