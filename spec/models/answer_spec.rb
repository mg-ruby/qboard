require "rails_helper"

describe Answer do
  context "#owner" do
    it "returns a user" do
      data = { name: "User_1", email: 'test@example.com', password: 'mypassword2018' }
      answer = Answer.new(user: data)
      user = answer.user.name
      expect(user).to eq("User_1")
    end
  end
  context "#questions" do
    it "returns a question" do
      data = { body: "Question", title: 'Title' }
      answer = Answer.new(question: data)
      question = answer.question.title
      expect(question).to eq("Title")
    end
  end
end