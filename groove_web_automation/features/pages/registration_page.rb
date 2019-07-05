class RegistrationPage < SitePrism::Page

  element :createEmail, :xpath, "//input[@id= 'email_create']"
  element :createEmailButton, :xpath, "//i[@class='icon-user left']"
  element :genderButton, "[name='id_gender']"
  element :firstNameField, :xpath, "//input[@id='customer_firstname']"
  element :lastNameField, :xpath, "//input[@id='customer_lastname']"
  element :passwdField, :xpath, "//input[@id='passwd']"
  element :companyField, :xpath, "//input[@name='company']"
  element :addressField, :xpath, "//input[@name='address1']"
  element :address2Field, :xpath,  "//input[@name='address2']"
  element :cityField, :xpath, "//input[@name='city']"
  element :postcodeField, :xpath, "//input[@name='postcode']"
  element :otherField, :xpath, "//textarea[@name='other']"
  element :phoneField, :xpath, "//input[@name='phone']"
  element :cellphoneField, :xpath, "//input[@name='phone_mobile']"
  element :registerButton, :xpath, "//span[text()='Register']"

  def create_email
    createEmail.click
    createEmail.set(Faker::Internet.email)
    createEmailButton.click
  end

  def customer_registration
    Faker::Config.locale = 'en-US'

    rGender = rand 1..2
    find(:xpath, "//input[@id='id_gender#{rGender}']").click

    firstNameField.set(Faker::Name.first_name)
    lastNameField.set(Faker::Name.last_name)
    passwdField.set(Faker::Internet.password)

    rDay = rand 1..31
    rMonth = rand 1..12
    rYear = rand 1920..2000

    find(:xpath, "//select[@id='days']//option[@value=#{rDay}]").click
    find(:xpath, "//select[@id='months']//option[@value=#{rMonth}]").click
    find(:xpath, "//select[@id='years']//option[@value=#{rYear}]").click

    rCheckbox = rand 1..2
    find(:xpath, "(//div[@class='checkbox'])[#{rCheckbox}]").click

    companyField.set("Groove")

    addressField.set(Faker::Address.street_address)
    address2Field.set(Faker::Address.street_address)
    cityField.set(Faker::Address.city)

    rState = rand 1..50
    find(:xpath, "//select[@id='id_state']//option[@value=#{rState}]").click

    rZip = rand 11111..99999
    postcodeField.set("#{rZip}")
    otherField.set("Hello World")

    phoneField.set(Faker::PhoneNumber.phone_number)
    rCellphoneN = rand 2..9
    rCellphoneX = rand 00..99
    rCellphoneX2 = rand 0000..9999

    cellphoneField.set("#{rCellphoneN}#{rCellphoneX}#{rCellphoneN}#{rCellphoneX}#{rCellphoneX2}")

    registerButton.click
  end

  def confirm_account
    assert_text("Welcome to your account. Here you can manage all of your personal information and orders.")
  end

end
