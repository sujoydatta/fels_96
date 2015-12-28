class LessonDecorator < Draper::Decorator
  delegate_all
  decorates :lesson
  decorates_association :lesson_words

  def lesson_result_show
    if model.lesson_result.nil?
      "0 / #{model.lesson_words.count}"
    else
      "#{model.lesson_result} / #{model.lesson_words.count}"
    end
  end
end
