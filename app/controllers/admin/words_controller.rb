class Admin::WordsController < ApplicationController
  load_and_authorize_resource

  def index
    @words = Word.paginate page: params[:page], per_page: 10
  end

  def new
  end

  def create
    if @word.save
      flash[:success] = t "add_word_sucessful_message"
      redirect_to admin_words_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @word.update_attributes word_params
      flash[:success] = t "edit_word_sucessful_message"
      redirect_to admin_words_path
    else
      render :edit
    end
  end

  def destroy
    @word.destroy
    flash[:success] = t "word_delete_message"
    redirect_to admin_words_path
  end

  private
  def word_params
    params.require(:word).permit :category_id, :content,
      word_answers_attributes: [:id, :content, :correct, :_destroy]
  end
end
