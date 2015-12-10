class ExamNotifier
  include Sidekiq::Worker

  def perform category_id
    category = Category.find category_id
    User.non_admin.each do |user|
      ExamMailer.delay_until(8.hours.from_now).exam_notification category, user
    end
  end
end
