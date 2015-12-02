class User < ActiveRecord::Base
  after_initialize :init_admin

  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :lessons

  class << self
    def from_omniauth auth
      where(auth.slice :provider, :uid).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.name = auth.info.name
      end
    end

    def new_with_session params, session
      if session["devise.user_attributes"]
        new(session["devise.user_attributes"], without_protection: true) do |user|
          user.attributes = params
          user.valid?
        end
      else
        super
      end
    end
  end

  def password_required?
    super && provider.blank?
  end

  def update_with_password params, *options
    if encrypted_password.blank?
      update_attributes params, *options
    else
      super
    end
  end

  private
  def init_admin
    self.admin = false if self.admin.nil?
  end
end
