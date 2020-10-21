class PermissionClassesController < ApplicationController
    def new

    end

    def create

    end

    def edit

    end

    def update

    end

    def destroy
        PermissionClass.find(params[:id]).destroy
        redirect_to request.referrer
    end

end
