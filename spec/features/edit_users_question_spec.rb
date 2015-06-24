require 'rails_helper'
# Acceptance Criteria

# [✓] I must provide valid information
# [✓] I must be presented with errors if I fill out the form incorrectly
# [✓] I must be able to get to the edit page from the question details page

feature "As a user
I want to edit a question
So that I can correct any mistakes or add updates" do
   scenario "edit questions that have been submitted" do
    visit '/questions/1'
    click_link 'Edit'
    expect(page).to have_content("Edit Question")
    click_button 'save'
    expect(page).to have_content("Question is updated")
   end
 end
