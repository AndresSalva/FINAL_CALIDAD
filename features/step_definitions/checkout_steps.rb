When('Yo ingreso el nombre {string}') do |first_name|
  @checkout_page = CheckoutPage.new
  @checkout_page.set_first_name(first_name)
end

When('Yo ingreso el apellido {string}') do |last_name|
  @checkout_page = CheckoutPage.new
  @checkout_page.set_last_name(last_name)
end

When('Yo ingreso el codigo postal {string}') do |zip_code|
  @checkout_page = CheckoutPage.new
  @checkout_page.set_zip_code(zip_code)
end

Then('Yo veo un mensaje de error {string}') do |error_message|
  @checkout_page = CheckoutPage.new
  actual_error = @checkout_page.get_error_message
  puts "DEBUG: Actual error: '#{actual_error}' vs Expected: '#{error_message}'"
  
  # Normalize whitespace to handle potential non-breaking spaces
  normalized_actual = actual_error.gsub(/[[:space:]]+/, ' ').strip
  normalized_expected = error_message.gsub(/[[:space:]]+/, ' ').strip
  
  expect(normalized_actual).to include(normalized_expected)
end

When('Yo ingreso mis datos validos: Nombre {string}, Apellido {string}, Zip {string}') do |first, last, zip|
  @checkout_page = CheckoutPage.new
  @checkout_page.fill_information(first, last, zip)
end

Then('Yo soy redirigido a la pagina de revision {string}') do |title|
  expect(page).to have_current_path(/checkout-step-two\.html/)
  @checkout_page = CheckoutPage.new
  expect(@checkout_page.on_step_two_page?).to be true
end

When('Yo veo que el producto {string} esta en la lista del checkout') do |product_name|
  @checkout_page = CheckoutPage.new
  expect(@checkout_page.item_in_summary?(product_name)).to be true
end

When('Yo veo el resumen de pago con Item total {string}') do |amount|
  @checkout_page = CheckoutPage.new
  expect(@checkout_page.get_total_amount_text).to include("Item total: $#{amount}")
end

Then('Yo veo el mensaje de orden completada {string}') do |message|
  expect(page).to have_current_path(/checkout-complete\.html/)
  @checkout_page = CheckoutPage.new
  expect(@checkout_page.on_complete_page?).to be true
  expect(page).to have_content(/#{Regexp.quote(message)}/i)
end
