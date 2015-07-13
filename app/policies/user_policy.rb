class UserPolicy < ApplicationPolicy

  def show?
    scope.where(:id => record.id).exists? && (record == user || user.admin?)
  end

end
