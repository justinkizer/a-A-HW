require 'rails_helper'

RSpec.describe User, type: :model do

  subject(:user) do
    FactoryGirl.build(:user, name: "KG", password: "2Kings")
  end

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:session_token) }
  it { should validate_presence_of(:password_digest) }

  it { should validate_length_of(:password).is_at_least(6) }

  it { should have_many(:subs) }
  it { should have_many(:posts) }
  it { should have_many(:comments) }

  it "confirms the password" do
    expect(user.is_password?("2Kings")).to be(true)
  end

  it "resets a user's session token" do
    original_token = user.session_token
    user.reset_session_token!
    expect(user.session_token).to_not eq(original_token)
  end

  it "finds the correct user by username and password" do
    user.save
    expect(User.find_by_credentials("KG", "2Kings")).to eq(user)
  end

end
