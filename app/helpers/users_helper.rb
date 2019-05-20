module UsersHelper

	def total_price(user)
		price = 0
		user.items.each do |item|
			price += CartItem.find_by(user_id: @user.id, item_id: item.id).buy_count * tax_included(item.price)
		end
		price += 500 #送料込み
		return price
	end

end
