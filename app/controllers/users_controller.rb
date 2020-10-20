class UsersController < ApplicationController

    def index
        @users = @current_user.vendor.users
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
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

    end  

    private
    
    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation, :vendor_id, :permission_class_id)
    end

end
