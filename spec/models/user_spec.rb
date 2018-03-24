require "rails_helper"

describe User do
  context "#questions" do
    it "returns a list of questions" do
      data = [
        { title: "Q1", body: "Q1" },
        { title: "Q2", body: "Q2" }
      ]
      user = User.new(questions: data)
      answers = user.questions.map(&:body)
      expect(answers.count).to eq(2)
      expect(answers).to include("Q1")
      expect(answers).to include("Q2")
    end
  end
  context "#answers" do
    it "returns a list of answers" do
      data = [
        { body: "A1" },
        { body: "A2" }
      ]
      question = User.new(answers: data)
      answers = question.answers.map(&:body)
      expect(answers.count).to eq(2)
      expect(answers).to include("A1")
      expect(answers).to include("A2")
    end
  end
end