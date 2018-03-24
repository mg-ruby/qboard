require 'rails_helper'

describe UserSchema do
  let(:result) { subject.call(attributes) }

  context "title is specified" do
    let(:attributes) { { email: "Test User", name: 'Test User', password: 'testpassword2018' } }

    it "is valid" do
      expect(result).to be_success
    end
  end

  context "title is not specified" do
    let(:attributes) { { } }

    it "is invalid" do
      expect(result).to be_failure
      expect(result.errors[:name]).to eq(["is missing"])
      expect(result.errors[:email]).to eq(["is missing"])
      expect(result.errors[:password]).to eq(["is missing"])
    end
  end
end