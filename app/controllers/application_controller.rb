class ApplicationController < ActionController::Base
    before_action :current_user

    def current_user
      @user = (User.find_by(id: session[:user_id]) || User.new(username: "you are not logged in."))      
    end
  
    def logged_in
      current_user.id != nil
    end
  
    def require_login
      return redirect_to login_path unless logged_in
    end
end
