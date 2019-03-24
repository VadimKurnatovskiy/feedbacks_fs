require "rails_helper"

feature "User leaving feedback" do
  include_context "current user signed in"

  before { visit root_path }

  scenario "with a pre-filled name and email" do
    within("form") do
      expect(find_field("Name").value).to eq current_user.full_name
      expect(find_field("Email").value).to eq current_user.email
      fill_in "Text", with: "My feedback."
    end
    click_button "Send feedback"
    expect(page).to have_content "Feedback was successfully send!"
  end
end
