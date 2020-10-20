class VendorsController < ApplicationController

    def create
        @vendor = Vendor.new(vendor_params)        
        return  redirect_to '/vendors/new' unless @vendor.save
        flash[:params] = params
        redirect_to '/users/create'
    end

    private

    def vendor_params
        params.require(:vendor).permit(:name, :address, :url, :phone_number, :contact_email)
    end
    
end
