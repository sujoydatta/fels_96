class Admin::CategoriesController < ApplicationController
  load_and_authorize_resource

  def index
    respond_to do |format|
      @categories = Category.paginate page: params[:page], per_page: 10
      format.html {}
      format.json {render json: @categories.to_json(only: [:id, :name])}
    end

  end

  def new
  end

  def create
    if @category.save
      @category.create_activity :create, owner: current_user
      CategoryCreateNotification.new(@category.id).create_notification
      ExamNotification.new(@category.id).send_email

      respond_to do |format|
        format.html do
          flash[:success] = t "add_category_sucessful_message"
          redirect_to admin_categories_path
        end
        format.json {render json: {message: t(:add_category_sucessful_message)}}
      end
    else
      respond_to do |format|
        format.html {render :new}
        format.json {render json: {message: t(:unsucessful)}}
      end
    end
  end

  def edit
  end

  def update
    if @category.update_attributes category_params
      respond_to do |format|
        format.html do
          flash[:success] = t "edit_category_sucessful_message"
          redirect_to admin_categories_path
        end
        format.json {render json: {message: t(:edit_category_sucessful_message)}}
      end
    else
      respond_to do |format|
        format.html {render :edit}
        format.json {render json: {message: t(:unsucessful)}}
      end
    end
  end

  def destroy
    @category.destroy
    respond_to do |format|
      format.html do
        flash[:success] = t "category_delete_message"
        redirect_to admin_categories_path
      end
      format.json {render json: {message: t(:category_delete_message)}}
    end
  end

  private
  def category_params
    params.require(:category).permit :name
  end
end
