class ApplicationController < ActionController::Base
<<<<<<< HEAD
    before_action :current_user, :require_login
=======
    before_action :current_user
    before_action :require_login

>>>>>>> github/mps_finish_users

    def current_user
      @current_user = (User.find_by(id: session[:user_id]) || User.new)      
    end
  
    def logged_in
      current_user.id != nil
    end
  
    def require_login
      return redirect_to login_path unless logged_in
    end
end
