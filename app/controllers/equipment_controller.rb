class EquipmentController < ApplicationController
    def index
        @equipment = @user.vendor.equipment
    end

    def show
        @equipment = Equipment.find(params[:id])
    end

    def new
        @equipment = Equipment.new
    end

    def create
        @equipment = Equipment.new
    end

    def edit
        @equipment = Equipment.find(params[:id])
    end

    def update
        @equipment = Equipment.find(params[:id])
    end

    def destroy
        @equipment = Equipment.find(params[:id])
    end
end
