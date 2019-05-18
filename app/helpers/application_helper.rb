module ApplicationHelper

	def tax_included(price) #税込価格を計算
		tax_included_price = price * 1.08
		result = tax_included_price.to_i
		return result
	end

end
