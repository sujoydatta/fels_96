class User < ActiveRecord::Base
  after_initialize :init_admin

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :lessons

  private
  def init_admin
    self.admin = false if self.admin.nil?
  end
end
