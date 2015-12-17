require "rails_helper"
require "cancan/matchers"

describe User do
  it "has a valid factory" do
    FactoryGirl.create(:user).should be_valid
  end

  it {should validate_presence_of :email}
  it {should have_many :lessons}
  it {should have_many :following}
  it {should have_many :followers}

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
