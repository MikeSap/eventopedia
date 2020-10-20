class UsersController < ApplicationController

    def index
        @users = @current_user.vendor.users
    end

    def new        
        @user = User.new
        @permissions = @current_user.vendor.permission_classes
    end

    def create
        @user = User.new(user_params.merge(vendor: @current_user.vendor))
        return  render :new unless @user.save
        redirect_to users_path
    end

    def show        
        @user = User.find(params[:id])  
        @gigs = @user.technician_bookings        
    end

    def edit

    end

    def update

    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to users_path
    end  

    private
    
    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation, :permission_class_id)
    end

end
