class VendorsController < ApplicationController
    skip_before_action :require_login, only: [:new, :create]
    def new
        @vendor = Vendor.new
    end

    def show
        @vendor = Vendor.find(params[:id])
        return redirect_to '/' unless (@vendor == current_user.vendor && current_user.permission_class.admin)
        @permission_classes = PermissionClass.all.where(vendor: @vendor)
    end

    def edit
        @vendor = Vendor.find(params[:id])
        return redirect_to '/' unless (@vendor == current_user.vendor && current_user.permission_class.admin)
    end

    def update
        vendor = Vendor.find(params[:id])
        return render :edit unless vendor.update(vendor_params)
        redirect_to vendor_path(vendor)
    end
    
    def create
        @vendor = Vendor.new(vendor_params)
        return  render :new unless @vendor.save
        @user =  User.new(user_params.merge(vendor: @vendor, permission_class_id: @vendor.permission_classes.first.id))
        return  render :new unless @user.save
        session[:user_id] = @user.id
        redirect_to '/'
    end

    private

    def vendor_params
        params.require(:vendor).permit(:name, :address, :url, :phone_number, :contact_email)
    end

    def user_params
        params.require(:user).permit(:username, :first_name, :last_name, :password, :password_confirmation)
    end

end
