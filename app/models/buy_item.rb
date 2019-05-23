class BuyItem < ApplicationRecord
	belongs_to :item
	belongs_to :buy_info
end
