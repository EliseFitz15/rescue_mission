require 'rails_helper'

# Acceptance Criteria
# [✓] I must be able to get to this page from the questions index
# [✓] I must see the question's title
# [✓] I must see the question's description
Question.new(title: "What is love?", body: "Baby don't hurt me")
feature "As a user
I want to view a question's details
So that I can effectively understand the question" do
 scenario "user views question details on separate page" do
   visit '/questions'
   click_link "What is love?"
   expect(page).to have_content("What is love?")
   expect(page).to have_content("Baby don't hurt me")

 end
end
