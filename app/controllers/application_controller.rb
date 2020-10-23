class ApplicationController < ActionController::Base
    before_action :current_user, :users, :permission
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

    def permission
     @permission = @current_user.permission_class
    end

    def admin?
      @current_user.permission_class.admin
    end

    def users
      @users = @current_user.vendor.users
    end

    # def vendor_verification
    #   if current_user.vendor != 
    # end

end
