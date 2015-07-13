class RegisteredApplicationPolicy < ApplicationPolicy

  def show
    scope.where(:id => record.id).exists? && (record.user == user  || user.admin?)
  end

end
