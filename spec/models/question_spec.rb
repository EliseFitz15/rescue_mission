require 'rails_helper'

test = Question.new(title: "What is rails?", body: "I dont know.")
RSpec.describe Question do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }
end
