class EquipmentController < ApplicationController
    before_action :can_create_equipment, only: [:new, :create, :edit, :update, :destroy]

    def index
        @equipment = @current_user.vendor.equipment
    end

    def show
        @equipment = Equipment.find(params[:id])
    end

    def new
        @equipment = Equipment.new
    end

    def create
        @equipment = Equipment.new(equipment_params.merge(vendor: current_user.vendor))
        return render :new unless @equipment.save
        redirect_to equipment_index_path
    end

    def edit
        @equipment = Equipment.find(params[:id])
    end

    def update
        @equipment = Equipment.find(params[:id])
        @equipment.update(equipment_params)
        redirect_to equipment_path(@equipment)
    end

    def destroy
        @equipment = Equipment.find(params[:id])
        @equipment.destroy
        redirect_to equipment_index_path
    end

    private

    def equipment_params
        params.require(:equipment).permit(:name, :manufacturer, :quantity, :category, :sub_category)
    end

    def can_create_equipment
        if !current_user.permission_class.create_equipment
        flash[:alert] = "You dont have permission to access and edit inventory"
        return redirect_to request.referrer unless request.referrer == nil
        redirect_to '/'
        end
    end
end
