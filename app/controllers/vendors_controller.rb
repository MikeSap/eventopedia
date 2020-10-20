class VendorsController < ApplicationController

    def new
        @vendor = Vendor.new
    end
    
    def create
        @vendor = Vendor.new(vendor_params)
        return  render :new unless @vendor.save
        @user =  User.new(username: params[:user][:username], password: params[:user][:password], password_confirmation: params[:user][:password_confirmation], vendor: @vendor, permission_class_id: @vendor.permission_classes.first.id)
        return  render :new unless @user.save
        session[:user_id] = @user.id
        redirect_to '/'
    end

    private

    def vendor_params
        params.require(:vendor).permit(:name, :address, :url, :phone_number, :contact_email)
    end

    def user_params(*args)
        params.require(:user).permit(*args)
    end

end
