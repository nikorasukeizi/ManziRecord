module ApplicationHelper

	def tax_included(price) #税込価格を計算
		tax_included_price = price * 1.08
		result = tax_included_price.to_i
		return result
	end

	def devise_error_messages
    return "" if resource.errors.empty?
	    errors_html = ""
	    resource.errors.full_messages.each do |err_msg|
	      errors_html += <<-EOF
	        <div class="error_field alert alert-danger" role="alert">
	          <p class="error_msg">#{err_msg}</p>
	        </div>
	      EOF
	    end
	    errors_html.html_safe
  	end

	def ranking(genre_id)
		items_info = {}
		items_by_genre = {}
		buy_infos = BuyInfo.all
		buy_infos.each do |buy_info|
			buy_info.buy_items.where(created_at: Time.now.prev_month.beginning_of_month..Time.now.prev_month.end_of_month).each do |buy_item|
				if items_info.has_key?(buy_item.item_id)
					items_info[buy_item.item_id] += buy_item.buy_count
				else
					items_info[buy_item.item_id] = buy_item.buy_count
				end
			end
		end
		items_info.each do |key,value|
			item = Item.find(key)
			if items_by_genre.has_key?(item.genre_id)
				items_by_genre[item.genre_id].store(key, value)
			else
				items_by_genre[item.genre_id] = {key => value}
			end
		end
		result = items_by_genre[genre_id].sort{ | a, b | b[1] <=> a[1] }.to_h

		return result
    end

    def ranking_comp(genre)
		items_info = {}
		items_by_genre = {}
		if genre == "young"
			young_users = User.where(age: -Float::INFINITY..18)
			young_users.each do |user|
				buy_infos = user.buy_infos.all
				buy_infos.each do |buy_info|
					buy_info.buy_items.where(created_at: Time.now.prev_month.beginning_of_month..Time.now.prev_month.end_of_month).each do |buy_item|
						if items_info.has_key?(buy_item.item_id)
							items_info[buy_item.item_id] += buy_item.buy_count
						else
							items_info[buy_item.item_id] = buy_item.buy_count
						end
					end
				end
			end
		else
			buy_infos = BuyInfo.all
			buy_infos.each do |buy_info|
				buy_info.buy_items.where(created_at: Time.now.prev_month.beginning_of_month..Time.now.prev_month.end_of_month).each do |buy_item|
					if items_info.has_key?(buy_item.item_id)
						items_info[buy_item.item_id] += buy_item.buy_count
					else
						items_info[buy_item.item_id] = buy_item.buy_count
					end
				end
			end
		end

		result = items_info.sort{ | a, b | b[1] <=> a[1] }.to_h

		return result
	end

end
