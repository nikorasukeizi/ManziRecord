class BuyInfo < ApplicationRecord

	#購入ステータスをenumで管理
	enum buy_status: { 受付: 0, 商品準備中: 1, 出荷済: 2 }
    has_many :buy_items
    belongs_to :user, optional: true

    def total_price
        total_price = 0
        
        buy_items.each do |buy_item|
          total_price = total_price + buy_item.buy_count * buy_item.total_price
        end
    end


end
