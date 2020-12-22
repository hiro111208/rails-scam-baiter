class ApplicationController < ActionController::Base
  include SimpleCaptcha::ControllerHelpers
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

end
