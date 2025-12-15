class LoginPage
  include Capybara::DSL

  def load
    #visit('https://www.saucedemo.com/')
    visit('/')
  end

  def login(username, password)
    find('[data-test="username"]').set(username)
    find('[data-test="password"]').set(password)
    find('[data-test="login-button"]').click
    # find('#user-name').set(username)
    # find('#password').set(password)
    # find(:css, '#login-button').click
  end

  def error_message
  return nil unless has_css?('[data-test="error"]', wait: 5)
  find('[data-test="error"]').text
end

end
