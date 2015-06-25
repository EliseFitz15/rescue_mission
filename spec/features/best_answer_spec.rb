require "rails_helper"

# Acceptance Criteria
# [ ] I must be on the question detail page
# [ ] I must be able mark an answer as the best
# [ ] I must see the "best" answer above all other answers in the answer list

feature "As a user
I want to mark an answer as the best answer
So that others can quickly find the answer" do
  scenario "user views question details page and selects best answer" do
    answer = "This is the answer to question one on this page plus 3 characters"
    visit 'questions/1'
    fill_in "Body", with: answer
    click_button "Submit"
    expect(page).to have_content(answer)
    click_button "Best"
    expect(page).to have_content("Best answer set")
    expect(page).to have_content("This is the best answer")
  end
end
