require 'rails_helper'

describe CreateAnswer do
  context "validate" do
    context "validation is successful" do
      it "step succeeds" do
        input = { body: "Body Test Answer" }
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
        expect(result.value).to eq({body: ["is missing"]})
      end
    end
  end

  context "persist" do
    let(:repo) { double(:repo) }
    before { allow(subject).to receive(:repo) { repo } }

    it "step is successful" do
      answer = double(:answer)
      expect(repo).to receive(:create).with(body: "Body Test Answer") { answer }
      subject.persist({body: "Body Test Answer"})
    end
  end
end