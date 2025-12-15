class InventoryPage
  include Capybara::DSL

  def add_item_to_cart(product_name)
    formatted_name = product_name.downcase.gsub(' ', '-')
    find(:css, "#add-to-cart-#{formatted_name}").click
  end

  def go_to_cart
    find(:css, '.shopping_cart_link').click
  end

  def on_page?
    page.has_content?('Products') && current_url.include?('inventory.html')
  end
end
