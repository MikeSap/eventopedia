class UsersController < ApplicationController

    def create
        @user = User.new(username: flash[:params]["user"]["username"], password: flash[:params]["user"]["password"], password_confirmation: flash[:params]["user"]["password_confirmation"], vendor: Vendor.find_by_name(flash[:params]["vendor"]["name"]), permission_class: Vendor.find_by_name(flash[:params]["vendor"]["name"]).permission_classes.first)
        return  redirect_to '/vendors/new' unless @user.save
        redirect_to login_path
    end

    # private
    
    # def user_params
    #   params.require(:user).permit(:name, :password, :password_confirmation)
    # end

    #this will only work to create user thru new vendor portal and to create owner
end
