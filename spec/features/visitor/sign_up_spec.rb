require "rails_helper"

feature "Sign Up" do
  let(:user_attributes) { attributes_for(:user).slice(:full_name, :email, :password, :password_confirmation) }
  let(:registered_user) { User.find_by(email: user_attributes[:email]) }
  before { visit new_user_registration_path }

  def sign_up_with(email, password, conf_password, name)
    fill_in "Enter your email address", with: email
    fill_in "Password", with: password
    fill_in "Password confirmation", with: conf_password
    fill_in "Full name", with: name
    click_button "Sign up"
  end

  def sign_in(email, password)
    fill_in "Email", with: email
    fill_in "Password", with: password
    click_button "Log in"
  end

  scenario "with valid email and password" do

    sign_up_with "valid@example.com", "password", "password", "name"

    expect(page).to have_content("Welcome! You have signed up successfully.")
  end

  scenario "with invalid email" do
    sign_up_with "invalid_email", "password", "password", "name"

    expect(page).to have_content("could not be created")
  end

  scenario "with blank password" do
    sign_up_with "valid@example.com", "", "", "name"

    expect(page).to have_content("could not be created")
  end
  #scenario "Visitor signs up" do
    #visit new_user_registration_path

    #fill_form(:user, user_attributes)
    #click_button "Sign up"

    #expect(page).to have_text("Welcome! You have signed up successfully.")
  #end
end
