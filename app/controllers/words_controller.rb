class WordsController < ApplicationController
  def index
    @search = Word.search params[:q]
    @words = @search.result.paginate page: params[:page], per_page: 10
  end
end
