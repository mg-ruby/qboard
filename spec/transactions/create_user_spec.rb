require 'rails_helper'

describe CreateUser do
  context "validate" do
    context "validation is successful" do
      it "step succeeds" do
        input = { email: "Test User", name: 'Test User', password: 'testpassword2018' }
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
        expect(result.value).to eq({email: ["is missing"], name: ["is missing"], password: ["is missing"]})
      end
    end
  end

  context "persist" do
    let(:repo) { double(:repo) }
    before { allow(subject).to receive(:repo) { repo } }

    it "step is successful" do
      user = double(:user)
      expect(repo).to receive(:create).with(title: "Test User", body: "Body Test User") { user }
      subject.persist({title: "Test User", body: "Body Test User"})
    end
  end
end