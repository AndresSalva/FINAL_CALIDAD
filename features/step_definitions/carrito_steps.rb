require_relative '../pages/login_page'
require_relative '../pages/inventory_page'
require_relative '../pages/cart_page'
require_relative '../pages/checkout_page'

Given('Yo estoy logueado en la pagina principal de {string}') do |title|
  @login_page = LoginPage.new
  @login_page.load
  @login_page.login('standard_user', 'secret_sauce')
  
  @inventory_page = InventoryPage.new
  expect(@inventory_page.on_page?).to be true
end

Given('Yo agrego el producto {string} al carrito') do |product_name|
  @inventory_page = InventoryPage.new
  @inventory_page.add_item_to_cart(product_name)
end

Given('Yo navego a la pagina del carrito') do
  @inventory_page = InventoryPage.new
  @inventory_page.go_to_cart
  
  @cart_page = CartPage.new
  expect(@cart_page.on_page?).to be true
end

Then('Yo veo que el producto {string} esta en la lista del carrito') do |product_name|
  @cart_page = CartPage.new
  expect(@cart_page.item_visible?(product_name)).to be true
end

Then('Yo veo que el carrito tiene {string} item(s)') do |count|
  @cart_page = CartPage.new
  expect(@cart_page.get_item_count).to eq(count.to_i)
end

When('Yo hago click en el boton remover del producto {string}') do |product_name|
  @cart_page = CartPage.new
  @cart_page.remove_item(product_name)
end

Then('Yo veo que el producto {string} ya no esta en la lista del carrito') do |product_name|
  @cart_page = CartPage.new
  expect(@cart_page.item_removed?(product_name)).to be true
end

When('Yo hago click en el boton {string}') do |button_text|
  # This generic step handles buttons that might be in different pages
  case button_text
  when "Continue Shopping"
    CartPage.new.click_continue_shopping
  when "Checkout"
    CartPage.new.click_checkout
  when "Continue"
    CheckoutPage.new.click_continue
  when "Finish"
    CheckoutPage.new.finish_checkout
  when "Back Home"
    CheckoutPage.new.back_home
  else
    raise "Button '#{button_text}' not mapped in Page Objects generic step"
  end
end

Then('Yo soy redirigido a la pagina de inventario {string}') do |title|
  # Use have_current_path to wait for URL update, with increased wait time
  expect(page).to have_current_path(/inventory\.html/, wait: 10)
  @inventory_page = InventoryPage.new
  expect(@inventory_page.on_page?).to be true
end

Then('Yo soy redirigido a la pagina de informacion {string}') do |title|
  @checkout_page = CheckoutPage.new
  expect(@checkout_page.on_step_one_page?).to be true
end
