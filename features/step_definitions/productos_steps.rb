require_relative '../pages/login_page'
require_relative '../pages/inventory_page'

Given('estoy logueado en SauceDemo') do
  @login_page = LoginPage.new
  @login_page.load
  @login_page.login(ENV['USER'], ENV['PSW'])

  @inventory_page = InventoryPage.new
  expect(@inventory_page.on_page?).to be true
end

Then('debería ver el producto {string}') do |producto|
  @inventory_page ||= InventoryPage.new
  expect(@inventory_page.product_visible?(producto)).to be true
end

Then('el producto {string} debería mostrar el precio {string}') do |producto, precio|
  @inventory_page ||= InventoryPage.new
  expect(@inventory_page.product_price(producto)).to eq(precio)
end

Then('el producto {string} debería mostrar la descripción {string}') do |producto, descripcion|
  @inventory_page ||= InventoryPage.new
  expect(@inventory_page.product_description(producto)).to eq(descripcion)
end

When('ordeno el catálogo por {string}') do |opcion|
  @inventory_page ||= InventoryPage.new
  @inventory_page.select_sort(opcion)
end

Then('el primer producto debería ser {string}') do |producto|
  @inventory_page ||= InventoryPage.new
  expect(@inventory_page.first_product_name).to eq(producto)
end
