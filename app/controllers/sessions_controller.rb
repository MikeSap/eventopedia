class SessionsController < ApplicationController
    before_action :require_login, only: [:index, :home, :destroy]
  
    def index
    end

    def new

    end

    def login
    end

    def create
      user = User.find_by(username: params[:user][:username])
      return redirect_to '/login' unless user.try(:authenticate, params[:user][:password])   
      session[:user_id] = user.id
      redirect_to '/'
    end

    def vendor_create_login
      byebug     
      session[:user_id] = @user.id
      redirect_to '/'
    end

    def home
     
    end
  
    def destroy
      session.delete :user_id
  
      redirect_to '/'
    end

    # def session_params
    #     #takes in vendor form params[:vendor][:user] and makes it possible to run through create to log them in 
    # end

end