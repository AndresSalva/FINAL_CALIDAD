class CartPage
  include Capybara::DSL

  def item_visible?(product_name)
    page.has_content?(product_name)
  end

  def get_item_count
    all(:css, '.cart_item').count
  end

  def remove_item(product_name)
    formatted_name = product_name.downcase.gsub(' ', '-')
    find(:css, "#remove-#{formatted_name}").click
  end

  def item_removed?(product_name)
    page.has_no_content?(product_name)
  end

  def click_continue_shopping
    # Supporting both ID and data-test using CSS OR
    find(:css, '#continue-shopping, [data-test="continue-shopping"]').click
  end

  def click_checkout
    find(:css, '#checkout, [data-test="checkout"]').click
  end

  def on_page?
    page.has_content?('Your Cart')
  end
end
