require "rails_helper"

describe Admin::CategoriesController do
  let(:user){FactoryGirl.create :admin}
  let!(:category1){FactoryGirl.create :category}
  let!(:category2){FactoryGirl.create :category, name: "git"}
  before{sign_in user}
  describe "GET #index" do
    before {get :index}
    context "get index successfully" do
      it {expect(response).to be_success}
      it {expect(response).to have_http_status 200}
      it {expect(assigns(:categories)).to eq([category1, category2])}
      it {expect(response).to render_template :index}
    end
  end

  describe "GET #new" do
    before {get :new}
    context "Get new successfully" do
      it {expect(response).to render_template :new}
      it {expect(response).to have_http_status :ok}
    end
  end

  describe "PUT #update" do
    it "should redirect to the categories path on succesful save" do
      put :update, {id:category1.id, category: {name: "rails"}}
      response.should redirect_to admin_categories_path
    end
  end
  describe "POST #create" do
    context "create with valid attributes" do
      before {post :create,
        category: FactoryGirl.attributes_for(:category, name: "ruby")}
      it {expect(response).to redirect_to admin_categories_path}
      it {expect(flash[:success]).to eq I18n.t("add_category_sucessful_message")}
    end

    context "create with invalid attributes or name blank" do
      before {post :create, category: FactoryGirl.attributes_for(:category)}
      it {expect(response).to render_template :new}
      it {expect(response).to have_http_status :ok}
    end
  end

  describe "POST #destroy" do
    before {delete :destroy, id: category2}
    context "delete successfully" do
      it {expect(response).to have_http_status 302}
      it {expect(response).to redirect_to admin_categories_path}
      it {expect(flash[:success]).to eq I18n.t("category_delete_message")}
      it {expect(Category.count).to eq 1}
    end
  end
end
