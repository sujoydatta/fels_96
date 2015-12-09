class CategoryCreateNotification
  def initialize category_id
    @category = Category.find(category_id)
  end

  def create_notification
    Notification.create category_id: @category.id
  end
end

