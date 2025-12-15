After do
  begin
    Capybara.current_session.driver.quit
  rescue StandardError
  end
end



