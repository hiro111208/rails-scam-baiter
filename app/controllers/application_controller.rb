class ApplicationController < ActionController::Base

  $background_path = "https://images.theconversation.com/files/310057/original/file-20200114-151829-sg9hr7.jpg"

  include SimpleCaptcha::ControllerHelpers


  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
