class ApplicationController < ActionController::Base
    before_action :current_user
    before_action :require_login


    def current_user
      @current_user = (User.find_by(id: session[:user_id]) || User.new)      
    end
  
    def logged_in
      current_user.id != nil
    end
  
    def require_login
      return redirect_to login_path unless logged_in
    end

    def bookable
      current_user.permission_class.bookable
    end


end
