class SessionsController < ApplicationController
    before_action :require_login, only: [:index, :home, :destroy]
  
    def index
    end


    def login
    end

    def create
        byebug
      user = User.find_by(name: params['/login'][:username])
      user = user.try(:authenticate, params['/login'][:password])   
      return redirect_to '/login' unless user
      session[:user_id] = user.id
      redirect_to '/'
    end

    def home
     
    end
  
    def destroy
      session.delete :user_id
  
      redirect_to '/'
    end

    def session_params
        #takes in vendor form params[:vendor][:user] and makes it possible to run through create to log them in 
    end

end