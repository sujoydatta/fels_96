class LessonWordDecorator < Draper::Decorator
  delegate_all
  decorates :lesson_word

  def show_result
    if model.word_answer.nil?
      h.content_tag :code, h.t(:nil)
    else
      model.word_answer.content
    end
  end

  def show_correct
    unless model.word_answer.nil?
      if model.word_answer.correct
        h.content_tag :label, h.t(:correct), class: "text-success"
      else
        h.content_tag :code, h.t(:incorrect)
      end
    end
  end
end
