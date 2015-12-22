require "rails_helper"

describe Admin::WordsController do
  let!(:user){FactoryGirl.create :admin}
  let!(:word){FactoryGirl.create :word}

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

  describe 'GET #new' do
    it "assigns a new word to @word" do
      get :new
      expect(assigns(:word)).to be_a_new Word
    end
  end

  describe 'PATCH #update' do
    context "invalid attributes" do
      it "doesn't changes word's attributes" do
        patch :update, id: word.id,
          word: FactoryGirl.attributes_for(:word, content: "")
        word.reload
        expect(word.content).not_to eq ""
      end

      it "re-renders the :edit template" do
        patch :update, id: word.id,
          word: FactoryGirl.attributes_for(:word, content: "")
        expect(response).to render_template :edit
      end
    end
  end


  describe 'DELETE #destroy' do
    it "deletes the contact" do
      expect{
      delete :destroy, id: word.id
      }.to change(Word,:count).by -1
    end

    it "redirects to contacts#index" do
      delete :destroy, id: word.id
      expect(response).to redirect_to admin_words_path
    end
  end
end
