module BuyInfosHelper

   def buy_info_price(buy_info)
       total_price = 0
       buy_info.buy_items.each do |buy_item|
         total_price = total_price + buy_item.buy_count * buy_item.price
       end
       return total_price

   end

end
