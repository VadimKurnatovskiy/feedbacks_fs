require "rails_helper"

feature "Sending Email" do
  background do
    visit new_feedback_path
    within("form") do
      fill_in "Email", with: "john@example.com"
      fill_in "Name", with: "John Smith"
      fill_in "Text", with: "My feedback."
    end
    click_button "Send feedback"
    open_email("admin@example.com")
  end

  scenario "testing for content" do
    expect(current_email.to).to eq ["admin@example.com"]
    expect(current_email.subject).to eq "Recieved new feedback"
    expect(current_email).to have_content "You recieved a new feedback from"
  end
end
