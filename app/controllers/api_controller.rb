class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token


  private

  def current_user
    @user 
  end

  def authenticated?
    authenticate_or_request_with_http_basic {|name, password|
      @user = User.find_by( name: name, password: password)
      @user.present?
    }
  end

end
