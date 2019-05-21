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

end
