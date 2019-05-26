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


	def ranking_younger
	  items_manzirank = Item.joins({:buy_items => {:buy_info => :user}})
      .select("items.*,sum(buy_items.buy_count) as sum_buy_count")
      .where(buy_items: {created_at: Time.now.prev_month.beginning_of_month..Time.now.prev_month.end_of_month})
      .where('users.age':0..18)
      .group("item_id")
      .order("sum(buy_items.buy_count) desc, items.id")

      return items_manzirank
	end


	def ranking_comp
	  items_rank = Item.joins(:buy_items)
      .where(buy_items: {created_at: Time.now.prev_month.beginning_of_month..Time.now.prev_month.end_of_month})
      .group("item_id")
      .order("sum(buy_items.buy_count) desc, items.id")
      .select("items.*,sum(buy_items.buy_count) as sum_buy_count")

      return items_rank
	end

end
