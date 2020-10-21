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

    def can_create_users
      current_user.permission_class.create_users
      flash.alert = "You dont have permission to create users"
    end

    def can_create_equipment
      current_user.permission_class.create_equipment
      flash.alert = "You dont have permission to create new equipment"
    end

    def can_create_show
      current_user.permission_class.create_show
    end

    def can_book_tech
      if !current_user.permission_class.book_technician
      flash.alert = "You dont have permission to book techs on a show"
      redirect_to request.referrer
      end
    end

    def can_book_equipment
      if !current_user.permission_class.book_equipment
      flash.alert = "You dont have permission to book equipment"
      redirect_to request.referrer
      end
    end

    def bookable
      current_user.permission_class.bookable
    end
end
