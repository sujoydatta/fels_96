class ExamNotification
  def initialize category_id
    @category = Category.find category_id
  end

  def send_email
    ExamMailer.delay_until(8.hours.from_now).exam_notification @category
  end
end
