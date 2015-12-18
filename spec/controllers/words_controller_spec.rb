require "rails_helper"

describe WordsController do
  let!(:word){FactoryGirl.create :word}
  let!(:another_word){FactoryGirl.create :word}

  describe "GET #index" do
    before {get :index}
    it {expect(response).to be_success}
    it {expect(response).to render_template :index}
    it {expect(response).to have_http_status :ok}

    it "populates list of words" do
      expect(assigns(:words)).to include word
      expect(assigns(:words)).to include another_word
    end
  end
end
