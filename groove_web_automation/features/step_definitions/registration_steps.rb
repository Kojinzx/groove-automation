And(/^Fill with an new e-mail$/) do
    @register.create_email
end

And(/^Fill the information for a new record$/) do
    @register.customer_registration
end

And(/^I Validate the user was successfully created$/) do
    @register.confirm_account
end