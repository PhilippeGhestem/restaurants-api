class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
      # scope.where(user: user.id) => je recupere la liste des restos que j'ai crees, collection de ressources propres à l'utilisateur
    end
  end


  def show?
    true
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end

end
