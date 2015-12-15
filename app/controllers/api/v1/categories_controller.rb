class Api::V1::CategoriesController < ApplicationController
  load_and_authorize_resource

  def index
    render json: Category.all.map(&:min_json)
  end

  def show
    render json: @category.min_json
  end
end
