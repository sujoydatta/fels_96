class Admin::CategoriesController < ApplicationController
  before_action :load_category, only: [:destroy]

  def index
    @categories = Category.paginate page: params[:page], per_page: 10
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = t "add_category_sucessful_message"
      redirect_to new_admin_category_path
    else
      render :new
    end
  end

  def destroy
    @category.destroy
    flash[:success] = t "category_delete_message"
    redirect_to admin_categories_path
  end

  private
  def category_params
    params.require(:category).permit :name
  end

  def load_category
    @category = Category.find params[:id]
  end
end
