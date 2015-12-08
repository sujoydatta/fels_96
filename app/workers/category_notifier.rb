class CategoryNotifier
  include Sidekiq::Worker
  def perform category_id
    category = Category.find(category_id)
    Notification.create category_id: category.id
  end
end
