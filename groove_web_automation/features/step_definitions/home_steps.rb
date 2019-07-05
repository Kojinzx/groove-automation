Given(/^That i access the website$/) do
  @home.load
  @home.confirm_home_page
end

When(/^I click in 'Sign In'/) do
  @home.access_signin_button
end