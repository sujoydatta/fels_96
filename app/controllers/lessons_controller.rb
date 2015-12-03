class LessonsController < ApplicationController
  load_and_authorize_resource

  def index
    @lessons = current_user.lessons
  end

  def create
    @lesson.user = current_user
    if @lesson.save
      flash[:success] = t "lesson_started"
      redirect_to edit_lesson_path @lesson
    else
      render :new
    end
  end

  def edit
  end

  def show
    @lesson = Lesson.find params[:id]
  end

  private
  def lesson_params
    params.require(:lesson).permit :category_id, :user_id
  end

  def load_lesson
    @lesson = Lesson.find params[:id]
  end
end
