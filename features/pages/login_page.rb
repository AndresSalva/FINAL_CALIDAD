class LoginPage
  include Capybara::DSL

  def load
    visit('https://www.saucedemo.com/')
  end

  def login(username, password)
    find(:css, '#user-name').set(username)
    find(:css, '#password').set(password)
    find(:css, '#login-button').click
  end
end
