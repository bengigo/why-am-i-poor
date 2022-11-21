class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can :manage, Expense, user: user
    can :manage, Group, user:
  end
end
