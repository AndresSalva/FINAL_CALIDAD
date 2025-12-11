class CheckoutPage
  include Capybara::DSL

  def set_first_name(first_name)
    find(:css, '#first-name, [data-test="firstName"]').set(first_name)
  end

  def set_last_name(last_name)
    find(:css, '#last-name, [data-test="lastName"]').set(last_name)
  end

  def set_zip_code(zip_code)
    find(:css, '#postal-code, [data-test="postalCode"]').set(zip_code)
  end

  def fill_information(first_name, last_name, zip_code)
    set_first_name(first_name)
    set_last_name(last_name)
    set_zip_code(zip_code)
  end

  def click_continue
    find(:css, '#continue, [data-test="continue"]').click
  end

  def get_error_message
    # Use find to ensure element is present before getting text
    find(:css, '[data-test="error"]').text
  end

  def on_step_one_page?
    page.has_content?('Checkout: Your Information') && current_url.include?('checkout-step-one.html')
  end

  def on_step_two_page?
    page.has_content?('Checkout: Overview') && current_url.include?('checkout-step-two.html')
  end

  def item_in_summary?(product_name)
    page.has_content?(product_name)
  end

  def get_total_amount_text
    # Returning the full text e.g. "Item total: $29.99" to check inclusion
    page.text
  end

  def finish_checkout
    find(:css, '#finish, [data-test="finish"]').click
  end

  def on_complete_page?
    page.has_content?('Thank you for your order') || page.has_content?('CHECKOUT: COMPLETE!')
    current_url.include?('checkout-complete.html')
  end

  def back_home
    find(:css, '#back-to-products, [data-test="back-to-products"]').click
  end
end
