class InventoryPage
  include Capybara::DSL

  def on_page?
    page.has_selector?('[data-test="title"]', text: 'Products', wait: 10) &&
      current_url.include?('inventory.html')
  end

  def product_visible?(product_name)
    page.has_selector?('.inventory_item_name', text: product_name, wait: 5)
  end

  def product_price(product_name)
    item = find('.inventory_item', text: product_name)
    item.find('.inventory_item_price').text
  end

  def product_description(product_name)
    item = find('.inventory_item', text: product_name)
    item.find('.inventory_item_desc').text
  end

  def select_sort(option_text)
    find('[data-test="product-sort-container"]').select(option_text)
  end

  def first_product_name
    all('.inventory_item_name').first.text
  end
end
