require 'rails_helper'

describe CreateQuestion do
  context "validate" do
    context "validation is successful" do
      it "step succeeds" do
        input = { title: "Test Question", body: "Body Test Question" }
        result = subject.validate(input)
        expect(result).to be_success
        expect(result.value).to eq(input)
      end
    end

    context "validation fails" do
      it "step fails" do
        input = { }
        result = subject.validate(input)
        expect(result).to be_failure
        expect(result.value).to eq({title: ["is missing"], body: ["is missing"]})
      end
    end
  end

  context "persist" do
    let(:repo) { double(:repo) }
    before { allow(subject).to receive(:repo) { repo } }

    it "step is successful" do
      question = double(:question)
      expect(repo).to receive(:create).with(title: "Test Question", body: "Body Test Question") { question }
      subject.persist({title: "Test Question", body: "Body Test Question"})
    end
  end
end