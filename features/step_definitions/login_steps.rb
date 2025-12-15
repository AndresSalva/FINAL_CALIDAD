require_relative '../pages/login_page'

Given('estoy en la página de login de SauceDemo') do
  @login_page = LoginPage.new
  @login_page.load
end

When('inicio sesión con usuario {string} y contraseña {string}') do |user, pass|
  @login_page.login(user, pass)
end

Then('debería ver el título {string}') do |titulo|
  if titulo == 'Products'
    expect(page).to have_current_path(/inventory\.html/, wait: 10)
    expect(page).to have_content('Products')
  else
    # Si en examples pones "Error", validamos que exista mensaje de error
    expect(@login_page.error_message).not_to be_nil
  end
end

Then('debería ver un mensaje de error que contenga {string}') do |texto|
  msg = @login_page.error_message
  expect(msg).not_to be_nil
  expect(msg).to include(texto)
end
