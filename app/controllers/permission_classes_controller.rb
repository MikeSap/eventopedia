class PermissionClassesController < ApplicationController
    before_action :require_login, :admin?
    
    def index
        @users 
        @permission_classes = @current_user.vendor.permission_classes
    end
    
    def new
        @permission_class = PermissionClass.new
    end

    def create
        @permission_class = PermissionClass.new(pc_params)
        return render :new unless @permission_class.save
        redirect_to vendor_path(current_user.vendor)
    end

    def edit
        @permission_class = PermissionClass.find(params[:id])
    end

    def update
        @permission_class = PermissionClass.find(params[:id])
        @permission_class.update(pc_params)
        redirect_to vendor_path(current_user.vendor)
    end

    def destroy
        PermissionClass.find(params[:id]).destroy
        redirect_to request.referrer
    end

    def set_permissions
        byebug
    end

    private

    def pc_params
        params.require(:permission_class).permit(:title, :vendor_id, :create_users, :create_equipment, :create_show, :book_equipment, :book_technician, :bookable, :admin)
    end
end
