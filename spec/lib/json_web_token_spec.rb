require 'rails_helper'

describe JsonWebToken do
  let(:user_id) { 1231412 }
  let(:token) { token_generator(user_id) }
  let(:decode_token) { token_decode(token) }

  context "when call encode" do
    it "must not be empty" do
      expect(token).not_to be_empty
    end
  end

  context "when call decode" do
    it "must not be empty" do
      expect(decode_token).not_to be_empty
    end
    it "user id must be the same" do
      expect(decode_token[:user_id]).to eq(user_id)
    end
  end
end
