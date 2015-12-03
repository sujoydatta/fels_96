class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new
    if user.admin?
      can :manage, :all
    else
      can :read, :all
      can [:update, :destroy], User, id: user.id
      can [:create, :edit], Lesson
    end
  end
end
