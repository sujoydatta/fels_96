require "rails_helper"

describe "lessons/index.html.erb" do
  subject{rendered}
  let!(:user) {FactoryGirl.create :user}
  FactoryGirl.create(:lesson)
  FactoryGirl.create(:category)

  context "request to words controller and index action" do
    it{expect(controller.request.path_parameters[:controller]).to eq "lessons"}
    it{expect(controller.request.path_parameters[:action]).to eq "index"}
  end
end
