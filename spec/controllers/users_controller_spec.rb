require "rails_helper"

describe UsersController do
  let!(:user){FactoryGirl.create :user}
  let!(:another_user){FactoryGirl.create :another_user}
  before{sign_in user}

  describe "GET #index" do
    before {get :index}
    context "Get index successfully" do
      it {expect(response).to be_success}
      it {expect(response).to render_template :index}
      it {expect(response).to have_http_status :ok}

      it "populates list of users" do
        expect(assigns(:users)).to include user
        expect(assigns(:users)).to include another_user
      end
    end
  end

  describe "GET #show" do
    context "Get index successfully" do
      it {expect(response).to be_success}
      it {expect(response).to have_http_status :ok}

      it "renders the :show template" do
        get :show, id: user
        expect(response).to render_template :show
      end
    end
  end
end
