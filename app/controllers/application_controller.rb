class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def after_sign_in_path_for(resource)
    case resource
    when Admin
        admin_root_path
    when Customer
        root
    end
  end
  
  def after_sign_out_path_for(resource)
    if resource == :customer
      root_path
    else
      new_admin_session_path
    end
  end

end
