require "rails_helper"

describe "admin/categories/new.html.erb" do
  subject {rendered}
  10.times {FactoryGirl.create :category}
  let(:new_category) {Category.new}
  let(:admin){FactoryGirl.create :admin}

  before do
    assign :category, new_category
    assign :categories, Category.all
    render
  end

  context "request to books controller and new action" do
    it {expect(controller.request.path_parameters[:controller])
      .to eq "admin/categories"}
    it {expect(controller.request.path_parameters[:action]).to eq "new"}
  end

  context "have title" do
    it {is_expected.to have_selector "h1"}
    it {is_expected.to include I18n.t("add_category_text")}
  end

  it "render correct form" do
    is_expected.to have_selector "form[id='new_category'][method='post']"
  end
end
