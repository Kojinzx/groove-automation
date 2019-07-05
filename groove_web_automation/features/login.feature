#encoding: utf-8

Feature: Login

	@create_login
	Scenario: Create a new user and validate
		Given That i access the website 
		When I click in 'Sign In'
		And Fill with an new e-mail
		And Fill the information for a new record
		Then I Validate the user was successfully created