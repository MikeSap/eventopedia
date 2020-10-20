class UsersController < ApplicationController

    def create
        @user = User.new(user_params)
        return  redirect_to '/vendors/new' unless @user.save
        session[:user_id] = @user.id
        redirect_to '/'
    end

    private
    
    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation, :vendor_id, :permission_class_id)
    end

end
