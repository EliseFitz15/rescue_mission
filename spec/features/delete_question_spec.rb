require 'rails_helper'

# Acceptance Criteria
# [ ]- I must be able delete a question from the question edit page
# [✓] - I must be able delete a question from the question details page
# [ ] - All answers associated with the question must also be deleted

feature "As a user
I want to delete a question
So that I can delete duplicate questions" do
  scenario "delete question from question details page" do
    visit 'questions/2'
    expect(page).to have_content("What is ajax?")
    click_link "Delete"
    expect(page).to have_content("Question deleted")
  end
end
