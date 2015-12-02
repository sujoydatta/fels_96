class Admin::WordsController < ApplicationController
  load_and_authorize_resource

  def new
  end

  def create
    if @word.save
      flash[:success] = t "add_word_sucessful_message"
      redirect_to new_admin_word_path
    else
      render :new
    end
  end

  private
  def word_params
    params.require(:word).permit :category_id, :content,
      word_answers_attributes: [:id, :content, :correct, :_destroy]
  end
end
