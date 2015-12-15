class CategoriesController < ApplicationController
  def index
    respond_to do |format|
      @categories = Category.paginate page: params[:page], per_page: 10
      format.html {@lesson = Lesson.new}
      format.json {render json: @categories.to_json(only: [:id, :name])}
    end
  end
end
