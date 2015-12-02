class Admin::CategoriesController < ApplicationController
  load_and_authorize_resource

  def index
    @categories = Category.paginate page: params[:page], per_page: 10
  end

  def new
  end

  def create
    if @category.save
      flash[:success] = t "add_category_sucessful_message"
      redirect_to admin_categories_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update_attributes category_params
      redirect_to admin_categories_path
    else
      render :edit
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
end
