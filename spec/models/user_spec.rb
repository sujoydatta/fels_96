require "rails_helper"
require "cancan/matchers"

describe User do
  it "has a valid factory" do
    FactoryGirl.create(:user).should be_valid
  end

  it "is invalid without an email" do
    FactoryGirl.build(:user, email: nil).should_not be_valid
  end

  it "has many lessons" do
    t = User.reflect_on_association :lessons
    expect(t.macro).to eq :has_many
  end

  it "has many following" do
    t = User.reflect_on_association :following
    expect(t.macro).to eq :has_many
  end

  it "has many followers" do
    t = User.reflect_on_association :followers
    expect(t.macro).to eq :has_many
  end

  describe "has abilities" do
    context "when is an admin account" do
      let(:user){FactoryGirl.create :admin}
      subject(:ability){Ability.new(user)}
      it{is_expected.to be_able_to :manage, Category}
      it{is_expected.to be_able_to :manage, Word}
      it{is_expected.to be_able_to :manage, User}
    end
  end
end
