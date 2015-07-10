class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token


  private

  def current_user
    @user 
  end

  def authenticated?
    authenticate_or_request_with_http_basic {|username, password|
      @user = User.find_by( username: username, password: password)
      @user.present?
    }
  end

end
