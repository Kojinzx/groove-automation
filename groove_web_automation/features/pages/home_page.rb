class HomePage < SitePrism::Page

  set_url "http://automationpractice.com"

  element :homePage, :xpath, "//a[@title= 'My Store']"
  element :signInButton, :xpath, "//a[@title='Log in to your customer account']"

  def confirm_home_page
    assert_text("Lorem ipsum dolor sit amet")
  end

  def access_signin_button
    signInButton.click
  end

end
