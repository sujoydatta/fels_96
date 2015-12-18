require "rails_helper"

describe LessonsController do
  let!(:user){FactoryGirl.create :user}
  let!(:lesson){FactoryGirl.create :lesson}

  before{sign_in user}

  describe "GET #index" do
    before {get :index}
    it {expect(response).to be_success}
    it {expect(response).to render_template :index}
    it {expect(response).to have_http_status :ok}
  end
end
