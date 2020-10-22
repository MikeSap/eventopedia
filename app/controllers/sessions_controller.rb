class SessionsController < ApplicationController
    skip_before_action :require_login, only: [:login, :create]
    
    def index      
      @equipment_bookings = EquipmentBooking.where(show: current_user.vendor.shows).order('created_at desc').first(5)
      @shows = current_user.vendor.shows.where(start: Date.today..(Date.today + 14.days)).order('start asc').first(5)
      @equipment = current_user.vendor.equipment.order('created_at desc').first(5)
    end    

    def login
      @user = User.new
    end

    def create
      @user = User.find_by(username: params[:user][:username], vendor_id: params[:user][:vendor_id])
      if @user ==  nil
         flash[:alert] = ("You have entered an incorrect Username")
         return redirect_to '/login'   
      end      
      unless @user.try(:authenticate, params[:user][:password])
        flash[:alert] = "Password invalid"
        return redirect_to '/login'   
      end
      session[:user_id] = @user.id
      redirect_to '/'
    end
  
    def destroy
      session.delete :user_id  
      redirect_to '/'
    end

end