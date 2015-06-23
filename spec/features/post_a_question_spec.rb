require "rails_helper"
# Acceptance Criteria
# [ ] I must provide a title that is at least 40 characters long
# [ ] I must provide a description that is at least 150 characters long
# [ ] I must be presented with errors if I fill out the form incorrectly

feature "As a user
I want to post a question
So that I can receive help from others" do
  scenario "Post a question and receive help from other users" do
  visit "/questions/new"
  fill_in "Title", with: "Will I get endorsed at Launch Academy???"
  fill_in "Body", with: "God I HOPE SOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO #crying, #jailbait, #pizzadeliveryguy, is that a 150 charactersssssssssssssssssssssssssssssssssssss????????????????????????????????????????????????????????????????"

  click_button "submit"
  expect(page).to have_content "Will I get endorsed at Launch Academy?"
  expect(page).to have_content "Question asked"
  end

  scenario "A user tries to post a question incorrectly" do
  visit "/questions/new"
  click_button "submit"
  expect(page).to have_content "can't be blank"

  end
end
