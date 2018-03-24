require "rails_helper"

describe Question do
  context "#owner" do
    it "returns a user" do
      data = { name: "User_1", email: 'test@example.com', password: 'mypassword2018' }
      question = Question.new(user: data)
      user = question.user.name
      expect(user).to eq("User_1")
    end
  end
  context "#answers" do
    it "returns a list of answers" do
      data = [
        { body: "Answer_1" },
        { body: "Answer_2" }
      ]
      question = Question.new(answers: data)
      answers = question.answers.map(&:body)
      expect(answers.count).to eq(2)
      expect(answers).to include("Answer_1")
      expect(answers).to include("Answer_2")
    end
  end
end