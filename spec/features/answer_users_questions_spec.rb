require "rails_helper"
# Acceptance Criteria
# [✓] I must be on the question detail page
# [✓] I must provide a description that is at least 50 characters long
# [✓] I must be presented with errors if I fill out the form incorrectly

feature "As a user
I want to answer another user's question
So that I can help them solve their problem" do
  scenario "User submits an answer to a question" do
    visit 'questions/1'
    fill_in "Body", with: "This is an answer to you question and now you have all the answers that you need so stop asking questions."
    click_button "Submit"
    expect(page).to have_content("This is an answer")
  end

  scenario "User submits an answer thats too short" do
    visit 'questions/1'
    fill_in "Body", with: "This isnt long enough"
    click_button "Submit"
    expect(page).to have_content("too short")
  end
end
