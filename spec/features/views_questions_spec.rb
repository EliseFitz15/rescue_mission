require 'rails_helper'
# Acceptance Criteria
# [✓] I must see the title of each question
# [✓] I must see questions listed in order, most recently posted first
Question.create(title: "What is rails?", body: "What I paid 13 g's to find out")
Question.create(title: "What is ajax?", body: "But, seriously why?")
Question.create(title: "What is love?", body: "Baby don't hurt me")

feature "As a user
I want to view recently posted questions
So that I can help others" do

  scenario "see title of each question" do
    visit '/questions'

    expect(page).to have_content("What is rails?")
  end

end
