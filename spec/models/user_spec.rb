require "rails_helper"

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  it "is valid with attributes" do
    expect(user).to be_valid
  end

  it "is not valid without a name" do
    should { validates_presence_of(:name) }
  end
  it "is not valid without an email" do
    should { validates_presence_of(:email) }
  end
  it "is not valid without a uniquess email" do
    should { validates_uniqueness_of(:email)}
  end
  it "is not valid without a format email" do
    should { validates_format_of(:email)}
  end
  it "is not valid without a password" do
    should { validates_preseance_of(:password_digest) }
  end
end
