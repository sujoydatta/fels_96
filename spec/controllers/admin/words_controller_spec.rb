require "rails_helper"

describe Admin::WordsController do
  let!(:user){FactoryGirl.create :user}
  before{sign_in user}

  describe "GET #index" do
    before {get :index}
    context "Get index successfully" do
      it {expect(response).to be_success}
      it {expect(response).to render_template :index}
      it {expect(response).to have_http_status :ok}
    end
  end

  describe "GET #show" do
    context "Get index successfully" do
      it {expect(response).to be_success}
      it {expect(response).to have_http_status :ok}
    end
  end
end
