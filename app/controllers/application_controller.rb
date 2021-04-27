class ApplicationController < ActionController::Base
  helper_method require_login
  
  private

  def require_login
    return head(:forbidden) unless session.include? :user_id
  end
end