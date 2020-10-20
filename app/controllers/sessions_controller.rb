class SessionsController < ApplicationController
    skip_before_action :require_login, only: [:login, :create]
<<<<<<< HEAD
  
=======

>>>>>>> github/mps_finish_users
    def index
    end    

    def login
      @user = User.new
    end

    def create
      @user = User.find_by(username: params[:user][:username])
      return redirect_to '/login' unless @user.try(:authenticate, params[:user][:password])   
      session[:user_id] = @user.id
      redirect_to '/'
    end
  
    def destroy
      session.delete :user_id  
      redirect_to '/'
    end


end