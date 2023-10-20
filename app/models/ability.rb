class Ability
  include CanCan::Ability

  def initialize(user)
    if user
      can :read, Category, user_id: user.id
      can :create, Category, user_id: user.id
      can :read, CashFlow, author_id: user.id
      can :create, CashFlow, author_id: user.id
    else
      cannot :read, Category
    end
  end
end
